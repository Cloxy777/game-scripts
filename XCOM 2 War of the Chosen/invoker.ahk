#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; ======== DELAY/SLEEP SETTINGS ===========

KeyStateDelay := 25 ; Minimum delay between Key States (down or up)
MenuDelay := 50 ; Min. Delay for switching between menus
MinDelay := 25 ; Minimum delay between keystrokes

; ======== Exit to Main Menu ===========

#IfWinActive, XCOM 2: War of the Chosen

F5:: Save()

F9:: Load(1)
F10:: Load(2)
F11:: Load(3)
F12:: Load(4)

; ========= SUBS ===========

Save() {
    run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File save_backup.ps1,, hide
	Return
}

Load(Arg) {
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File load_backup.ps1 -Save %Arg%,, hide
	Return
}