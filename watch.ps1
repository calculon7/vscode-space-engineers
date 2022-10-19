param ($filepath)

$ErrorActionPreference = 'Stop'

# get input file
if (-not $filepath) {
    Write-Output 'input filepath not provided'
    exit 1
}

if (-not (Test-Path $filepath)) {
    Write-Output 'input file not found'
    exit 2
}

$file = Get-Item $filepath
if (-not ($file.Extension -ieq '.cs')) {
    Write-Output 'input file invalid type'
    exit 3
}

Write-Output "watching file for changes: $filepath"
Write-Output "(ctrl+c to stop)"

$lastHash = ''

while ($true) {
    $newHash = (Get-FileHash $filepath -Algorithm MD5).Hash

    # if file change detected
    if ($newHash -ne $lastHash) {
        & ./deploy.ps1 $filepath || exit 4
        $lastHash = $newHash
    }

    Start-Sleep -Milliseconds 500
}