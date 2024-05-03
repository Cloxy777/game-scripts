Param(
    [Parameter(Mandatory)] 
    [ValidateSet("Hamlet","Dungeon")] 
    [string]$GameEnvironment,
     
    [Parameter(Mandatory)] 
    [ValidateSet("profile_1","profile_2","profile_3","profile_4","profile_5","profile_6","profile_7","profile_8","profile_9","profile_0")] 
    [string]$Profile,

    [Parameter(Mandatory=$true)]
    [ValidateSet(1, 2, 3, 4, 5, 6, 7, 8)]
    [string]$Save)


. (Join-Path $PSScriptRoot "..\detect-steam-game-saves.ps1")
$savesPath = Get-SavesPath darkestDungeon


$myDocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$destinationPath = "$myDocumentsPath\DarkestDungeon\$Profile\$GameEnvironment"


$latestFolder = Get-ChildItem -Path $destinationPath -Directory | 
        Sort-Object LastWriteTime -Descending | 
        Select-Object -Index $($Save - 1)

$destinationPath = "$destinationPath\$latestFolder\"

# check if save exists.
if (-Not(Test-Path $destinationPath)) {    
    Write-Host "No $name save"
    exit
}

Remove-Item -Recurse -Force "$savesPath\$Profile\*"
Copy-Item "$destinationPath\*" –destination "$savesPath\$Profile" -recurse -container