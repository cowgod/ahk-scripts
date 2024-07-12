#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#Persistent
#SingleInstance Force


; Only enable these hotkeys in Destiny
#IfWinActive Destiny 2


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UPDATE THESE to match your settings
;

Global Character_Screen_Keybind := "F1"
Global Energy_Weapon_Keybind    := "2"


;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Set the coordinates for all the mouse locations needed by the script, so we have a single
; place to update them if they change with future game updates
Global Energy_Weapon_Slot_X                 := 698
Global Energy_Weapon_Slot_Y                 := 690

Global Energy_Weapon_First_Inventory_Slot_X := 550
Global Energy_Weapon_First_Inventory_Slot_Y := 690



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



EquipFirstEnergyWeapon()
{
    ; Send key to open Character screen
    Send, {%Character_Screen_Keybind%}
    Sleep, 1250

	; Mouse over energy weapon
	MouseMove(Energy_Weapon_Slot_X, Energy_Weapon_Slot_Y)
	Sleep, 100

	; Mouse over first item in inventory
	MouseMove(Energy_Weapon_First_Inventory_Slot_X, Energy_Weapon_First_Inventory_Slot_Y)
	Sleep, 50

	; Equip the item
	Click
	Sleep,  50

    ; Leave the menu
    Send, {Esc}
	Sleep, 100
}


RunFourthHorsemanGlitch()
{
	BlockInput, MouseMove

	; Make sure we have energy weapon equipped
    Send, {%Energy_Weapon_Keybind%}
    Sleep, 50

	EquipFirstEnergyWeapon()

	; Fire all Fourth Horseman shots
    Click, Down
    Sleep, 850
    Click, Up
;    Sleep, 100

	EquipFirstEnergyWeapon()

	BlockInput, MouseMoveOff
}


^!+XButton2::RunFourthHorsemanGlitch()
