#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2


; Allow panic close with Ctrl+Esc
^Esc::ExitApp


; Switch to kinetic primary
F11::
    ; Navigate to 2nd page
    Click, 2475 900 0
    Sleep, 500
    
    Click
    Sleep, 100

    ; Hover over Bygones
    Click, 1550 600 0
    Sleep, 100
    
    ; Buy 9x
    Click
    Sleep, 800

    Click
    Sleep, 800

    Click
    Sleep, 800

    Click
    Sleep, 800

    Click
    Sleep, 800

    Click
    Sleep, 800

    Click
    Sleep, 800

    Click
    Sleep, 800

    Click
    Sleep, 800


    ; Hover over Trust
    Click, 1700 600 0
    Sleep, 100
    
    ; Buy 9x
    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800


    ; Hover over Bad Omens
    Click, 1850 600 0
    Sleep, 100
    
    ; Buy 9x
    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800

    Click, Down
    Sleep, 3100
    Click, Up
    Sleep, 800



    ; Send key to open character screen
    Send, {F1}
    Sleep, 1000


    ; Hover over kinetic weapon
    Click, 700 500 0
    Sleep, 500
    

    ; Hover over first Bygones in inventory
    Click, 550 500 0
    Sleep, 500

    ; Delete item
;;;;;;;; TODO    
    Sleep, 2000
;;;;;;;; TODO    
    




    ; Leave the menu
;    Send, {Esc}

    return


