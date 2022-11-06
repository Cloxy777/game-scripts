. "..\detect-steam-game-saves.ps1"

$savesPath = Get-SavesPath frostpunk
$saveName = "A New Home - Survivor Mode.save"
$scenarioName = "New-Home"


# ex. load lastest      load_backup.ps1
# ex. load by name      load_backup.ps1 0001

# use first argument or latest.
$name = [string]$args[0]
$backupName = "backup_$name"

if ($name -eq ''){
    $latestSave = Get-ChildItem -Path "$savesPath\$scenarioName" -Recurse -Filter *.save | 
        Sort-Object LastWriteTime -Descending | 
        Select-Object -First 1
    $backupName = $latestSave.Directory.Name
}

$destinationPath = "$savesPath\$scenarioName\$backupName"

# check if save exists.
if (-Not(Test-Path $destinationPath)) {    
    Write-Host "No $backupName save"
    exit
}

[System.IO.File]::Copy("$destinationPath\$saveName", "$savesPath\$saveName", $true);