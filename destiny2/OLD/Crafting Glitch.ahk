#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#Persistent
#SingleInstance Force


; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2



^i::
    Click
    Sleep 50

    SendInput "a"
    Sleep 50

    Click

    return

^!i::
    MouseMove, 1335, 550
    Sleep 250
    Click
    MouseMove, 2158, 431
    Sleep 250

    SendInput "a"
    Sleep 450

;    Sleep 100
    Click
    Sleep 50
    Click
    Sleep 50
    Click
    Sleep 50
    Click
    Sleep 50
    Click

    return

^+i::
    MouseMove, 1440, 530
    Sleep 50
    Click
    Sleep 1

    MouseMove, 1140, 440

    Click

    return

