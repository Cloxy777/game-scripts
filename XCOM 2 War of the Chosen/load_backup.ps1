param
(
    [Parameter(Mandatory=$true)]
    [ValidateSet(1, 2, 3, 4, 5, 6, 7, 8)]
    [string]$Save
)


$savesPath = "C:\Users\Komre\OneDrive\Документы\My Games\XCOM2 War of the Chosen\XComGame"
$backupPath = "C:\Users\Komre\OneDrive\Документы\My Games\XCOM2 War of the Chosen\XComGame\backup"

# ex. load lastest      load_backup.ps1
# ex. load by name      load_backup.ps1 0001

$latestFolder = Get-ChildItem -Path $backupPath -Directory | 
        Sort-Object LastWriteTime -Descending | 
        Select-Object -Index $($Save - 1)
$backupName = $latestFolder.Name
$sourcePath = "$backupPath\$backupName\SaveData"

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