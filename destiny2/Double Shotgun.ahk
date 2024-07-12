#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


F9::
    ; Send key to switch weapon
    Send, {Home}
    Sleep, 50
    
    ; Run forward (assumes hold to sprint)
    Send, {w Down}{LShift Down}
    Sleep, 50
    Send, {w Up}{LShift Up}
    
    ; Aim down sights
    Click, Right, , Down
    Sleep, 300

    ; Fire
    Click, Left, 1
    Sleep, 30

    ; Release sights
    Click, Right, , Up
    
    ; Walk backwards the same ammount we walked forward above
    Send, {s Down}
    Sleep, 50
    Send, {s Up}

    ; Cool off for a bit to let animations finish in case we loop
    Sleep, 50
    return