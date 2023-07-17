# Download a specific version of Node/NPM and install it in the path.

$nodeUrl = "https://nodejs.org/dist/v18.16.1/node-v18.16.1-win-x64.zip"
$nodefolder = $PSScriptRoot + "\.bin"

if(!(Test-Path $nodefolder)) {
    New-Item -ItemType Directory -Force -Path $nodefolder
}

$nodexepath = Get-ChildItem "node.exe" -Path $nodefolder -Recurse
if($null -eq $nodexepath) {
    if(-not (Test-Path ($nodefolder + "\node.zip"))) {
        Write-Host "Downloading node.js from $nodeUrl"
        Invoke-WebRequest -Uri $nodeUrl -OutFile ($nodefolder + "\node.zip")
    }
    Expand-Archive -Path ($nodefolder + "\node.zip") -DestinationPath $nodefolder
    $nodexepath = Get-ChildItem "node.exe" -Path $nodefolder  -Recurse
    if($null -eq $nodexepath) {
        throw "Failed to download and extract node.exe"
    }
}

$env:PATH = $nodexepath.Directory.FullName + ";" + $env:PATH

echo $nodexepath.Directory.FullName
node --version





