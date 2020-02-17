; homez.g
; called to home the Z axis

M98 P"/macros/Coupler - Unlock"	;Open Coupler

G91				; Relative mode
G1 H2 Z5 F5000			; Lower the bed
G90				; back to absolute positioning

G1 X150 Y100 F50000		; Position the endstop above the bed centre

G91				; Relative mode

G4 P200				; wait 500msec

G1 Z-300 H1 F600		; Move Z down until the switch triggers (first pass)

G1 Z3 F5000			; Lift Z

G1 Z-300 H1 F200		; Move Z down until the switch triggers (second pass)

G4 P100				; wait 500msec
G1 Z20 F5000			; Drop the Bed

G90				; Back to absolute positioning
