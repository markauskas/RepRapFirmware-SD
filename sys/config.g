; Configuration file for Duet WiFi / Ethernet
; executed by the firmware on start-up

; General preferences
M111 S0							; Debugging off
G21							; Work in millimetres
G90							; Send absolute coordinates...
M83							; ...but relative extruder moves
M555 P2							; Set firmware compatibility to look like Marlin

; Network
M550 P"Extrudi"						; Set machine name
M552 S1							; Enable Networking
M586 P0 S1						; Enable HTTP
M586 P1 S0						; Disable FTP
M586 P2 S0						; Disable Telnet

M669 K1							; Select CoreXY mode

; Drive direction
M569 P0 S0						; Drive 0 X
M569 P1 S0						; Drive 1 Y
M569 P2 S1						; Drive 2 Z
M569 P3 S0						; Drive 3 E0
M569 P4 S1						; Drive 4 E1
M569 P5 S1						; Drive 5 E2
M569 P6 S1						; Drive 6 E3
M569 P7 S0						; Drive 7 COUPLER
M569 P8 S0						; Drive 8 UNUSED
M569 P9 S0						; Drive 9 UNUSED

M584 X0 Y1 Z2 C7 E3:4:5:6				; Apply custom drive mapping
M208 X-30.2:328.5 Y-46.1:243 Z0:300 C0:500 S0		; Set axis maxima & minima
M350 E8:16:8:8 C8 I0					; Configure microstepping without interpolation
M350 X16 Y16 Z16 I1					; Configure microstepping with interpolation
M92 X100 Y100 Z1600 C100 E417:409:417:417		; Set steps per mm
M566 X400 Y400 Z8 C2 E2:2:2:2				; Set maximum instantaneous speed changes (mm/min)
M203 X35000 Y35000 Z1200 C5000 E5000:5000:5000:5000	; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z400 C400 E2500:2500:2500:2500		; Set accelerations (mm/s^2)
M906 X1200 Y1200 Z1330 C400 E1200:1200:1200:1200 I30	; Set motor currents (mA) and motor idle factor in percent
M84 S120						; Set idle timeout

; Endstops
M574 X1 Y1 S1						; X / Y
M574 Z0
M558 P8 C"zstop" H3 F360 I0 T20000			; Set Z probe type to switch
G31 P200 X0 Y0 Z0					; Set Z probe trigger value, offset and trigger height
M557 X10:290 Y20:180 S40				; Mesh grid

; Stall Detection
M915 C S5 H200 F0 R0					; Coupler
M915 X Y S4 H200 R0 F0					; X / Y Axes

; Thermistors
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138 C0
M308 S1 P"e0temp" Y"thermistor" T100000 B4388
M308 S2 P"e1temp" Y"thermistor" T100000 B4388
M308 S3 P"e2temp" Y"thermistor" T100000 B4388
M308 S4 P"e3temp" Y"thermistor" T100000 B4388

; Heaters
M950 H0 T0 C"bedheat"
M950 H1 T1 C"e0heat"
M950 H2 T2 C"e1heat"
M950 H3 T3 C"duex.e2heat"
M950 H4 T4 C"duex.e3heat"

; Temperature limits
M143 H0 S120 ; previously: 225
M143 H1 S300
M143 H2 S300
M143 H3 S300
M143 H4 S300

; Tools
M563 P0 S"T0" D0 H1 F2
M563 P1 S"T1" D1 H2 F4
M563 P2 S"T2" D2 H3 F6
M563 P3 S"T3" D3 H4 F8

; Tool offsets
G10 P0 X0 Y0 Z0
G10 P1 X0 Y0 Z0
G10 P2 X0 Y0 Z0
G10 P3 X0 Y0 Z0

; Tool active/standby temperatures
G10 P0 R0 S0
G10 P1 R0 S0
G10 P2 R0 S0
G10 P3 R0 S0

; Fans
M950 F1 C"fan1"
M950 F2 C"fan2" Q25000
M950 F3 C"duex.fan3"
M950 F4 C"duex.fan4"
M950 F5 C"duex.fan5"
M950 F6 C"duex.fan6"
M950 F7 C"duex.fan7"
M950 F8 C"duex.fan8"

; M106 P0 S0 ; UNUSED

; Heater fans (temperature controlled)
M106 P1 S255 H1 T70
M106 P3 S255 H2 T70
M106 P5 S255 H3 T70
M106 P7 S255 H4 T70

; Part cooling fans
M106 P2 S0
M106 P4 S0
M106 P6 S0
M106 P8 S0

M593 F50 ; cancel ringing at 50Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)

;M376 H15 ; bed compensation taper

; Tool offsets
G10 P0 X-9 Y39 Z-5
G10 P1 X-9 Y39 Z-5
G10 P2 X-9 Y39 Z-5
G10 P3 X-9 Y39 Z-5

; Deselect tools
T-1

; Pressure advance
;M572 D0 S0.2
;M572 D1 S0.2
;M572 D2 S0.2
;M572 D3 S0.2
