$ErrorActionPreference = "Stop"

function Resolve-GitPath {
    $gitCommand = Get-Command git -ErrorAction SilentlyContinue
    if ($gitCommand) {
        return $gitCommand.Source
    }

    $candidates = @(
        "D:\\Program Files\\Git\\cmd\\git.exe",
        "C:\\Program Files\\Git\\cmd\\git.exe",
        "C:\\Program Files\\Git\\bin\\git.exe"
    )

    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath $candidate) {
            return $candidate
        }
    }

    throw "git.exe not found. Install Git first."
}

$gitPath = Resolve-GitPath
$pythonCommand = Get-Command python -ErrorAction Stop
$pythonPath = $pythonCommand.Source

& $pythonPath -c "import pre_commit" | Out-Null
if ($LASTEXITCODE -ne 0) {
    throw "Python can run, but the pre_commit module is not installed in $pythonPath."
}

$repoRoot = (& $gitPath rev-parse --show-toplevel).Trim()
if (-not $repoRoot) {
    throw "Could not resolve repository root."
}

$hooksDir = Join-Path $repoRoot ".githooks"
$cacheDir = Join-Path $repoRoot ".cache\\pre-commit"
$hookPath = Join-Path $hooksDir "pre-commit"

New-Item -ItemType Directory -Force -Path $hooksDir | Out-Null
New-Item -ItemType Directory -Force -Path $cacheDir | Out-Null

$pythonShebang = $pythonPath.Replace("\", "/")
$hookBody = @"
#!$pythonShebang
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
"@

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($hookPath, $hookBody, $utf8NoBom)

& $gitPath config core.hooksPath .githooks

Write-Host "Installed local pre-commit hook at $hookPath"
Write-Host "Configured core.hooksPath=.githooks"
