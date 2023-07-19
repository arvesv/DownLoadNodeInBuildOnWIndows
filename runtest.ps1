# Download a specific version of Node/NPM and install it in the path (for this script only)

# The node version we have chosen
$nodeUrl = "https://nodejs.org/dist/v18.16.0/node-v18.16.0-win-x64.zip"
           
# The folder where we will download and extract the node.exe (added to .gitignore)
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

node --version
npm install
npm test




