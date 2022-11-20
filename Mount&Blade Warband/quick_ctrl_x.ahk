#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#IfWinActive Mount&Blade ;This script works only if Mount&Blade window is active.

$n::
Loop
{
	if not GetKeyState("n", "P")
	break
	Send {LControl down}
	Sleep, 10
	Send {x down}
	Sleep, 10
	Send {x up}
	Sleep, 10
	Send {x down}
	Sleep, 10
	Send {x up}
	Sleep, 10
	Send {x down}
	Sleep, 10
	Send {x up}
	Sleep, 10
	Send {LControl up}
}
return