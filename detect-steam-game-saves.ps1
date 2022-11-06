# detect-steam-game.ps1 Frostpunk
$steamPath = 'E:\Games\Steam'

$relativePaths = @{
    'frostpunk'='\userdata\402463438\323190\remote\saves';
}

function Get-SavesPath{
    param(
        [Parameter(Mandatory=$true,position=0)] 
        [ValidateSet('frostpunk')]
        [string] $gameName)

    $relativePath = $relativePaths[$gameName]
    return $steamPath + $relativePath
}