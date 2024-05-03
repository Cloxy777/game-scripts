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

F6:: LoadDungeon(1)
F7:: LoadDungeon(2)
F8:: LoadDungeon(3)

F9::
GoSub, SaveHamlet
Return

F10:: LoadHamlet(1)
F11:: LoadHamlet(2)
F12:: LoadHamlet(3)

; ========= SUBS ===========

SaveHamlet:
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File save_backup.ps1 -GameEnvironment Hamlet -Profile profile_1,, hide
	Return
	
LoadHamlet(Arg) {
    Process, Close, Darkest.exe
    Sleep, 4000
    run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File load_backup.ps1 -GameEnvironment Hamlet -Profile profile_1 -Save %Arg%,, hide
    Sleep, 1000
    run, DarkestDungeon.url
    Return
}
	
SaveDungeon:
	run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File save_backup.ps1 -GameEnvironment Dungeon -Profile profile_1,, hide
	Return
	
LoadDungeon(Arg) {
    Process, Close, Darkest.exe
    Sleep, 4000
    run, powershell.exe -windowstyle hidden -ExecutionPolicy Bypass -File load_backup.ps1 -GameEnvironment Dungeon -Profile profile_1 -Save %Arg%,, hide
    Sleep, 1000
    run, DarkestDungeon.url
    Return
}