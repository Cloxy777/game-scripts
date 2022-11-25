# detect-steam-game.ps1 Frostpunk
$steamPath = 'E:\Games\Steam'

$relativePaths = @{
    'frostpunk'='\userdata\402463438\323190\remote\saves';
    'darkestDungeon'='\userdata\402463438\262060\remote';
}

function Get-SavesPath{
    param(
        [Parameter(Mandatory=$true,position=0)] 
        [ValidateSet('frostpunk', 'darkestDungeon')]
        [string] $gameName)

    $relativePath = $relativePaths[$gameName]
    return $steamPath + $relativePath
}