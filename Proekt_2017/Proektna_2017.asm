
_main:

;Proektna_2017.c,5 :: 		void main()
;Proektna_2017.c,7 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Proektna_2017.c,8 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,9 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Proektna_2017.c,10 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,11 :: 		EEPROM_Write(0x00 , T1);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _T1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,12 :: 		EEPROM_Write(0x10 , V1);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _V1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,13 :: 		EEPROM_Write(0x20 , T2);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _T2+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,14 :: 		PORTA=0x6D;
	MOVLW      109
	MOVWF      PORTA+0
;Proektna_2017.c,15 :: 		while(1)
L_main0:
;Proektna_2017.c,17 :: 		while(!kp)
L_main2:
	MOVF       _kp+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Proektna_2017.c,19 :: 		kp=Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Proektna_2017.c,20 :: 		}
	GOTO       L_main2
L_main3:
;Proektna_2017.c,21 :: 		switch(kp)
	GOTO       L_main4
;Proektna_2017.c,24 :: 		case 1:
L_main6:
;Proektna_2017.c,26 :: 		if(rangeSelected==1)
	MOVLW      0
	XORWF      _rangeSelected+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      1
	XORWF      _rangeSelected+0, 0
L__main22:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Proektna_2017.c,28 :: 		if(currentHeatA+1!=10)
	MOVF       _currentHeatA+0, 0
	ADDLW      1
	MOVWF      R1+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _currentHeatA+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      10
	XORWF      R1+0, 0
L__main23:
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;Proektna_2017.c,30 :: 		currentHeatA++;
	INCF       _currentHeatA+0, 1
	BTFSC      STATUS+0, 2
	INCF       _currentHeatA+1, 1
;Proektna_2017.c,31 :: 		}
L_main8:
;Proektna_2017.c,32 :: 		PORTA=arrayStates[currentHeatA-1];
	MOVLW      1
	SUBWF      _currentHeatA+0, 0
	MOVWF      R3+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _currentHeatA+1, 0
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arrayStates+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTA+0
;Proektna_2017.c,33 :: 		}
	GOTO       L_main9
L_main7:
;Proektna_2017.c,34 :: 		else if(rangeSelected==2)
	MOVLW      0
	XORWF      _rangeSelected+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      2
	XORWF      _rangeSelected+0, 0
L__main24:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;Proektna_2017.c,36 :: 		if(currentHeatC+1!=10)
	MOVF       _currentHeatC+0, 0
	ADDLW      1
	MOVWF      R1+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _currentHeatC+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      10
	XORWF      R1+0, 0
L__main25:
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;Proektna_2017.c,38 :: 		currentHeatC++;
	INCF       _currentHeatC+0, 1
	BTFSC      STATUS+0, 2
	INCF       _currentHeatC+1, 1
;Proektna_2017.c,39 :: 		}
L_main11:
;Proektna_2017.c,40 :: 		PORTC=arrayStates[currentHeatC-1];
	MOVLW      1
	SUBWF      _currentHeatC+0, 0
	MOVWF      R3+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _currentHeatC+1, 0
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _arrayStates+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Proektna_2017.c,41 :: 		}
L_main10:
L_main9:
;Proektna_2017.c,42 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,45 :: 		case 2:
L_main12:
;Proektna_2017.c,47 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,50 :: 		case 5:
L_main13:
;Proektna_2017.c,52 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,55 :: 		case 6:
L_main14:
;Proektna_2017.c,57 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,60 :: 		case 9:
L_main15:
;Proektna_2017.c,62 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,65 :: 		case 10:
L_main16:
;Proektna_2017.c,67 :: 		if(oldstate==5)
	MOVF       _oldstate+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;Proektna_2017.c,69 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,70 :: 		currentHeatA=0;
	CLRF       _currentHeatA+0
	CLRF       _currentHeatA+1
;Proektna_2017.c,71 :: 		}
	GOTO       L_main18
L_main17:
;Proektna_2017.c,72 :: 		else if(oldstate==6)
	MOVF       _oldstate+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;Proektna_2017.c,74 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,75 :: 		currentHeatC=0;
	CLRF       _currentHeatC+0
	CLRF       _currentHeatC+1
;Proektna_2017.c,76 :: 		}
	GOTO       L_main20
L_main19:
;Proektna_2017.c,79 :: 		currentHeatA=0;
	CLRF       _currentHeatA+0
	CLRF       _currentHeatA+1
;Proektna_2017.c,80 :: 		currentHeatC=0;
	CLRF       _currentHeatC+0
	CLRF       _currentHeatC+1
;Proektna_2017.c,81 :: 		started=0;
	CLRF       _started+0
	CLRF       _started+1
;Proektna_2017.c,82 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,83 :: 		PORTA=0x6D;
	MOVLW      109
	MOVWF      PORTA+0
;Proektna_2017.c,84 :: 		}
L_main20:
L_main18:
;Proektna_2017.c,85 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,87 :: 		}
L_main4:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main16
L_main5:
;Proektna_2017.c,88 :: 		oldstate=kp;
	MOVF       _kp+0, 0
	MOVWF      _oldstate+0
;Proektna_2017.c,89 :: 		}
	GOTO       L_main0
;Proektna_2017.c,90 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
