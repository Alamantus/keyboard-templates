Global NumKeys := 4

; Bind parameters to the function and returns a BoundFunc object:
Bound4 := Func("SetNumKeys").Bind(4)
Bound8 := Func("SetNumKeys").Bind(8)
Bound12 := Func("SetNumKeys").Bind(12)

; Create the menu and show it:
#Persistent
Menu Tray, NoStandard
Menu Tray, Add, Use 4-Key, % Bound4
Menu Tray, Add, Use 8-Key, % Bound8
Menu Tray, Add, Use Full, % Bound12
Menu Tray, Add
Menu Tray, Add, Pause, PauseScript
Menu Tray, Add, Exit, ExitScript
Return

; Make Right and Left Alt keys toggle
LAlt & RAlt::Suspend

; Make CapsLock backspace unless holding Shift
$+CapsLock::CapsLock
$CapsLock::Backspace

; If CapsLock is on, send reversed capitalization
#If GetKeyState("CapsLock","T")
{
	; 4-key Minimak
	$d::Send T 	; The $ symbol prevents infinite loops
	$+d::Send t
	$t::Send K
	$+t::Send k
	$e::Send D
	$+e::Send d
	$k::Send E
	$+k::Send e
}

; 8-key Minimak
#If GetKeyState("CapsLock","T") and NumKeys > 4
{
	$o::Send L
	$+o::Send l
	$l::Send O
	$+l::Send o
	$j::Send N
	$+j::Send n
	$n::Send J
	$+n::Send j
}
; Full Minimak
#If GetKeyState("CapsLock","T") and NumKeys > 8
{
	$r::Send F
	$+r::Send f
	$f::Send R
	$+f::Send r
	$p::Send `;
	$+p::Send :
	$`;::Send P
	$+`;::Send p
}

; If CapsLock is off, send normal capitalization
#If !GetKeyState("CapsLock","T")
{
	; 4-key Minimak
	$d::Send t
	$+d::Send T
	$t::Send k
	$+t::Send K
	$e::Send d
	$+e::Send D
	$k::Send e
	$+k::Send E
}

; 8-key Minimak
#If !GetKeyState("CapsLock","T") and NumKeys > 4
{
	$o::Send l
	$+o::Send L
	$l::Send o
	$+l::Send O
	$j::Send n
	$+j::Send N
	$n::Send j
	$+n::Send J
}

; Full Minimak
#If !GetKeyState("CapsLock","T") and NumKeys > 8
{
	$r::Send f
	$+r::Send F
	$f::Send r
	$+f::Send R
	$p::Send `;
	$+p::Send :
	$`;::Send p
	$+`;::Send P
}

; Definition of custom function SetNumKeys:
SetNumKeys(num, ItemName, MenuName, ItemPos)
{
  NumKeys := num
  MsgBox % "Now Using " . NumKeys . "-key Minimak layout."
}

PauseScript:
	Suspend On
	Menu Tray, Insert, Pause, Resume, ResumeScript
	Menu Tray, Delete, Pause
Return

ResumeScript:
	Suspend Off
	Menu Tray, Insert, Resume, Pause, PauseScript
	Menu Tray, Delete, Resume
Return

ExitScript:
 ExitApp
Return
