;14.02.22
;
.model tiny
.radix 16
.code
org 100

locals @@

Start:          mov ax, 0B800
                mov es, ax

                mov ax, 2       ;x
                mov dh, 2       ;y

                mov bh, 10       ;width
                mov cx, 8       ;high


                push ax
                push dx
                push bx
                push cx

                add ax, 2
                add dh, 1

                mov si, 0EB0h
                call DrawRect

                pop cx
                pop bx
                pop dx
                pop ax

                mov si, 70DBh
                call DrawFrm

                ret

include frame.asi

end             Start
