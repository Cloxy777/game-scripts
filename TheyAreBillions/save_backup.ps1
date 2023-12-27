$savesPath = 'C:\Users\Pavel\Documents\my games\They Are Billions\Saves'
$backupPath = 'C:\Users\Pavel\Documents\my games\They Are Billions\auto-backups'


# ex. by timestamp     save_backup.ps1
# ex. by name          save_backup.ps1 0001

# use first argument or timestamp.
$timeStamp = (Get-Date).ToString('yyyyMMdd_HHmmss')

$backupName = "backup_$timeStamp"
$destinationPath = "$backupPath\$backupName"

# Check if the source directory exists
if (Test-Path $savesPath -PathType Container) {
    # Create the destination directory if it doesn't exist
    if (-not (Test-Path $destinationPath)) {
        New-Item -ItemType Directory -Path $destinationPath | Out-Null
    }

    # Copy the source directory to the destination directory
    Copy-Item -Path $savesPath -Destination $destinationPath -Recurse -Force

    Write-Host "Directory copied successfully."
} else {
    Write-Host "Source directory does not exist."
}