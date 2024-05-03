Param(
    [Parameter(Mandatory)] 
    [ValidateSet("Hamlet","Dungeon")] 
    [string]$GameEnvironment,
     
    [Parameter(Mandatory)] 
    [ValidateSet("profile_1","profile_2","profile_3","profile_4","profile_5","profile_6","profile_7","profile_8","profile_9","profile_0")] 
    [string]$Profile)

$name = (Get-Date).ToString('yyyyMMdd_HHmmss')


. (Join-Path $PSScriptRoot "..\detect-steam-game-saves.ps1")
$savesPath = Get-SavesPath darkestDungeon


$myDocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$destinationPath = "$myDocumentsPath\DarkestDungeon\$Profile\$GameEnvironment\$name"

# create destination folder.
if (-Not(Test-Path $destinationPath)) {  
    
    New-Item -Path $destinationPath -ItemType Directory -Force
}

Copy-Item "$savesPath\$Profile\*" –destination $destinationPath -recurse -container