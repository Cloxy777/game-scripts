#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ======== DELAY/SLEEP SETTINGS ===========

KeyStateDelay := 25 ; Minimum delay between Key States (down or up)
MenuDelay := 50 ; Min. Delay for switching between menus
MinDelay := 25 ; Minimum delay between keystrokes

; ======== Exit to Main Menu ===========
SetTitleMatchMode, 2 ; Set the matching mode to find a window title that contains the specified string

#IfWinActive, They Are Billions

F5:: Save(1)

F6:: Load(1)
F7:: Load(2)
F8:: Load(3)
F9:: Load(4)
F10:: Load(5)
F11:: Load(6)
F12:: Load(7)

; ========= SUBS ===========

Save(Arg) {
    run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File save_backup.ps1,, hide
	Return
}

Load(Arg) {
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File load_backup.ps1 -Save %Arg%,, hide
	Return
}
