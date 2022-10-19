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

# get file content in script region
$match = $(Get-Content $file -Raw) -match '(?s)#region script\s*(.*)\s*#endregion script'
if (-not $match) {
    Write-Output 'could not parse script content'
    exit 4
}

$exportedScriptContent = $Matches[1]

# format script
$exportedScriptContent = $exportedScriptContent -replace '(?m)^ {8}', ''  # remove extra indent
$exportedScriptContent = $exportedScriptContent.trim()

# create directories
$seScriptPath = "$env:USERPROFILE/AppData/Roaming/SpaceEngineers/IngameScripts/local"

$newScriptDir = Join-Path $seScriptPath $file.BaseName
if (-not (Test-Path $newScriptDir)) {
    New-Item $newScriptDir -ItemType Directory
}

# get or create new file
$newScriptPath = Join-Path $newScriptDir 'Script.cs'

if (Test-Path $newScriptPath) {
    $newScript = Get-Item $newScriptPath
}
else {
    $newScript = New-Item $newScriptPath
}

# write file content
Set-Content $newScript $exportedScriptContent

# time now
$now = (Get-Date).ToString('HH:mm:ss')

Write-Output "[$now] deployed successfully"
