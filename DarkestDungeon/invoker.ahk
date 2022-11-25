#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ======== DELAY/SLEEP SETTINGS ===========

KeyStateDelay := 25 ; Minimum delay between Key States (down or up)
MenuDelay := 50 ; Min. Delay for switching between menus
MinDelay := 25 ; Minimum delay between keystrokes

; ======== SAVE/LOAD ===========

F5::
GoSub, SaveDungeon
Return

F6::
GoSub, LoadDungeon
Return

F9::
GoSub, SaveHamlet
Return

F10::
GoSub, LoadHamlet
Return



; ========= SUBS ===========

SaveHamlet:
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File save_backup.ps1 Hamlet profile_1,, hide
	Return
	
LoadHamlet:
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File load_backup.ps1 Hamlet profile_1,, hide
	Return
	
SaveDungeon:
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File save_backup.ps1 Dungeon profile_1,, hide
	Return
	
LoadDungeon:
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File load_backup.ps1 Dungeon profile_1,, hide
	Return