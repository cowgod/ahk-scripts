#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This script assumes you have bound F7 to the "Collections" page.
; 
; It also requires a resolution of 1440p, or else you'll need to update all the pixel
; coordinates.
;
; We will resupply our glimmer by buying some planetary material from Rahool with legendary
; shards, and then buying glimmer with that planetary material. Rahool's inventory changes
; daily at reset, so each day you have to figure out which of his two glimmer options matches
; with which of his four planetary material options, and update the script below accordingly.
; Find the subroutines immediately below called "RahoolBuyMaterial" and "RahoolBuyGlimmer".
; In each one, there are 4 and 2 "Click" lines, respectively, corresponding to the various
; options he sells. Comment out (put a ';' at the beginning) all but the one you want to buy,
; and be sure the one you want to buy is uncommented (has no ';' before the "Click" line).
;
; To activate this, fly to the tower, stand in front of Rahool, and press F11 to start the
; macro. To stop the macro and unload it, press Alt+F11. You'll need to re-load it (double
; click it in Explorer) to be able to start it again.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2



; Stop macro
!F11::ExitApp




RahoolHoverGlimmer:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    ; 1st glimmer slot
;    Click, 1550 220 0
    ; 2nd glimmer slot
    Click, 1680 220 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    Sleep, 1000
    
    return


RahoolHoverMaterial:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;    ; 1st material slot
;    Click, 1830 220 0
;    ; 2nd material slot
;    Click, 1970 220 0
;    ; 3rd material slot
;    Click, 2080 220 0
    ; 4th material slot
    Click, 2220 220 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    Sleep, 1000
    
    return


RahoolBuy250kGlimmer:
    GoSub, RahoolHoverGlimmer

    Loop, 25
    {
        Click
        Sleep, 1000
    }

    return


RahoolBuy100Material:
    GoSub, RahoolHoverMaterial

    Loop, 100
    {
        Click
        Sleep, 1000
    }

    return


RefillGlimmer:
    ; Interact with Rahool
    Send, {f Down}
    Sleep, 500
    Send, {f Up}
    Sleep, 3000

    ; Buy 500 of whatever element is currently trading for glimmer
    GoSub, RahoolBuy100Material

    ; Fill up on glimmer
    GoSub, RahoolBuy250kGlimmer

    ; Back out of menu
    Send, {Esc}
    Sleep, 2000

    return



BuyItem:
    Click, Down
    Sleep, 4100
    Click, Up
    Sleep, 100
    return


DeleteItem:
    Send, {f Down}
    Sleep, 1600
    Send, {f Up}
    Sleep, 100
    return


Buy9Items:
    ; Send key to open Collections
    Send, {F7}
    Sleep, 2000

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
    Sleep, 2000

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
    Sleep, 2000  

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
        GoSub, RefillGlimmer
        GoSub, PreventAFK

        ; One item costs 777 glimmer. Sharding it returns 250 glimmer, so
        ; the net cost is 527 per item. One loop of buying & sharding 9x
        ; items costs 4743 glimmer. So to spend 250k glimmer, it will
        ; take 52 loops.
        Loop, 52
        {
            GoSub, Buy9Items
            GoSub, PreventAFK

            GoSub, Delete9Items
            GoSub, PreventAFK
        }
    }

    return


