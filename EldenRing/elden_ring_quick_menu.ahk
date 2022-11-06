#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ======== DELAY/SLEEP SETTINGS ===========

KeyStateDelay := 25 ; Minimum delay between Key States (down or up)
MenuDelay := 50 ; Min. Delay for switching between menus
MinDelay := 25 ; Minimum delay between keystrokes

; ======== Exit to Main Menu ===========

#IfWinActive, ELDEN RING™

F1::

GoSub, PressEsc
	Sleep MenuDelay
GoSub, PressUp
GoSub, PressE
	Sleep MenuDelay
GoSub, PressZ
	Sleep MenuDelay
GoSub, PressE
GoSub, PressLeft
GoSub, PressE
Return

; ========= SUBS ===========

Press1Position:
	Send, {e Down}
	Sleep KeyStateDelay
	Send, {1 Down}
	Sleep KeyStateDelay
	Send, {1 Up}
	Sleep KeyStateDelay
	Send, {e Up}
	Return

PressEsc:
	Send, {Escape Down}
	Sleep KeyStateDelay
	Send, {Escape Up}
	Sleep MinDelay
	Return

PressE:
	Send, {e Down}
	Sleep KeyStateDelay
	Send, {e Up}
	Sleep MinDelay
	Return

PressZ:
	Send, {z Down}
	Sleep KeyStateDelay
	Send, {z Up}
	Sleep MinDelay
	Return

PressUp:
	Send, {Up Down}
	Sleep KeyStateDelay
	Send, {Up Up}
	Sleep MinDelay
	Return

PressDown:
	Send, {Down Down}
	Sleep KeyStateDelay
	Send, {Down Up}
	Sleep MinDelay
	Return

PressRight:
	Send, {Right Down}
	Sleep KeyStateDelay
	Send, {Right Up}
	Sleep MinDelay
	Return

PressLeft:
	Send, {Left Down}
	Sleep KeyStateDelay
	Send, {Left Up}
	Sleep MinDelay
	Return