param
(
    [Parameter(Mandatory=$true)]
    [ValidateSet("1", "2", "3", "4")]
    [string]$Stage
)

$savesPath = "E:\Games\Steam\steamapps\common\SlayTheSpire\saves"
$backupPath = "E:\Games\Steam\steamapps\common\SlayTheSpire\backup\$($Stage)"

# ex. by timestamp     save_backup.ps1
# ex. by name          save_backup.ps1 0001

# use first argument or timestamp.
$timeStamp = (Get-Date).ToString('yyyyMMdd_HHmmss')

$backupName = "$timeStamp"
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