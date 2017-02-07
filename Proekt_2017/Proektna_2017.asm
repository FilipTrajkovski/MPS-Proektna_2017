
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
;Proektna_2017.c,20 :: 		switch(kp)
	GOTO       L_main4
;Proektna_2017.c,23 :: 		case 1:
L_main6:
;Proektna_2017.c,25 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,28 :: 		case 2:
L_main7:
;Proektna_2017.c,30 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,33 :: 		case 5:
L_main8:
;Proektna_2017.c,35 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,38 :: 		case 6:
L_main9:
;Proektna_2017.c,40 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,43 :: 		case 9:
L_main10:
;Proektna_2017.c,45 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,48 :: 		case 10:
L_main11:
;Proektna_2017.c,50 :: 		if(oldstate==5)
	MOVF       _oldstate+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;Proektna_2017.c,52 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,53 :: 		currentHeatA=0;
	CLRF       _currentHeatA+0
	CLRF       _currentHeatA+1
;Proektna_2017.c,54 :: 		}
	GOTO       L_main13
L_main12:
;Proektna_2017.c,55 :: 		else if(oldstate==6)
	MOVF       _oldstate+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;Proektna_2017.c,57 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,58 :: 		currentHeatC=0;
	CLRF       _currentHeatC+0
	CLRF       _currentHeatC+1
;Proektna_2017.c,59 :: 		}
	GOTO       L_main15
L_main14:
;Proektna_2017.c,62 :: 		currentHeatA=0;
	CLRF       _currentHeatA+0
	CLRF       _currentHeatA+1
;Proektna_2017.c,63 :: 		currentHeatC=0;
	CLRF       _currentHeatC+0
	CLRF       _currentHeatC+1
;Proektna_2017.c,64 :: 		started=0;
	CLRF       _started+0
	CLRF       _started+1
;Proektna_2017.c,65 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,66 :: 		PORTA=0b01101101;
	MOVLW      109
	MOVWF      PORTA+0
;Proektna_2017.c,67 :: 		}
L_main15:
L_main13:
;Proektna_2017.c,68 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,70 :: 		}
L_main4:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main11
L_main5:
;Proektna_2017.c,71 :: 		oldstate=kp;
	MOVF       _kp+0, 0
	MOVWF      _oldstate+0
;Proektna_2017.c,72 :: 		}
	GOTO       L_main0
;Proektna_2017.c,73 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
