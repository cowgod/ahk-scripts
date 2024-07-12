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
; Before activating, update the keybind variables in the section below labeled "UPDATE THESE
; to match your settings".
;
; To activate macro, make sure you have an empty class item inventory, and no prime/exotic/etc
; engrams in your inventory that Rahool will want to decrypt. Fly to the tower, stand in front
; of Rahool where you see the prompt to interact with him, and press F11 to start the macro.
; To stop the macro, press Alt+F11.
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
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Document the resolution the script was originally designed for, so we can adapt to other
; resolutions (DO NOT ADJUST)
CoordMode, Mouse, Screen
Global X_Original := 2560
Global Y_Original := 1440


; Define function to move to a specific point, scaled to the current screen resolution
MouseMove(X,Y)
{
    MouseMove, % X * A_ScreenWidth / X_Original, Y * A_ScreenHeight / Y_Original
}



RahoolBuy250kGlimmer()
{
    MouseMove(1554, 718)

    Sleep, 500

    Loop, 25
    {
        Click
        Sleep, 1000
    }
}


RefillGlimmer()
{
    ; Interact with Rahool
    Send, {%Interact_Keybind% Down}
    Sleep, 500
    Send, {%Interact_Keybind% Up}
    Sleep, 3000

    ; Fill up on glimmer
    RahoolBuy250kGlimmer()

    ; Return to main screen
    Send, {Esc}
    Sleep, 2000
}


BuyItem()
{
    Click, Down
    Sleep, 4100
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


Buy9Items()
{
    ; Send key to open Character
    Send, {%Character_Screen_Keybind%}
    Sleep, 1500


    ; Move left twice to get to Collections
    Send {%Strafe_Left_Keybind%}
    Sleep, 500

    Send {%Strafe_Left_Keybind%}
    Sleep, 500


    ; Click on "Armor"
    MouseMove(1200, 600)
    Sleep, 500

    Click
    Sleep, 500

    ; Click on "Events"
    MouseMove(500, 850)
    Sleep, 1000

    Click
    Sleep, 500

    ; Navigate to 2nd page
    Send {Right}
    Sleep, 500

    ; Hover over class item to buy
    MouseMove(960, 630)
    Sleep, 100

    ; Buy 9x
    Loop, 9
    {
        BuyItem()
    }

    ; Return to main screen
    Send, {Esc}
    Sleep, 1500

    Send, {Esc}
    Sleep, 1500
}


Delete9Items()
{
    ; Send key to open Character
    Send, {%Character_Screen_Keybind%}
    Sleep, 1500

    ; Hover over class item
    MouseMove(1850, 1030)
    Sleep, 1000

    ; Hover over first inventory slot
    MouseMove(2020, 1030)
    Sleep, 500

    ; Delete 9x
    Loop, 9
    {
        DeleteItem()
    }

    ; Return to main screen
    Send, {Esc}
    Sleep, 1500
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



; Start macro
F11::
    setTimer, WinCheck, 500
    Loop
    {
        RefillGlimmer()
        PreventAFK()

        ; One item costs 777 glimmer. Sharding it returns 250 glimmer, so
        ; the net cost is 527 per item. One loop of buying & sharding 9x
        ; items costs 4743 glimmer. So to spend 250k glimmer, it will
        ; take 52 loops.
        Loop, 52
        {
            Buy9Items()
            PreventAFK()

            Delete9Items()
            PreventAFK()
        }
    }

    return


; Stop macro
!F11::reload


