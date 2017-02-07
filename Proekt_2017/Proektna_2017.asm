
_main:

;Proektna_2017.c,2 :: 		void main() {
;Proektna_2017.c,3 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Proektna_2017.c,4 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,5 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Proektna_2017.c,6 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,7 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
