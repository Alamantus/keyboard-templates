; Make CapsLock backspace unless holding Shift
$+CapsLock::CapsLock
$CapsLock::Backspace

; If CapsLock is on, send reversed capitalization
#If GetKeyState("CapsLock","T")
; 4-key Minimak
$d::Send T 	; The $ symbol prevents infinite loops
$+d::Send t
$t::Send K
$+t::Send k
$e::Send D
$+e::Send d
$k::Send E
$+k::Send e

; 8-key Minimak
$o::Send L
$+o::Send l
$l::Send O
$+l::Send o
$j::Send N
$+j::Send n
$n::Send J
$+n::Send j

; Full Minimak
$r::Send F
$+r::Send f
$f::Send R
$+f::Send r
$p::Send `;
$+p::Send :
$`;::Send P
$+`;::Send p

; If CapsLock is off, send normal capitalization
#If !GetKeyState("CapsLock","T")
; 4-key Minimak
$d::Send t
$+d::Send T
$t::Send k
$+t::Send K
$e::Send d
$+e::Send D
$k::Send e
$+k::Send E

; 8-key Minimak
$o::Send l
$+o::Send L
$l::Send o
$+l::Send O
$j::Send n
$+j::Send N
$n::Send j
$+n::Send J

; Full Minimak
$r::Send f
$+r::Send F
$f::Send r
$+f::Send R
$p::Send `;
$+p::Send :
$`;::Send p
$+`;::Send P


;#If ; if you added more hotkeys to this script, putting them below a blank #If makes them non-context-sensitive
