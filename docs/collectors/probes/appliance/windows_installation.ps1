$latestRelease = Invoke-WebRequest -Uri "https://api.github.com/repos/infrasonar/appliance-installer/releases/latest" -UseBasicParsing | ConvertFrom-Json
$downloadUrl = ($latestRelease.assets | Where-Object {$_.name -like "*appliance-installer-windows-amd64*"} | Select-Object -ExpandProperty browser_download_url)
$tempDir = [System.IO.Path]::GetTempPath() + (Get-Random -Minimum 1000 -Maximum 9999) # Add random number to avoid collisions
New-Item -ItemType Directory -Path $tempDir | Out-Null # Suppress output
# Download the ZIP file to the temporary directory
$zipFile = Join-Path -Path $tempDir -ChildPath "appliance-installer.zip"


Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile -UseBasicParsing
Expand-Archive -Path $zipFile -DestinationPath $tempDir -Force

$executablePath = Join-Path -Path $tempDir -ChildPath "appliance-installer.exe"
& $executablePath
Write-Output $executablePath
#Remove-Item -Path $tempDir -Recurse -Force