
_main:

;Proektna_2017.c,4 :: 		void main()
;Proektna_2017.c,6 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Proektna_2017.c,7 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,8 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Proektna_2017.c,9 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,10 :: 		EEPROM_Write(0x00 , T1);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _T1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,11 :: 		EEPROM_Write(0x10 , V1);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _V1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,12 :: 		EEPROM_Write(0x20 , T2);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _T2+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,13 :: 		PORTA=0b01101101;
	MOVLW      109
	MOVWF      PORTA+0
;Proektna_2017.c,14 :: 		while(1)
L_main0:
;Proektna_2017.c,16 :: 		while(!kp)
L_main2:
	MOVF       _kp+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Proektna_2017.c,18 :: 		kp=Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Proektna_2017.c,19 :: 		}
	GOTO       L_main2
L_main3:
;Proektna_2017.c,22 :: 		}
L_main4:
;Proektna_2017.c,23 :: 		}
	GOTO       L_main0
;Proektna_2017.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
