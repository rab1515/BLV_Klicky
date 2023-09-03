; homeall.g
; called to home all axes
;
; generated by RepRapFirmware Configuration Tool v3.2.3 on Sun Mar 14 2021 16:28:18 GMT-0400 (Eastern Daylight Time)
G91                     	; relative positioning
G1 H4 Z5 F99999           	; lift Z relative to current position, stopping at MAX endstop
G1 H1 X-500 Y500 F6000  	; move quickly to X or Y endstop and stop there (first pass)
G1 H1 X-500 F6000       	; home X axis
G1 H1 Y500 F6000        	; home Y axis
G1 X4 Y-5 F6000         	; go back a few mm
G1 H1 X-500 F360        	; move slowly to X axis endstop once more (second pass)
G1 H1 Y500 F360         	; then move slowly to Y axis endstop
G1 H4 Z-5 F99999   
G90							; abs posistioning

M98 P"0:/sys/homez.g"
G1 F99999 X{move.axes[0].min} Y{move.axes[0].max}



; Uncomment the following lines to lift Z after probing
;G91                    ; relative positioning
;G1 Z5 F100             ; lift Z relative to current position
;G90                    ; absolute positioning

