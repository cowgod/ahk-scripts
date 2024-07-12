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
global Heavy_Weapon_Keybind := "3"
global Air_Move_Keybind := "g"
global Super_Keybind := "m"
global Class_Ability_Keybind := "j"
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Shatterdive/Strand Skate
^t::
    ; Switch to sword
    SendInput %Heavy_Weapon_Keybind%
    Sleep 500

    ; Heavy attack
    Click, Right
    Sleep 1

    ; Jump
    SendInput {Space}
    Sleep 1

    ; Shatterdive/Strand Dive
    SendInput %Air_Move_Keybind%

    return



; Well Skate
^+t::
    ; Switch to sword
    SendInput %Heavy_Weapon_Keybind%
    Sleep 500

    ; Heavy attack
    Click, Right
    Sleep 1

    ; Jump
    SendInput {Space}
    Sleep 1

    ; Cast Well
    SendInput %Super_Keybind%

    return


