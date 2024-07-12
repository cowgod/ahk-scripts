#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
#SingleInstance Force


; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATE THESE to match your settings
;

Global Character_Screen_Keybind := "F1"

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Set the coordinates for all the mouse locations needed by the script, so we have a single
; place to update them if they change with future game updates

Global Loadout_X := []
Loadout_X[0] := 194
Loadout_X[1] := 321

Global Loadout_Y := []
Loadout_Y[0] := 456
Loadout_Y[1] := 579
Loadout_Y[2] := 700
Loadout_Y[3] := 832
Loadout_Y[4] := 966
Loadout_Y[5] := 1091


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Document the resolution the script was originally designed for, so we can adapt to other
; resolutions (DO NOT ADJUST)
CoordMode, Mouse, Screen
Global X_Original := 2560
Global Y_Original := 1440

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Define function to move to a specific point, scaled to the current screen resolution
MouseMove(X,Y)
{
    MouseMove, % X * A_ScreenWidth / X_Original, Y * A_ScreenHeight / Y_Original
}


; Define function to select a loadout in a specific column and row
SelectLoadoutSlot(X,Y)
{
    MouseMove(Loadout_X[X], Loadout_Y[Y])
    Sleep, 100
    Click
}

; Define function to select a specific loadout by number
SelectLoadout(Num)
{
    Row    := Floor((Num - 1) / 2)
    Column := Mod(Num - 1, 2)
    SelectLoadoutSlot(Column, Row)
}


OpenLoadouts()
{
    ; Send key to open settings
    Send, {%Character_Screen_Keybind%}
    Sleep, 1250

    ; Scroll Left
    Send, {Left}
    Sleep, 500
}


ActivateLoadout(Num)
{
	BlockInput, MouseMove

    OpenLoadouts()
    SelectLoadout(Num)

    BlockInput, MouseMoveOff


    ; Leave the Loadout menu
    Send, {Esc}
    Sleep, 100

    ; Leave the character screen
    Send, {Esc}
    Sleep, 100
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Activate Loadouts
F17::ActivateLoadout(1)
^F17::ActivateLoadout(2)
+F17::ActivateLoadout(3)
^+F17::ActivateLoadout(4)
!F17::ActivateLoadout(5)
^!F17::ActivateLoadout(6)
+!F17::ActivateLoadout(7)
^+!F17::ActivateLoadout(8)
#F17::ActivateLoadout(9)
#^F17::ActivateLoadout(10)
#+F17::ActivateLoadout(11)
#+^F17::ActivateLoadout(12)
