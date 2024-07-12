#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#Persistent
#SingleInstance Force

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
Global Interact_Keybind := "f"
Global Dismantle_Keybind := "f"
Global Walk_Back_Keybind := "s"
Global Walk_Forward_Keybind := "w"
Global Strafe_Left_Keybind := "a"
Global Character_Screen_Keybind := "F1"


Global Glimmer_X := 327
Global Glimmer_Y := 591

Global Item_X := 1560
Global Item_Y := 630
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



RahoolHoverGlimmer()
{
    MouseMove(Glimmer_X, Glimmer_Y)
    Sleep, 1000
}



RahoolBuy500kGlimmer()
{
    RahoolHoverGlimmer()

    Loop, 50
    {
        BuyItemInstant()
        Sleep, 500
    }
}



RefillGlimmer()
{
    ; Interact with Rahool
    Send, {%Interact_Keybind% Down}
    Sleep, 500
    Send, {%Interact_Keybind% Up}
    Sleep, 3000


    ; Back out of umbral engram decryption (uncomment these 2 lines if there are umbral/trials engrams in inventory)
    Send, {Esc}
    Sleep, 1500



    ; Open "Materials Exchange"
    MouseMove(1650, 240)
    Sleep, 500
    Click, Right


    ; Fill up on glimmer
    RahoolBuy500kGlimmer()

    ; Return to main screen
    Send, {Esc}
    Sleep, 2000

    Send, {Esc}
    Sleep, 2000
}



Buy9Guns()
{
    ; Interact with Banshee
    Send, {%Interact_Keybind% Down}
    Sleep, 500
    Send, {%Interact_Keybind% Up}
    Sleep, 3000


    ; Move to the second page
    Send, {Right}
    Sleep, 1000


    ; Hover over gun to buy
    MouseMove(Item_X, Item_Y)
    Sleep, 1000

    ; Buy 9x
    Loop, 9
    {
        BuyItemInstant()
        Sleep, 1000
    }

    ; Return to main screen
    Send, {Esc}
    Sleep, 1500
}



Dismantle9Guns()
{
    ; Send key to open Character
    Send, {%Character_Screen_Keybind%}
    Sleep, 1500

    ; Hover over special weapon
    MouseMove(700, 525)
    Sleep, 500

    ; Hover over first item in inventory
    MouseMove(550, 525)
    Sleep, 500

    Loop, 9
    {
        DeleteItem()
    }

    ; Return to main screen
    Send, {Esc}
    Sleep, 1500
}




BuyItemInstant()
{
    Click, Down
    Sleep, 100
    Click, Up
    Sleep, 100
}


BuyItem1sec()
{
    Click, Down
    Sleep, 1100
    Click, Up
    Sleep, 100
}


DeleteItem()
{
    Send, {%Dismantle_Keybind% Down}
    Sleep, 1600
    Send, {%Dismantle_Keybind% Up}
    Sleep, 100
}



PreventAFK()
{
    Send %Walk_Back_Keybind%
    Sleep, 100
    Send %Walk_Forward_Keybind%
    Sleep, 100
}


WinCheck()
{
    IfWinnotActive, Destiny 2
    reload
}



; Start Refill Glimmer macro
F11::
    setTimer, WinCheck, 500
    RefillGlimmer()
    PreventAFK()
    return




; Start Buy & Shard Guns macro
F12::
    setTimer, WinCheck, 500
    Loop, 8
    {
        Buy9Guns()
        Dismantle9Guns()
        PreventAFK()
    }
    return


; Stop macros
!F11::reload
!F12::reload


