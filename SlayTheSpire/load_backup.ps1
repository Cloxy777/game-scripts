param
(
    [Parameter(Mandatory=$true)]
    [ValidateSet("1", "2", "3", "4")]
    [string]$Stage
)

$gamePath = "E:\Games\Steam\steamapps\common\SlayTheSpire"
$savesPath = "$($gamePath)\saves"
$backupPath = "$($gamePath)\backup\$($Stage)"


# ex. load lastest      load_backup.ps1
# ex. load by name      load_backup.ps1 0001

$latestFolder = Get-ChildItem -Path $backupPath -Directory | 
        Sort-Object LastWriteTime -Descending | 
        Select-Object -First 1
$backupName = $latestFolder.Name
$sourcePath = "$backupPath\$backupName\saves"

Remove-Item -Path $savesPath -Recurse -Force

# check if save exists.
if (Test-Path $sourcePath -PathType Container) {
    # Copy the source directory to the destination directory
    Copy-Item -Path $sourcePath -Destination $gamePath -Recurse -Force

    Write-Host "Directory copied successfully."
} else {
    Write-Host "Source directory '$sourcePath' does not exist."
}