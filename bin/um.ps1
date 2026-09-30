[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$CommandArgs
)
$RootDir = (Resolve-Path "$PSScriptRoot\..").Path
$oldPythonPath = $env:PYTHONPATH
$env:PYTHONPATH = "$RootDir;$env:PYTHONPATH"
try {
    & py -m um @CommandArgs
} finally {
    $env:PYTHONPATH = $oldPythonPath
}
