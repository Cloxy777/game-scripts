#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ======== DELAY/SLEEP SETTINGS ===========

KeyStateDelay := 25 ; Minimum delay between Key States (down or up)
MenuDelay := 50 ; Min. Delay for switching between menus
MinDelay := 25 ; Minimum delay between keystrokes

; ======== Exit to Main Menu ===========

#IfWinActive, Frostpunk

f5::
GoSub, Save
Return

f9::
GoSub, Load
Return

; ========= SUBS ===========

Save:
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File save_backup.ps1,, hide
	Return
	
Load:
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File load_backup.ps1,, hide
	Return