$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$appPath = Join-Path -Resolve $toolsDir -ChildPath "${env:ChocolateyPackageName}*"
Start-ChocolateyProcessAsAdmin -ExeToRun $(Join-Path $appPath 'service_remove.cmd') -ValidExitCodes @(0, 1060)