$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://github.com/ValdikSS/GoodbyeDPI/releases/download/0.2.2/goodbyedpi-0.2.2.zip'

  softwareName  = 'goodbyedpi*'

  checksum      = '00a2f8b99cd817f8c7fc4c449033015f039d18af213de78cb66bf202277c0628'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Get-ChildItem $toolsPath -include *.sys -Recurse | % { sc "$_.ignore" '' }

$appPath = Join-Path -Resolve $packageArgs.unzipLocation -ChildPath "${env:ChocolateyPackageName}*"
Start-ChocolateyProcessAsAdmin -ExeToRun $(Join-Path $appPath 'service_install_russia_blacklist.cmd')
