#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;CoordMode, Mouse, Screen
;SendMode Play
SendMode Input

AntiAfkKeys := StrSplit("sj")


F11::
	Send % "j"

	SetTimer PreventAFK, 500
;	SetTimer LookDown, 1000
	SetTimer FireBow, 4000
Return


F12::
	SetTimer PreventAFK, Off
;	SetTimer LookDown, Off
	SetTimer FireBow, Off
Return



PreventAFK:
	Send % AntiAfkKeys[1]
;	Send % AntiAfkKeys[2]
;	MouseMove, 0, 1000, 50, Relative
Return


LookDown:
	MouseMove, 0, 200, 90, R
Return


FireBow:
	Click, Down
	Sleep, 250
	Click, Up
Return


