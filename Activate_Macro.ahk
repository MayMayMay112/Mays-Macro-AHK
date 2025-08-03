#Requires Autohotkey v2.0+
#UseHook
#SingleInstance Force
#Include "Modules\LoadData.ahk"
#Include "Modules\AutoAlign.ahk"
#Include "Modules\GearShop.ahk"
#Include "Modules\SeedShop.ahk"
#Include "Modules\EggShop.ahk"
#Include "Modules\Scaling.ahk"
#Include "Modules\Travel.ahk"
#Include "Modules\UIInitialize.ahk"
#Include "Events\BeeEvent.ahk"
#Include "Events\SumEvent.ahk"
#Include "Events\NightEvent.ahk"
#Include "Events\PrehistoricEvent.ahk"
#Include "Events\Zen.ahk"
#Include "Modules\CraftRoutine.ahk"

Persistent
; === Start Macro (Only if GUI is Loaded) ===
StartMacro(ThisHotkey := "null")
{
	global
	WinLangID := WinGetID("A")
	ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinLangID, "UInt", 0)
	InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
	If(!InputLocaleID){
		WinActivate("ahk_class WorkerW")
		WinLangID2 := WinGetID("ahk_class WorkerW")
		ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinLangID2, "UInt", 0)
		WinActivate("ahk_id " WinLangID)
		InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
	}
	LoadData()
	try {
		WinActivate("ahk_exe RobloxPlayerBeta.exe")
		} catch {
	}
	if (SlowMode) {
		SendMode("Event")
	}
	CoordMode("Mouse", "Screen")
	if (DebugMode) {
		Send("{F12}")
		Sleep(6000)
	}
	if (EventActiveDino || ForcePrehist) {
		PrehistoricPrep()
	}
	MouseMove(scaleX(700), scaleY(250), 3)
	Sleep(100)
	CraftModeA := 0
	CraftModeB := 0
	CraftStep := 0
	CraftActiveA := 0
	CraftActiveB := 0
	TopQ := 0
	GiftOption := 0
	GiftSkip := 0
	if (CraftTargetA != "None") {
		switch CraftTargetA {
			case "Horsetail":
			CraftTimeA := -1 * 10 * 60 * 1000
			CraftModeA := 1
			case "Lingonberry":
			CraftTimeA := -1 * 15 * 60 * 1000
			CraftModeA := 1
			case "Amber Spine":
			CraftTimeA := -1 * 30 * 60 * 1000
			CraftModeA := 1
			case "Grand Volcania":
			CraftTimeA := -1 * 45 * 60 * 1000
			CraftModeA := 1
			case "Peace Lily":
			CraftTimeA := -1 * 10 * 60 * 1000
			CraftModeA := 1
			case "Aloe Vera":
			CraftTimeA := -1 * 10 * 60 * 1000 ;Set craft time, -1 is because it should only run the timer once
			CraftModeA := 1
			case "Guanabana":
			CraftTimeA := -1 * 10 * 60 * 1000
			CraftModeA := 1
			default:
			CraftTimeA := 0
		}
		if (CraftInstant) {
			CraftTimeA := -1
		}
		SetTimer(ResetCraftTimer.Bind(0),CraftTimeA)
	}
	if (CraftTargetB != "None") {
		Switch CraftTargetB {
			case "Lightning":
			CraftTimeB := -1 * 45 * 60 * 1000
			CraftModeB := 1
			case "Reclaimer":
			CraftTimeB := -1 * 25 * 60 * 1000
			CraftModeB := 1
			case "Tropical Sprinkler":
			CraftTimeB := -1 * 60 * 60 * 1000
			CraftModeB := 1
			case "Berry Sprinkler":
			CraftTimeB := -1 * 60 * 60 * 1000
			CraftModeB := 1
			case "Spice Sprinkler":
			CraftTimeB := -1 * 60 * 60 * 1000
			CraftModeB := 1
			case "Sweet Sprinkler":
			CraftTimeB := -1 * 60 * 60 * 1000
			CraftModeB := 1
			case "Flower Sprinkler":
			CraftTimeB := -1 * 60 * 60 * 1000
			CraftModeB := 1
			case "Stalk Sprinkler":
			CraftTimeB := -1 * 60 * 60 * 1000
			CraftModeB := 1
			case "Choc Spray":
			CraftTimeB := -1 * 12 * 60 * 1000
			CraftModeB := 1
			case "Chilled Spray":
			CraftTimeB := -1 * 5 * 60 * 1000
			CraftModeB := 1
			case "Shocked Spray":
			CraftTimeB := -1 * 30 * 60 * 1000
			CraftModeB := 1
			case "Anti Bee":
			CraftTimeB := -1 * 2 * 60 * 60 * 1000
			CraftModeB := 1
			case "Small Toy":
			CraftTimeB := -1 * 10 * 60 * 1000
			CraftModeB := 1
			case "Small Treat":
			CraftTimeB := -1 * 10 * 60 * 1000
			CraftModeB := 1
			case "Pack Bee":
			CraftTimeB := -1 * 4 * 60 * 60 * 1000
			CraftModeB := 1
			default:
		}
		if (CraftInstant) {
			CraftTimeB := -1
		}
		SetTimer(ResetCraftTimer.Bind(1),CraftTimeB)
	}
	AutoAlignRoutine()
	UseReverse := 0
	
	WinGetPos(&WinX, &WinY, &WinW, &WinH, "A")
	if (WinW != ScreenResX || WinH != ScreenResY) {
		Send("{F11}")
		Sleep(1000)
	}
	RecalibrateCounter := 0
	FailCounter := 0
	if (GearsValue && !SeedsValue) {
		
		if (WrenchActive) {
			Send("{" WrenchSlot "}")
			Sleep(1000)
			SendMode("Event")
			MouseMove(scaleX(700), scaleY(250), 3)
			Sleep(400)
			Click()
			MouseMove(1, 0, 10, "R")
			Sleep(100)
			Click()
			if (!SlowMode) {
				SendMode("Input")
			}
			Sleep(800)
			} else {
			Send("{Down down}")
			Sleep(300 * MovementMulti)
			Send("{Down up}")
			Send("{d down}")
			Sleep(17150 * MovementMulti)
			Send("{d up}")
			Sleep(GlobalDelay)
			Send("{up down}")
			Sleep(250 * MovementMulti)
			Send("{up up}")
			Send("{d down}")
			Sleep(2000 * MovementMulti)
			Send("{d up}")
			Sleep(GlobalDelay)
			Send("{a down}")
			Sleep(200)
			Send("{a up}")
			Send("{up down}")
			Sleep(650 * MovementMulti)
			Send("{up up}")
			Sleep (GlobalDelay * 5)
		}
		
	}
	
	Loop
	{
		
		StartCycle()
		if (DebugMode) {
			Send("{F12}")
			Sleep(6000)
			Send("{F12}")
			Sleep(6000)
		}
		; === Seeds actions only if SeedsValue is enabled ===
		if (SeedsValue) {
			if (InterfaceButton = "\") { ; ") {
				Try { 
					PostMessage(0x0050, 0, 0x4090409,,"A")
					} catch {
				}
			}
			Sleep(50)
			Send("{" InterfaceButton "}")
			Try { 
				PostMessage(0x0050, 0, InputLocaleID,,"A")
				} catch {
			}
			If (UIInitMode) {
				UIInitialize()
			}
			Sleep(GlobalDelay)
			Send("{right 3}")
			Sleep(GlobalDelay * 3)
			Send("{Enter}")
			Sleep(400)
			Send("{Enter}")
			Sleep(400)
			Send("{up}")
			Sleep(GlobalDelay)
			if (InterfaceButton = "\") { ; ") {
				Try { 
					PostMessage(0x0050, 0, 0x4090409,,"A")
					} catch {
				}
			}
			Sleep(50)
			Send("{" InterfaceButton "}")
			Try { 
				PostMessage(0x0050, 0, InputLocaleID,,"A")
				} catch {
			}
			Sleep(GlobalDelay)
			
			Send(0)
			Send(0)
			Send("e")
			Sleep(50)
			Send("e")
			Sleep(50)
			Send("e")
			
			if (InterfaceButton = "\") { ; ") {
				Try { 
					PostMessage(0x0050, 0, 0x4090409,,"A")
					} catch {
				}
			}
			Sleep(50)
			Send("{" InterfaceButton "}")
			Try { 
				PostMessage(0x0050, 0, InputLocaleID,,"A")
				} catch {
			}
			
			If (UIInitMode) {
				UIInitialize()
			}
			Sleep(GlobalDelay)
			Send("{right 3}")
			Sleep(2000)
			searchX1 := scaleX(575)
			searchY1 := scaleY(215)
			searchX2 := scaleX(1290)
			searchY2 := scaleY(350)
			ShopColor := 0x53AB3A
			ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, ShopColor, 6)
			if (IgnoreErrors) {
				ErrorLevel := 0
			}
			if (ErrorLevel = 0) {
				FailCounter := 0
				GiftOption := 1
				SeedShopRoutine()
				GiftOption := 0
				} else {
				FailCounter++
				if (FailCounter > FailCountLimit) {
					ResetMacro()
				}
				Sleep(8000)
				Send("e")
				Sleep(2000)
				ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, ShopColor, 6)
				if (ErrorLevel = 0) {
					FailCounter := 0
					SeedShopRoutine()
					} else {
					FailCounter++
					If (UIInitMode) {
						UIInitialize()
					}
					Sleep(400)
					Send("{down}")
					Sleep(GlobalDelay)
					Send("{Enter}")
					Sleep(GlobalDelay)
					Send("{Enter}")
					if (InterfaceButton = "\") { ; ") {
						Try { 
							PostMessage(0x0050, 0, 0x4090409,,"A")
							} catch {
						}
					}
					Sleep(50)
					Send("{" InterfaceButton "}")
					Try { 
						PostMessage(0x0050, 0, InputLocaleID,,"A")
						} catch {
					}
					Sleep(2000)
					if (FailCounter > FailCountLimit) {
						ResetMacro()
					}
				}
			}
		}
		
		if (GearsValue) {
			
			;MouseMove(scaleX(700), scaleY(250), 10)
			;Loop 60 {
				;	Send("{Wheelup}")
				;	Sleep(10)
			;}
			
			;Sleep(500)
			
			;Loop 6 {
				;	Send("{WheelDown}")
				;	Sleep(GlobalDelay)
			;}
			
			if (GearsValue and (SeedsValue || BuyEggs || (BeeShop && (EventActiveBee || ForceBee)) || (Twiblood && (ForceNight || EventActiveNight)))) {
				if (WrenchActive) {
					Send("{" WrenchSlot "}")
					Sleep(1000)
					SendMode("Event")
					MouseMove(scaleX(700), scaleY(250), 3)
					Sleep(400)
					Click()
					MouseMove(1, 0, 10, "R")
					Sleep(100)
					Click()
					if (!SlowMode) {
						SendMode("Input")
					}
					Sleep(800)
					} else {
					Send("{Down down}")
					Sleep(300 * MovementMulti)
					Send("{Down up}")
					Send("{d down}")
					Sleep(17150 * MovementMulti)
					Send("{d up}")
					Sleep(GlobalDelay)
					Send("{up down}")
					Sleep(250 * MovementMulti)
					Send("{up up}")
					Send("{d down}")
					Sleep(2000 * MovementMulti)
					Send("{d up}")
					Sleep(GlobalDelay)
					Send("{a down}")
					Sleep(200)
					Send("{a up}")
					Send("{up down}")
					Sleep(650 * MovementMulti)
					Send("{up up}")
					Sleep (GlobalDelay * 5)
				}
			}
			
			Send(0)
			Send(0)
			Send("e")
			Sleep(1500)
			Send("e")
			ShopFound := 0
			Sleep(1500)	
			
			
			MouseMove(ScreenResX / 2, ScreenResY / 2, 10)
			SendMode("Event")
			TextToFind := "gear"
			ClickToOpen()
			if (DebugMode) {
				ToolTip(TextToFind)
			}
			Sleep(GlobalDelay * 2)
			Click()
			if (!SlowMode) {
				SendMode("Input")
			}
			Sleep(1500)
			
			if (InterfaceButton = "\") { ; ") {
				Try { 
					PostMessage(0x0050, 0, 0x4090409,,"A")
					} catch {
				}
			}
			Sleep(50)
			Send("{" InterfaceButton "}")
			Try { 
				PostMessage(0x0050, 0, InputLocaleID,,"A")
				} catch {
			}
			If (UIInitMode) {
				UIInitialize()
			}
			Sleep(GlobalDelay)
			Send("{right 3}")
			Sleep(2000)
			
			searchX1 := scaleX(575)
			searchY1 := scaleY(215)
			searchX2 := scaleX(1290)
			searchY2 := scaleY(350)
			ShopColor := 0x53AB3A
			ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, ShopColor, 6)
			if (IgnoreErrors) {
				ErrorLevel := 0
			}
			if (ErrorLevel = 0) {
				FailCounter := 0
				GiftOption := 1
				GearShopRoutine()
				GiftOption := 0
				} else {
				FailCounter++
				if (FailCounter > FailCountLimit) {
					ResetMacro()
				}
				Sleep(8000)
				Send("e")
				Sleep(3000)
				Send("e")
				MouseMove(ScreenResX / 2, ScreenResY / 2, 10)
				SendMode("Event")
				TextToFind := "gear"
				ClickToOpen()
				if (DebugMode) {
					ToolTip(TextToFind)
				}
				Sleep(GlobalDelay * 2)
				Click()
				if (!SlowMode) {
					SendMode("Input")
				}
				MouseMove(ScreenResX / 2, ScreenResY / 2, 10)
				SendMode("Event")
				TextToFind := "gear"
				ClickToOpen()
				if (DebugMode) {
					ToolTip(TextToFind)
				}
				Sleep(GlobalDelay * 2)
				Click()
				if (!SlowMode) {
					SendMode("Input")
				}
				Sleep(1500)
				ErrorLevel := !PixelSearch(&FoundX, &FoundY, searchX1, searchY1, searchX2, searchY2, ShopColor, 6)
				if (ErrorLevel = 0) {
					FailCounter := 0
					GearShopRoutine()
					} else {
					FailCounter++
					If (UIInitMode) {
						UIInitialize()
					}
					Sleep(400)
					Send("{down}")
					Sleep(GlobalDelay)
					Send("{Enter}")
					Sleep(GlobalDelay)
					Send("{Enter}")
					if (InterfaceButton = "\") { ; ") {
						Try { 
							PostMessage(0x0050, 0, 0x4090409,,"A")
							} catch {
						}
					}
					Sleep(50)
					Send("{" InterfaceButton "}")
					Try { 
						PostMessage(0x0050, 0, InputLocaleID,,"A")
						} catch {
					}
					Sleep(2000)
					if (FailCounter > FailCountLimit) {
						ResetMacro()
					}
				}
			}
		}
		if (BuyEggs) {
			EggShop()
		}
		if (ForceNight or EventActiveNight){
			NightRoutine()
		}
		if (ForceBee or EventActiveBee){
			BeeRoutine()
		}
		if (ForceSummer or EventActiveSummer){
			SummerRoutine()
		}
		
		if (EventActiveDino || ForcePrehist) {
			PrehistoricRoutine()
		}
		if (EventActiveZen || ForceZen) {
			ZenRoutine()
		}
		CraftRoutine()
		
		TravelingRoutine()
		if (RecalibrateCounter > AutoAlignRecal) {
			RecalibrateCounter := 1
			AutoAlignRoutine()
			} else {
			RecalibrateCounter++
		}
		; === PROPER WAIT SYSTEM ===
		
		; Only wait if needed
		if (endTime > A_TickCount) {
			; Start countdown
			
			SetTimer(UpdateToolTipCountdown,100)
			
			; ACTUAL WAIT (synchronized with countdown)
			while (A_TickCount < endTime) {
				Sleep(100)  ; Small sleeps to keep responsive
			}
			
			; Clean up
			ResetCycle()
			StartCycle()
		}
		
		; Loop restarts here
	} ; <-- This was missing
}
ResetCycle(ThisHotkey := "null")
{
	global
	CycleStartCheck := 1
	SetTimer(UpdateToolTipCountdown,0)
	ToolTip()
}
UpdateToolTipCountdown(ThisHotkey := "null")
{
	global
	remaining := (endTime - A_TickCount) / 1000
	if (remaining < 0)
	remaining := 0
	
	; Build status message
	status := "Waiting for next cycle"
	; Show tooltip
	CoordMode("Mouse", "Screen")
	MouseGetPos(&x, &y)
	ToolTip(status "`n" Round(remaining) " seconds remaining`nX: " x " Y: " y)
	return
}
StartCycle(ThisHotkey := "null")
{
	global
	CycleTimer := -1 * ((60 * 5 * 1000) + (TimerAdjustment * 1000))
	SetTimer(ResetCycle,CycleTimer)
	endTime := A_TickCount + Abs(CycleTimer)
}
; === Stop Macro ===

StopMacro(ThisHotkey := "null")
{
	global
	ExitApp()
	return
	
	
	; === Reset Macro ===
}
ResetMacro(ThisHotkey := "null")
{
	global
	Reload()
	return
	
	; === Load GUI ===
}

SettingsReturn(*) {
	global
	MacroState := 0
	IniWrite(MacroState, iniFile, "Settings", "MacroState")
	Reload()
}
LoadGuiActive(ThisHotkey := "null")
{
	global
	try {
		WinActivate("ahk_exe RobloxPlayerBeta.exe")
		} catch {
	}
	Hotkey(startKey, StartMacro, "On")
	Hotkey(resetKey, ResetMacro, "On")
	Hotkey(stopKey, StopMacro, "On")
	Hotkey(settingsKey, SettingsReturn, "On")
	if (IsSet(myGui)) {
		myGui.Destroy()
	}
	myGui1 := Gui()
	
	; Background color and styles
	myGui1.BackColor := "0x1E1E1E"  ; Dark gray background
	myGui1.Opt("-Caption +AlwaysOnTop +ToolWindow +Border")
	myGui1.MarginX := "20", myGui1.MarginY := "15"
	
	; Font style
	myGui1.SetFont("s15 cFFFFFF Bold", "Segoe UI")
	
	; Add centered texts
	myGui1.Add("Text", "x20 y10 w310 Center", "V" versionNumber " Created By: MayMay")
	myGui1.SetFont("s12 cDDDDDD bold")
	myGui1.Add("Text", "x20 y40 w310 Center", "Press " . startKey . " to start the macro")
	myGui1.Add("Text", "x20 y60 w310 Center", "Press " . stopKey . " to stop the macro")
	myGui1.Add("Text", "x20 y80 w310 Center", "Press " . resetKey . " to restart the macro")
	myGui1.Add("Text", "x20 y100 w310 Center", "Press " . settingsKey . " to return to settings")
	myGui1.Add("Text", "x20 y120 w310 Center", "Resolution: " . ScreenResX . "x" . ScreenResY . " : " Round(A_ScreenDPI / 96 * 100) . "%")
	
	; Show the GUI
	myGui1.Title := "Spam Toggle GUI"
	myGui1.Show("x10 y60 w350 h150")
	return
	
	
	
	; === Close Script Manually (Optional Use) ===
	CloseScript:
	ExitApp()
	return
	
}
