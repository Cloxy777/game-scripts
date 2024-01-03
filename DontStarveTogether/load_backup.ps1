$cluster = 'Cluster_1'
$savesPath = "C:\Users\Pavel\Documents\Klei\DoNotStarveTogether\402463438"
$fullSavesPath = "$($savesPath)\$($cluster)"
$backupPath = "$($fullSavesPath)_auto_backups"


# ex. load lastest      load_backup.ps1
# ex. load by name      load_backup.ps1 0001

$latestFolder = Get-ChildItem -Path $backupPath -Directory | 
        Sort-Object LastWriteTime -Descending | 
        Select-Object -First 1
$backupName = $latestFolder.Name
$sourcePath = "$backupPath\$backupName\$cluster"

Remove-Item -Path $fullSavesPath -Recurse -Force

# check if save exists.
if (Test-Path $sourcePath -PathType Container) {
    # Create the destination directory if it doesn't exist
    if (-not (Test-Path $savesPath)) {
        New-Item -ItemType Directory -Path $savesPath | Out-Null
    }

    # Copy the source directory to the destination directory
    Copy-Item -Path $sourcePath -Destination $savesPath -Recurse -Force

    Write-Host "Directory copied successfully."
} else {
    Write-Host "Source directory '$sourcePath' does not exist."
}