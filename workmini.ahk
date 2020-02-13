Global Format := "Regular"

; Create the menu and show it:
#Persistent
Menu Tray, NoStandard
Menu Tray, Add, Use Programmer Mode, ProgrammerOn
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
	$e::Send D 	; The $ symbol prevents infinite loops
	$+e::Send d
	$r::Send F
	$+r::Send f
	$t::Send B
	$+t::Send b
	$y::Send J
	$+y::Send j
	$o::Send L
	$+o::Send l
	$p::Send `;
	$+p::Send :

	$d::Send T
	$+d::Send t
	$f::Send R
	$+f::Send r
	$h::Send Y
	$+h::Send y
	$j::Send N
	$+j::Send n
	$k::Send E
	$+k::Send e
	$l::Send O
	$+l::Send o
	$`;::Send P
	$+`;::Send p

	$z::Send X
	$+z::Send x
	$x::Send H
	$+x::Send h
	$b::Send Z
	$+b::Send z
	$n::Send K
	$+n::Send k
}

; If CapsLock is off, send normal capitalization
#If !GetKeyState("CapsLock","T")
{
	$e::Send d 	; The $ symbol prevents infinite loops
	$+e::Send D
	$r::Send f
	$+r::Send F
	$t::Send b
	$+t::Send B
	$y::Send j
	$+y::Send J
	$o::Send l
	$+o::Send L
	$p::Send `;
	$+p::Send :

	$d::Send t
	$+d::Send T
	$f::Send r
	$+f::Send R
	$h::Send y
	$+h::Send Y
	$j::Send n
	$+j::Send N
	$k::Send e
	$+k::Send E
	$l::Send o
	$+l::Send O
	$`;::Send p
	$+`;::Send P

	$z::Send x
	$+z::Send X
	$x::Send h
	$+x::Send H
	$b::Send z
	$+b::Send Z
	$n::Send k
	$+n::Send K
}

; Programmer
#If Format = "Programmer"
{
	$`::Send ~
	$+`::Send ``
	$1::Send {!}
	$+1::Send 1
	$2::Send `@
	$+2::Send 2
	$3::Send {#}
	$+3::Send 3
	$4::Send `$
	$+4::Send 4
	$5::Send `%
	$+5::Send 5
	$6::Send {^}
	$+6::Send 6
	$7::Send `&
	$+7::Send 7
	$8::Send `*
	$+8::Send 8
	$9::Send {(}
	$+9::Send 9
	$0::Send {)}
	$+0::Send 0
	$[::Send {{}
	$+[::Send [
	$]::Send {}}
	$+]::Send ]
}

; Definition of custom function SetFormat:
SetFormat(formatName)
{
  Format := formatName
  MsgBox % "Now Using " . Format . " Workmini layout."
}

ProgrammerOn:
	SetFormat("Programmer")
	Menu Tray, Insert, Use Programmer Mode, Use Regular Mode, ProgrammerOff
	Menu Tray, Delete, Use Programmer Mode
Return

ProgrammerOff:
	SetFormat("Regular")
	Menu Tray, Insert, Use Regular Mode, Use Programmer Mode, ProgrammerOn
	Menu Tray, Delete, Use Regular Mode
Return

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
