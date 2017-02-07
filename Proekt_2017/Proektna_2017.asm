
_main:

;Proektna_2017.c,3 :: 		void main() {
;Proektna_2017.c,4 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Proektna_2017.c,5 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,6 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Proektna_2017.c,7 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,8 :: 		EEPROM_Write(0x00 , T1);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _T1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,9 :: 		EEPROM_Write(0x10 , V1);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _V1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,10 :: 		EEPROM_Write(0x20 , T2);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _T2+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,11 :: 		PORTA=0b01101101;
	MOVLW      109
	MOVWF      PORTA+0
;Proektna_2017.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
