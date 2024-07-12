#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2


BuyItem:
    Click, Down
    Sleep, 1100
    Click, Up
    Sleep, 100
    return


WinCheck:
    IfWinnotActive, Destiny 2
    reload
    return


; Start macro
l::
    setTimer, WinCheck, 500

;	Loop, 240
    Loop
    {
        GoSub, BuyItem
    }

    return


; Stop macro
!l::reload


