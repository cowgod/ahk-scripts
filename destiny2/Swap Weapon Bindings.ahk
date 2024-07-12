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

Global Settings_Screen_Keybind := "F5"

; Specify the bindings desired for each weapon type
; My mouse wheel is flipped in Windows, so I have to use the opposite of my actual motion here
Global Primary_Weapon_Alt_Keybind   := "WheelDown"
Global Special_Weapon_Alt_Keybind   := "WheelUp"
Global Power_Weapon_Primary_Keybind := "3"
Global Power_Weapon_Alt_Keybind     := "MButton"

;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Set the coordinates for all the mouse locations needed by the script, so we have a single
; place to update them if they change with future game updates


Global Settings_Screen_Scroll_X       := 2455
Global Settings_Screen_Scroll_Y       := 820

Global Kinetic_Weapon_Alt_Binding_X   := 2230
Global Kinetic_Weapon_Alt_Binding_Y   := 620

Global Energy_Weapon_Alt_Binding_X    := 2230
Global Energy_Weapon_Alt_Binding_Y    := 690

Global Power_Weapon_Primary_Binding_X := 1858
Global Power_Weapon_Primary_Binding_Y := 760

Global Power_Weapon_Alt_Binding_X     := 2230
Global Power_Weapon_Alt_Binding_Y     := 760


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Document the resolution the script was originally designed for, so we can adapt to other
; resolutions (DO NOT ADJUST)
CoordMode, Mouse, Screen
Global X_Original := 2560
Global Y_Original := 1440

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Define function to move to a specific point, scaled to the current screen resolution
MouseMove(X,Y)
{
    MouseMove, % X * A_ScreenWidth / X_Original, Y * A_ScreenHeight / Y_Original
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


OpenSettingsAndScrollToWeaponBindings()
{
    ; Send key to open settings
    Send, {%Settings_Screen_Keybind%}
    Sleep, 1000

    ; Scroll down
    MouseMove(Settings_Screen_Scroll_X, Settings_Screen_Scroll_Y)
    Sleep, 100

    Click
    Sleep, 100
}


StartKineticWeaponAltBinding()
{
    MouseMove(Kinetic_Weapon_Alt_Binding_X, Kinetic_Weapon_Alt_Binding_Y)
    Sleep, 100

    Click
    Sleep, 100
}


StartEnergyWeaponAltBinding()
{
    MouseMove(Energy_Weapon_Alt_Binding_X, Energy_Weapon_Alt_Binding_Y)
    Sleep, 100

    Click
    Sleep, 100
}


StartPowerWeaponPrimaryBinding()
{
    MouseMove(Power_Weapon_Primary_Binding_X, Power_Weapon_Primary_Binding_Y)
    Sleep, 100

    Click
    Sleep, 100
}


StartPowerWeaponAltBinding()
{
    MouseMove(Power_Weapon_Alt_Binding_X, Power_Weapon_Alt_Binding_Y)
    Sleep, 100

    Click
    Sleep, 100
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SetKineticPrimary()
{
	BlockInput, MouseMove

    OpenSettingsAndScrollToWeaponBindings()

    StartKineticWeaponAltBinding()
    Send {%Primary_Weapon_Alt_Keybind%}
    Sleep, 100

    StartEnergyWeaponAltBinding()
    Send {%Special_Weapon_Alt_Keybind%}
    Sleep, 100

    ; Leave the menu
    Send, {Esc}

	BlockInput, MouseMoveOff
}


SetEnergyPrimary()
{
	BlockInput, MouseMove

    OpenSettingsAndScrollToWeaponBindings()

    StartKineticWeaponAltBinding()
    Send {%Special_Weapon_Alt_Keybind%}
    Sleep, 100

    StartEnergyWeaponAltBinding()
    Send {%Primary_Weapon_Alt_Keybind%}
    Sleep, 100

    ; Leave the menu
    Send, {Esc}

    BlockInput, MouseMoveOff
}


EnablePowerWeapon()
{
	BlockInput, MouseMove

    OpenSettingsAndScrollToWeaponBindings()

    StartPowerWeaponAltBinding()
    Send {%Power_Weapon_Alt_Keybind%}
    Sleep, 100

    ; Leave the menu
    Send, {Esc}

    BlockInput, MouseMoveOff
}


DisablePowerWeapon()
{
	BlockInput, MouseMove

    OpenSettingsAndScrollToWeaponBindings()

    StartPowerWeaponAltBinding()
    Send {%Power_Weapon_Primary_Keybind%}
    Sleep, 100

    StartPowerWeaponPrimaryBinding()
    Send {%Power_Weapon_Primary_Keybind%}
    Sleep, 100

    ; Leave the menu
    Send, {Esc}

   	BlockInput, MouseMoveOff
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Keyboard Bindings
;;;;;
;;;;;
;;;;;; Switch to kinetic primary (Ctrl+Alt+Shift+1)
;;;;;^!+1::SetKineticPrimary()
;;;;;
;;;;;
;;;;;; Switch to energy primary (Ctrl+Alt+Shift+2)
;;;;;^!+2::SetEnergyPrimary()
;;;;;
;;;;;
;;;;;; Enable power weapon binding (Ctrl+Alt+Shift+3)
;;;;;^!+3::EnablePowerWeapon()
;;;;;
;;;;;
;;;;;; Disable power weapon binding (Ctrl+Alt+3)
;;;;;^!3::DisablePowerWeapon()


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; StreamDeck Bindings

; Switch to kinetic primary (F13)
F13::SetKineticPrimary()


; Switch to energy primary (Alt+F13)
!F13::SetEnergyPrimary()


; Enable power weapon binding (Ctrl+F13)
^F13::EnablePowerWeapon()


; Disable power weapon binding (Ctrl+Alt+F13)
^!F13::DisablePowerWeapon()
