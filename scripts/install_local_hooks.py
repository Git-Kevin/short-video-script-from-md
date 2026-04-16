from __future__ import annotations

from pathlib import Path
import os
import shutil
import subprocess
import sys


REPO_ROOT = Path(__file__).resolve().parent.parent
HOOKS_DIR = REPO_ROOT / ".githooks"
CACHE_DIR = REPO_ROOT / ".cache" / "pre-commit"
HOOK_PATH = HOOKS_DIR / "pre-commit"


def resolve_git_path() -> str:
    git_path = shutil.which("git")
    if git_path:
        return git_path

    if os.name == "nt":
        candidates = (
            r"D:\Program Files\Git\cmd\git.exe",
            r"C:\Program Files\Git\cmd\git.exe",
            r"C:\Program Files\Git\bin\git.exe",
        )
        for candidate in candidates:
            if Path(candidate).exists():
                return candidate

    raise SystemExit("git executable not found. Install Git first.")


def ensure_pre_commit() -> None:
    try:
        __import__("pre_commit")
    except ModuleNotFoundError as exc:
        raise SystemExit(
            "pre_commit is not installed for this Python. "
            "Run `python -m pip install pre-commit` and try again."
        ) from exc


def write_hook(python_path: str) -> None:
    HOOKS_DIR.mkdir(parents=True, exist_ok=True)
    CACHE_DIR.mkdir(parents=True, exist_ok=True)

    hook_body = """#!__PYTHON_PATH__
from pathlib import Path
import os
import sys

from pre_commit.main import main as pre_commit_main

hook_path = Path(__file__).resolve()
repo_root = hook_path.parent.parent
os.chdir(repo_root)
os.environ.setdefault("PRE_COMMIT_HOME", str(repo_root / ".cache" / "pre-commit"))
Path(os.environ["PRE_COMMIT_HOME"]).mkdir(parents=True, exist_ok=True)

args = [
    "hook-impl",
    "--config=.pre-commit-config.yaml",
    "--hook-type=pre-commit",
    f"--hook-dir={hook_path.parent}",
    "--",
    *sys.argv[1:],
]

raise SystemExit(pre_commit_main(args))
""".replace("__PYTHON_PATH__", python_path.replace("\\", "/"))

    with HOOK_PATH.open("w", encoding="utf-8", newline="\n") as hook_file:
        hook_file.write(hook_body)


def configure_git(git_path: str) -> None:
    subprocess.run(
        [git_path, "config", "core.hooksPath", ".githooks"],
        cwd=REPO_ROOT,
        check=True,
    )


def main() -> int:
    git_path = resolve_git_path()
    ensure_pre_commit()
    write_hook(sys.executable)
    configure_git(git_path)

    print(f"Installed local pre-commit hook at {HOOK_PATH}")
    print("Configured core.hooksPath=.githooks")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
