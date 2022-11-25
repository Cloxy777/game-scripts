Param(
    [Parameter(Mandatory)] 
    [ValidateSet("Hamlet","Dungeon")] 
    [string]$gameEnvironment,
     
    [Parameter(Mandatory)] 
    [ValidateSet("profile_1","profile_2","profile_3","profile_4","profile_5","profile_6","profile_7","profile_8","profile_9","profile_0")] 
    [string]$profile,
    
    [string]$name)


# use second argument or timestamp.
$timeStamp = (Get-Date).ToString('yyyyMMdd_HHmmss')
$name = if ([string]::IsNullOrEmpty($name)) { $timeStamp } else { $name }


. (Join-Path $PSScriptRoot "..\detect-steam-game-saves.ps1")
$savesPath = Get-SavesPath darkestDungeon


$myDocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$destinationPath = "$myDocumentsPath\DarkestDungeon\$profile\$gameEnvironment\$name"

# create destination folder.
if (-Not(Test-Path $destinationPath)) {  
    
    New-Item -Path $destinationPath -ItemType Directory -Force
}

Copy-Item "$savesPath\$profile\*" –destination $destinationPath -recurse -container