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
	$w::Send D 	; The $ symbol prevents infinite loops
	$+w::Send d
	$e::Send R
	$+e::Send r
	$r::Send W
	$+r::Send w
	$t::Send B
	$+t::Send b
	$y::Send J
	$+y::Send j
	$u::Send F
	$+u::Send f
	$i::Send U
	$+i::Send u
	$o::Send P
	$+o::Send p
	$p::Send `;
	$+p::Send :
	$d::Send H
	$+d::Send h
	$f::Send T
	$+f::Send t
	$h::Send Y
	$+h::Send y
	$j::Send N
	$+j::Send n
	$k::Send E
	$+k::Send e
	$l::Send O
	$+l::Send o
	$`;::Send I
	$+`;::Send i
	$c::Send M
	$+c::Send m
	$v::Send C
	$+v::Send c
	$b::Send V
	$+b::Send v
	$n::Send K
	$+n::Send k
	$m::Send L
	$+m::Send l
}

; If CapsLock is off, send normal capitalization
#If !GetKeyState("CapsLock","T")
{
	$w::Send d 	; The $ symbol prevents infinite loops
	$+w::Send D
	$e::Send r
	$+e::Send R
	$r::Send w
	$+r::Send W
	$t::Send b
	$+t::Send B
	$y::Send j
	$+y::Send J
	$u::Send f
	$+u::Send F
	$i::Send u
	$+i::Send U
	$o::Send p
	$+o::Send P
	$p::Send `;
	$+p::Send :
	$d::Send h
	$+d::Send H
	$f::Send t
	$+f::Send T
	$h::Send y
	$+h::Send Y
	$j::Send n
	$+j::Send N
	$k::Send e
	$+k::Send E
	$l::Send o
	$+l::Send O
	$`;::Send i
	$+`;::Send I
	$c::Send m
	$+c::Send M
	$v::Send c
	$+v::Send C
	$b::Send v
	$+b::Send V
	$n::Send k
	$+n::Send K
	$m::Send l
	$+m::Send L
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
  MsgBox % "Now Using " . Format . " Workman layout."
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
