; homeall.g
; called to home all axes

M98 P"homec.g"			; Home C (coupler)
M98 P"homey.g"			; Home Y
M98 P"homex.g"			; Home X
M98 P"homez.g"			; Home Z

G1 X150 Y0 Z30 F15000		; Park
