$ErrorActionPreference = "Stop"

$pythonCommand = Get-Command python -ErrorAction Stop
$pythonPath = $pythonCommand.Source
$scriptPath = Join-Path $PSScriptRoot "install_local_hooks.py"

& $pythonPath $scriptPath
