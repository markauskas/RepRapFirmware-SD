; homex.g
; called to home the x axis

G1 Y-45 F15000		; X endstop is at Y-45 position, so Y has to be homed before X

G91			; use relative positioning
G1 H2 Z3 F5000		; lift Z 3mm
G1 H1 X-400 F3000	; move left 400mm, stopping at the endstop
G1 X5 F2500		; move away from end
G1 H1 X-100 F300	; move slowly
G1 X2 F2500		; move away from end
G1 H2 Z-3 F1200		; lower Z
G90			; back to absolute positioning
