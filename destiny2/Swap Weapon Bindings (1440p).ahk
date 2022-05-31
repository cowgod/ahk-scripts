#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2


; Switch to kinetic primary (Ctrl+Alt+Shift+1)
^!+1::
    ; Send key to open settings
    Send, {F5}
    Sleep, 1000

    ; Scroll down
    Click, 2455 850 0
    Sleep, 100
    
    Click
    Sleep, 100

    ; Select kinetic weapon mapping
    Click, 2250 530 0
    Sleep, 100

    Click
    Sleep, 100

    ; Send mouse wheel up (actually down, since the mouse wheel is flipped)
    Send {WheelDown}
    Sleep, 100
    

    ; Select kinetic weapon mapping
    Click, 2250 600 0
    Sleep, 100

    Click
    Sleep, 100

    ; Send mouse wheel down (actually up, since the mouse wheel is flipped)
    Send {WheelUp}
    Sleep, 100
    

    ; Leave the menu
    Send, {Esc}

    return


; Switch to energy primary (Ctrl+Alt+Shift+2)
^!+2::
    ; Send key to open settings
    Send, {F5}
    Sleep, 1000

    ; Scroll down
    Click, 2455 850 0
    Sleep, 100
    
    Click
    Sleep, 100

    ; Select kinetic weapon mapping
    Click, 2250 530 0
    Sleep, 100

    Click
    Sleep, 100

    ; Send mouse wheel down (actually up, since the mouse wheel is flipped)
    Send {WheelUp}
    Sleep, 100
    

    ; Select kinetic weapon mapping
    Click, 2250 600 0
    Sleep, 100

    Click
    Sleep, 100

    ; Send mouse wheel up (actually down, since the mouse wheel is flipped)
    Send {WheelDown}
    Sleep, 100
    

    ; Leave the menu
    Send, {Esc}

    return


