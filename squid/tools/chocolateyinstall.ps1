﻿Install-ChocolateyZipPackage "$env:chocolateyPackageName" 'http://squid.acmeconsulting.it/download/squid-2.6.STABLE22-bin-DELAYP.zip' "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" -Checksum 'e805fc803739d37e6c852ef1456bace0ece08d85599484414047617976f1e954' -ChecksumType 'sha256'
