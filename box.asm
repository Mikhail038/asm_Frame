;18.02.22
;
.model tiny
.radix 16
.code
org 100

locals @@

Start:
                mov si, 82
                call ReadParameters

                mov DefX, ax       	    ;x
                ;mov dx, DefY        	;y

                ;mov bx, DefH           ;high
                ;mov cx, DefW       	;width


                mov si, offset ShiftS
                add si, 2               ;si -> first Style
                add si, ShiftS          ;si -> needed Style

                push ax
                mov ax, 0B800
                mov es, ax		;es -> VRAM
                pop ax

                call DrawFrame

                ret

ShiftS          dw 0001h
SingleS		    db 0DAh, 0C4h, 0BFh, 0B3h, 20h, 0B3h, 0C0h, 0C4h, 0D9h
DoubleS		    db 0C9h, 0CDh, 0BBh, 0BAh, 20h, 0BAh, 0C8h, 0CDh, 0BCh
LovelyS         db 03h, 03h, 03h, 03h, 20h, 03h, 03h, 03h, 03h

ShadowS         db 0B1h


BoxClr          db 70h
ShdClr          db 08h

DefX            dw 30d
DefY            dw 5d
DefH            dw 10d
DefW            dw 20d

Message         db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h

include box.asi


end             Start
