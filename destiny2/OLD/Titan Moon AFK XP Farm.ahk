#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


8::pause, toggle

9::
loop,
{
	Send, q
	Sleep, 800
	Send, w
	Sleep, 800
	Send, s
	Sleep, 2800
	Continue
return
}

0::
ExitApp