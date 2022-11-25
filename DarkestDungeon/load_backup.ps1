Param(
    [Parameter(Mandatory)] 
    [ValidateSet("Hamlet","Dungeon")] 
    [string]$gameEnvironment,
     
    [Parameter(Mandatory)] 
    [ValidateSet("profile_1","profile_2","profile_3","profile_4","profile_5","profile_6","profile_7","profile_8","profile_9","profile_0")] 
    [string]$profile,
    
    [string]$name)


. (Join-Path $PSScriptRoot "..\detect-steam-game-saves.ps1")
$savesPath = Get-SavesPath darkestDungeon


$myDocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$destinationPath = "$myDocumentsPath\DarkestDungeon\$profile\$gameEnvironment"


if ([string]::IsNullOrEmpty($name)){
    $latestSave = Get-ChildItem -Path $destinationPath -Recurse -Filter *.json | 
        Sort-Object LastWriteTime -Descending | 
        Select-Object -First 1
    $name = $latestSave.Directory.Name
}

$destinationPath = "$destinationPath\$name\"

# check if save exists.
if (-Not(Test-Path $destinationPath)) {    
    Write-Host "No $name save"
    exit
}

Remove-Item -Recurse -Force "$savesPath\$profile\*"
Copy-Item "$destinationPath\*" –destination "$savesPath\$profile" -recurse -container