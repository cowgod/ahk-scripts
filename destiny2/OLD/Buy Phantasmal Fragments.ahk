#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#Persistent
#SingleInstance Force

; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; A pretty simple script to mass-buy Phantasmal Fragments from the Lectern by Eris, with
; occasional anti-AFK movements.
;
; Before activating, update the keybind variables in the section below labeled "UPDATE THESE
; to match your settings".
;
; To activate macro, fly to Sanctuary on the Moon, stand in front of the Lectern, and
; press F11 to start the macro. To stop the macro, press Alt+F11.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATE THESE to match your settings
;
Global Interact_Keybind := "f"
Global Walk_Back_Keybind := "s"
Global Walk_Forward_Keybind := "w"

Global Phantasmal_Fragments_X := 1555
Global Phantasmal_Fragments_Y := 857
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Document the resolution the script was originally designed for, so we can adapt to other
; resolutions (DO NOT ADJUST)
CoordMode, Mouse, Screen
Global X_Original, Y_Original
X_Original := 2560
Y_Original := 1440


; Define function to move to a specific point, scaled to the current screen resolution
MouseMove(X,Y)
{
    MouseMove, % X * A_ScreenWidth / X_Original, Y * A_ScreenHeight / Y_Original
}



LecternHoverFragments()
{
    MouseMove(Phantasmal_Fragments_X, Phantasmal_Fragments_Y)
    Sleep, 1000
}



LecternBuy100Fragments()
{
    LecternHoverFragments()

    Loop, 100
    {
        BuyItemInstant()
        Sleep, 500
    }
}





BuyFragments()
{
    ; Interact with Lectern
    Send, {%Interact_Keybind% Down}
    Sleep, 500
    Send, {%Interact_Keybind% Up}
    Sleep, 3000

    ; Buy fragments
    LecternBuy100Fragments()

    ; Return to main screen
    Send, {Esc}
    Sleep, 1500
}



BuyItemInstant()
{
    Click, Down
    Sleep, 100
    Click, Up
    Sleep, 100
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



; Start buying fragments
F16::
    setTimer, WinCheck, 500
    Loop
    {
        BuyFragments()
        PreventAFK()
    }
    return


; Stop macro
^F16::reload


