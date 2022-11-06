#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ======== DELAY/SLEEP SETTINGS ===========

KeyStateDelay := 25 ; Minimum delay between Key States (down or up)
MenuDelay := 50 ; Min. Delay for switching between menus
MinDelay := 25 ; Minimum delay between keystrokes

; ======== Exit to Main Menu ===========

f::

GoSub, Press1Position
Return

#IfWinActive

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