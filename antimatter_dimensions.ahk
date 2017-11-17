#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance ignore
SetTitleMatchMode, 2
DetectHiddenText ON

debugMessages := false


`::Suspend

F4::
	Stopped := 1
return

F3::
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; here are your config options to toggle certain keystrokes or functions ;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	useMaxAll := true

	;; all individual dims are ignored if useMaxAll is true
	d1 := false
	d2 := false
	d3 := false
	d4 := false
	d5 := false
	d6 := false
	d7 := false
	d8 := false


	doSacrifices := true
	doGalaxies := true
	doDBoosts := true
	doCrunch := true

	;; if offsetS is true, it will only send the sacrifice key on loops that are multiples of sOffsetValue
	offsetS := false
	SOffsetValue := 20

	;; if offsetD is true, it will only send the sacrifice key on loops that are multiples of DOffsetValue 
	offsetD := false
	DOffsetValue := 30



	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;; you shouldn't have to change anything under this. ;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	Stopped := 0
	SCount := 0
	DCount := 0


	Loop{
		if (useMaxAll = false && d1 = false && d2 = false && d3 = false && d4 = false && d5 = false && d6 = false && d7 = false && d8 = false){
			debug("useMaxAll and all individual dims are disabled, effectively meaning you will not buy any dims at all.", true)
		}

		sendString := ""

		if (useMaxAll = true){
			sendString = %sendString%m
		}

		if (useMaxAll = false && d1 = true){
			sendString = %sendString%1
		}
		if (useMaxAll = false && d2 = true){
			sendString = %sendString%2
		}
		if (useMaxAll = false && d3 = true){
			sendString = %sendString%3
		}
		if (useMaxAll = false && d4 = true){
			sendString = %sendString%4
		}
		if (useMaxAll = false && d5 = true){
			sendString = %sendString%5
		}
		if (useMaxAll = false && d6 = true){
			sendString = %sendString%6
		}
		if (useMaxAll = false && d7 = true){
			sendString = %sendString%7
		}
		if (useMaxAll = false && d8 = true){
			sendString = %sendString%8
		}
		
		;; add non-offset hotkeys
		if (doDBoosts = true && offsetD = false){
			debug("d shift or boosting")
			sendString = %sendString%d
		}
		if (offsetS = false && doSacrifices = true){
			debug("sending sacrifice")
			sendString = %sendString%s
		}
		if (doGalaxies = true){
			debug("buying galaxy")
			sendString = %sendString%g
		}
		if (doCrunch = true) {
			debug("crunching")
			sendString = %sendString%c
		}

		; set and send occasional dim boost every x loops
		if (doDBoosts = true && offsetD = true && DCount = DOffsetValue){
			debug("offset boost or shift")
			sendString = %sendString%d
			DCount = 0
		}

		; set and send occasional sacrifice command every x loops
		if (doSacrifices = true && offsetS = true && SCount = SOffsetValue){
			debug("offset sacrifice")
			sendString = %sendString%s
			SCount = 0
		}

		;debug(sendString, true)
		send, %sendString%

		SCount += 1
		DCount += 1 

		Sleep, 20

		if (Stopped = 1){
			break
		}
	}
return

F9::
	Stopped := 0
	Loop
	{
		MouseClick, Right
		Sleep, 20
		if (Stopped = 1){
			break
		}
	}
return

F2::

	WinGet, list, List, ahk_exe Chrome.exe
	Loop %list% {
		hwnd := list%A_Index%	; handles are in variables list1, list2, list3 etc. up to list%list%
		MsgBox % hwnd
		SetTitleMatchMode, 2
		;WinActivate, ahk_id %hwnd%
		Loop, 2s { ; max number of tabs
			WinGetTitle, WLName, ahk_id %hwnd% ;
			if(InStr(WLName, "Play Antimatter Dimensions")>0){
				send, m
			}
			;MsgBox % WLName
			Send ^{Tab}
			Sleep, 20
		}
	}
return

debug(msg, override := false){
	if (debugMessages = true || override = true){
		MsgBox % msg
	}
}