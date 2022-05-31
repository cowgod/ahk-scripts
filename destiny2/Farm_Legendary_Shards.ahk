#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2


; Stop & unload macro with Alt+F11
!F11::ExitApp



RahoolBuyMaterial:
;;; Uncomment whichever slot is needed today
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 1st material slot
    Click, 1830 220
;    ; 2nd material slot
;    Click, 1970 220
;    ; 3rd material slot
;    Click, 2080 220
;    ; 4th material slot
;    Click, 2220 220
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    Sleep, 1000

    return


RahoolBuyGlimmer:
;;; Uncomment whichever slot is needed today
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; 1st glimmer slot
    Click, 1550 220
;    ; 2nd glimmer slot
;    Click, 1680 220
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    Sleep, 1000

    return


RahoolBuy500Material:
    Loop, 100
    {
        GoSub, RahoolBuyMaterial
    }
    return


RahoolBuy250kGlimmer:
    Loop, 25
    {
        GoSub, RahoolBuyGlimmer
    }
    return


BuyItem:
    Click, Down
    Sleep, 4000
    Click, Up
    Sleep, 100
    return


DeleteItem:
    Send, {f Down}
    Sleep, 1500
    Send, {f Up}
    Sleep, 100
    return


Buy9Items:
    ; Send key to open Collections
    Send, {F7}
    Sleep, 1000

    ; Click on "Armor"
    Click, 1200 600 0
    Sleep, 500
    
    Click
    Sleep, 500

    ; Click on "Leveling"
    Click, 500 1100 0
    Sleep, 1000
    
    Click
    Sleep, 500

    ; Navigate to 2nd page
    Send {Right}
    Sleep, 500
    
    ; Hover over cloak to buy
    Click, 1500 1150 0
    Sleep, 100
    
    ; Buy 9x
    Loop, 9
    {
        GoSub, BuyItem
    }

    ; Return to main screen
    Send, {F1}
    Sleep, 1500  

    return


Delete9Items:
    ; Send key to open Character
    Send, {F1}
    Sleep, 1500

    ; Hover over class item
    Click, 1850 1030 0
    Sleep, 1000
    
    ; Hover over first inventory slot
    Click, 2020 1030 0
    Sleep, 500

    ; Delete 9x
    Loop, 9
    {
        GoSub, DeleteItem
    }

    ; Return to main screen
    Send, {F1}
    Sleep, 1500  

    return


PreventAFK:
    Send % "s"
    Sleep, 100
    Send % "w"
    Sleep, 100
    return


; Initiate macro
F11::
    Loop
    {
        Sleep, 1000

        ; Interact with Rahool
        Send, {f Down}
        Sleep, 500
        Send, {f Up}
        Sleep, 3000
    
        ; Buy 500 of whatever element is currently trading for glimmer
        GoSub, RahoolBuy500Material

        ; Fill up on glimmer
        GoSub, RahoolBuy250kGlimmer

        GoSub, PreventAFK


        Loop, 100
        {
            GoSub, Buy9Items
            GoSub, PreventAFK
            GoSub, Delete9Items
            GoSub, PreventAFK
        }

        ; Back out of menu
        Send, {Esc}
        Sleep, 1000
    }

    return

