#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; We will resupply our glimmer by trading planetary materials to Rahool.
;
; Before activating, update the keybind variables in the section below labeled "UPDATE THESE
; to match your settings".
;
; To activate macro, make sure you have an empty class item inventory, and no umbral/trials/etc
; engrams in your inventory that Rahool will want to decrypt. Fly to the tower, stand in front
; of Rahool, and press F11 to start the macro. To stop the macro, press Alt+F11.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATE THESE to match your settings
;
Interact_Keybind := "f"
Dismantle_Keybind := "f"
Walk_Back_Keybind := "s"
Walk_Forward_Keybind := "w"
Strafe_Left_Keybind := "a"
Character_Screen_Keybind := "F1"
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



RahoolHoverGlimmer:
    MouseMove(1550, 220)
    Sleep, 1000
    
    return



RahoolBuy250kGlimmer:
    GoSub, RahoolHoverGlimmer

    Loop, 50
    {
        GoSub, BuyItemInstant
        Sleep, 500
    }

    return



RefillGlimmer:
    ; Interact with Rahool
    Send, {%Interact_Keybind% Down}
    Sleep, 500
    Send, {%Interact_Keybind% Up}
    Sleep, 3000


    ; Back out of umbral engram decryption (uncomment these 2 lines if there are umbral/trials engrams in inventory)
    Send, {Esc}
    Sleep, 1500



    ; Move right to get to planetary mats
    Send, {Right}
    Sleep, 500

    ; Fill up on glimmer
    GoSub, RahoolBuy250kGlimmer

    ; Return to main screen
    Send, {Esc}
    Sleep, 2000

    return


BuyBlueTransmats:
    ; Send key to open Character
    Send, {%Character_Screen_Keybind%}
    Sleep, 1500


    ; Move left twice to get to Collections
    Send {%Strafe_Left_Keybind%}
    Sleep, 500

    Send {%Strafe_Left_Keybind%}
    Sleep, 500


    ; Click on "Flair"
    MouseMove(1200, 1000)
    Sleep, 500
    
    Click
    Sleep, 500

    ; Click on "Transmat Effects"
    MouseMove(465, 360)
    Sleep, 1000
    
    Click
    Sleep, 500

    ; Navigate down to 2nd page
    MouseMove(465, 1225)
    Sleep, 1000
    
    Click
    Sleep, 500
    
    ; Click on "Season 5"
    MouseMove(385, 1075)
    Sleep, 1000
    
    Click
    Sleep, 500


    ; Hover over transmat to buy
    MouseMove(1140, 640)
    Sleep, 100
    
    ; Buy 250x
    Loop, 250
    {
        GoSub, BuyItem1sec
    }

    ; Return to main screen
    Send, {Esc}
    Sleep, 1500

    Send, {Esc}
    Sleep, 1500

    return



BuyItemInstant:
    Click, Down
    Sleep, 100
    Click, Up
    Sleep, 100
    return


BuyItem1sec:
    Click, Down
    Sleep, 1100
    Click, Up
    Sleep, 100
    return


PreventAFK:
    Send %Walk_Back_Keybind%
    Sleep, 100
    Send %Walk_Forward_Keybind%
    Sleep, 100
    return


WinCheck:
    IfWinnotActive, Destiny 2
    reload
    return



; Start macro
F11::
    setTimer, WinCheck, 500
    Loop
    {
        GoSub, RefillGlimmer
        GoSub, PreventAFK

        GoSub, BuyBlueTransmats
        GoSub, PreventAFK
    }

    return


; Stop macro
!F11::reload


