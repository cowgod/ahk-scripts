#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#singleinstance force



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATE THESE to match your settings
;
Global Walk_Back_Keybind := "s"
Global Walk_Forward_Keybind := "w"
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




Global running := 0

customcolor := "000000"
gui +lastfound +alwaysontop -caption +toolwindow
gui, color, %customcolor%
gui, font, s32, verdana
gui, add, text, vmytext cwhite, XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX`nXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
guicontrol,, mytext, Anti-AFK: ACTIVE
;gui, add, text, vmytext cwhite, "Anti-AFK: ACTIVE"
;;;;;gui, hide
winset, transcolor, %customcolor% 255


;;; TODO:
; Switch it so we only dispaly the text when active
; Fix keybindsings back to streamdeck below
; Test with streamdeck
UpdateGUI()
{
	if winactive("Destiny 2") {
		if (running = 1) {
			gui, show, x0 y0 noactivate
			;;;guicontrol,, mytext, Anti-AFK: ACTIVE
		}
		else {
;			guicontrol,, mytext, Anti-AFK: inactive`nF11 to activate anti-AFK, Ctrl+F12 to close
;;;			guicontrol,, mytext, Anti-AFK: inactive
			gui, hide
		}
	}
	else {
		gui, hide
	}
}

SetTimer, UpdateGUI, 200



EnableAntiAFK()
{
	running = 1
	SetTimer, WinCheck, 500
	SetTimer, PreventAFK, 12000
}


DisableAntiAFK()
{
	running = 0
	SetTimer, WinCheck, Off
	SetTimer, PreventAFK, Off
}


PreventAFK()
{
    Send %Walk_Back_Keybind%
    Sleep, 100
    Send %Walk_Forward_Keybind%
    Sleep, 100
}


WinCheck()
{
    IfWinnotActive, Destiny 2
    reload
}




;;;;; To have the same key toggle it on and off
;F14::
;{
;	if (running = 0) {
;		running = 1
;		SetTimer SendLetter, 12000
;	}
;	else {
;		running = 0
;		SetTimer SendLetter, Off
;	}
;	return
;}


; Enable Anti-AFK: F14
F14::EnableAntiAFK()


; Disable Anti-AFK: Shift+F14
+F14::DisableAntiAFK()


;;;; Close macro: Ctrl+F14
;;;^F14::
;;;{
;;;	exitapp
;;;}

