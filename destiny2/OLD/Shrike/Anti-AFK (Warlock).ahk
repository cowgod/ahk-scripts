#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



Letters := StrSplit("sj")

F11::SetTimer SendLetter, 500
F12::SetTimer SendLetter, Off

SendLetter:
	Send % Letters[1]	
	Send % Letters[2]	
Return
