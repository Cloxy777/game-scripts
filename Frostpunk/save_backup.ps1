# GLOBAL VARIABLES
$savesPath = 'E:\Games\Steam\userdata\402463438\323190\remote\saves'
$saveName = "A New Home - Survivor Mode.save"
$scenarioName = "New-Home"


# ex. by timestamp     save_backup.ps1
# ex. by name          save_backup.ps1 0001

# use first argument or timestamp.
$timeStamp = (Get-Date).ToString('yyyyMMdd_hhmmss')
$name = if ($args.count -eq 0) { $timeStamp } else { [string]$args[0] }

$backupName = "backup_$name"
$destinationPath = "$savesPath\$scenarioName\$backupName"

# create destination folder.
if (-Not(Test-Path $destinationPath)) {  
    
    New-Item -Path $destinationPath -ItemType Directory -Force
}

[System.IO.File]::Copy("$savesPath\$saveName", "$destinationPath\$saveName", $true);