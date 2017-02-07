
_main:

;Proektna_2017.c,9 :: 		void main()
;Proektna_2017.c,12 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Proektna_2017.c,13 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,14 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Proektna_2017.c,15 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,17 :: 		EEPROM_Write(0x00 , T1);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVLW      20
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,18 :: 		EEPROM_Write(0x10 , V1);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      4
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,19 :: 		EEPROM_Write(0x20 , T2);
	MOVLW      32
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      25
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Proektna_2017.c,21 :: 		PORTA=0x6D;
	MOVLW      109
	MOVWF      PORTA+0
;Proektna_2017.c,22 :: 		while(1)
L_main0:
;Proektna_2017.c,25 :: 		while(!kp)
L_main2:
	MOVF       _kp+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Proektna_2017.c,27 :: 		kp=Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Proektna_2017.c,28 :: 		}
	GOTO       L_main2
L_main3:
;Proektna_2017.c,29 :: 		switch(kp)
	GOTO       L_main4
;Proektna_2017.c,32 :: 		case 1:
L_main6:
;Proektna_2017.c,34 :: 		if(rangeSelected==1 && currentHeatA!=0)
	MOVLW      0
	XORWF      _rangeSelected+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      1
	XORWF      _rangeSelected+0, 0
L__main54:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
	MOVLW      0
	XORWF      _currentHeatA+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      0
	XORWF      _currentHeatA+0, 0
L__main55:
	BTFSC      STATUS+0, 2
	GOTO       L_main9
L__main52:
;Proektna_2017.c,37 :: 		if(currentHeatA+1!=10)
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
	GOTO       L__main56
	MOVLW      10
	XORWF      R1+0, 0
L__main56:
	BTFSC      STATUS+0, 2
	GOTO       L_main10
;Proektna_2017.c,39 :: 		currentHeatA++;
	INCF       _currentHeatA+0, 1
	BTFSC      STATUS+0, 2
	INCF       _currentHeatA+1, 1
;Proektna_2017.c,40 :: 		}
L_main10:
;Proektna_2017.c,41 :: 		PORTA=arrayStates[currentHeatA-1];
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
	MOVLW      _arrayStates+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_arrayStates+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTA+0
;Proektna_2017.c,42 :: 		}
	GOTO       L_main11
L_main9:
;Proektna_2017.c,43 :: 		else if(rangeSelected==2 && currentHeatC!=0)
	MOVLW      0
	XORWF      _rangeSelected+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVLW      2
	XORWF      _rangeSelected+0, 0
L__main57:
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	MOVLW      0
	XORWF      _currentHeatC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVLW      0
	XORWF      _currentHeatC+0, 0
L__main58:
	BTFSC      STATUS+0, 2
	GOTO       L_main14
L__main51:
;Proektna_2017.c,46 :: 		if(currentHeatC+1!=10)
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
	GOTO       L__main59
	MOVLW      10
	XORWF      R1+0, 0
L__main59:
	BTFSC      STATUS+0, 2
	GOTO       L_main15
;Proektna_2017.c,48 :: 		currentHeatC++;
	INCF       _currentHeatC+0, 1
	BTFSC      STATUS+0, 2
	INCF       _currentHeatC+1, 1
;Proektna_2017.c,49 :: 		}
L_main15:
;Proektna_2017.c,50 :: 		PORTC=arrayStates[currentHeatC-1];
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
	MOVLW      _arrayStates+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_arrayStates+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;Proektna_2017.c,51 :: 		}
L_main14:
L_main11:
;Proektna_2017.c,52 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,55 :: 		case 2:
L_main16:
;Proektna_2017.c,57 :: 		if(rangeSelected==1  && started==1)
	MOVLW      0
	XORWF      _rangeSelected+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVLW      1
	XORWF      _rangeSelected+0, 0
L__main60:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
	MOVLW      0
	XORWF      _started+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      1
	XORWF      _started+0, 0
L__main61:
	BTFSS      STATUS+0, 2
	GOTO       L_main19
L__main50:
;Proektna_2017.c,60 :: 		if(currentHeatA-1!=0)
	MOVLW      1
	SUBWF      _currentHeatA+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _currentHeatA+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVLW      0
	XORWF      R1+0, 0
L__main62:
	BTFSC      STATUS+0, 2
	GOTO       L_main20
;Proektna_2017.c,62 :: 		currentHeatA--;
	MOVLW      1
	SUBWF      _currentHeatA+0, 1
	BTFSS      STATUS+0, 0
	DECF       _currentHeatA+1, 1
;Proektna_2017.c,63 :: 		}
L_main20:
;Proektna_2017.c,64 :: 		PORTA=arrayStates[currentHeatA-1];
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
	MOVLW      _arrayStates+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_arrayStates+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTA+0
;Proektna_2017.c,65 :: 		}
	GOTO       L_main21
L_main19:
;Proektna_2017.c,66 :: 		else if(rangeSelected==2  && started==1)
	MOVLW      0
	XORWF      _rangeSelected+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVLW      2
	XORWF      _rangeSelected+0, 0
L__main63:
	BTFSS      STATUS+0, 2
	GOTO       L_main24
	MOVLW      0
	XORWF      _started+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      1
	XORWF      _started+0, 0
L__main64:
	BTFSS      STATUS+0, 2
	GOTO       L_main24
L__main49:
;Proektna_2017.c,69 :: 		if(currentHeatC-1!=0)
	MOVLW      1
	SUBWF      _currentHeatC+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _currentHeatC+1, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      0
	XORWF      R1+0, 0
L__main65:
	BTFSC      STATUS+0, 2
	GOTO       L_main25
;Proektna_2017.c,71 :: 		currentHeatC--;
	MOVLW      1
	SUBWF      _currentHeatC+0, 1
	BTFSS      STATUS+0, 0
	DECF       _currentHeatC+1, 1
;Proektna_2017.c,72 :: 		}
L_main25:
;Proektna_2017.c,73 :: 		PORTC=arrayStates[currentHeatC-1];
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
	MOVLW      _arrayStates+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_arrayStates+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;Proektna_2017.c,74 :: 		}
L_main24:
L_main21:
;Proektna_2017.c,75 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,78 :: 		case 5:
L_main26:
;Proektna_2017.c,80 :: 		if(started==1){
	MOVLW      0
	XORWF      _started+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVLW      1
	XORWF      _started+0, 0
L__main66:
	BTFSS      STATUS+0, 2
	GOTO       L_main27
;Proektna_2017.c,81 :: 		rangeSelected=1;
	MOVLW      1
	MOVWF      _rangeSelected+0
	MOVLW      0
	MOVWF      _rangeSelected+1
;Proektna_2017.c,82 :: 		}
L_main27:
;Proektna_2017.c,83 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,86 :: 		case 6:
L_main28:
;Proektna_2017.c,88 :: 		if(started==1){
	MOVLW      0
	XORWF      _started+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      1
	XORWF      _started+0, 0
L__main67:
	BTFSS      STATUS+0, 2
	GOTO       L_main29
;Proektna_2017.c,89 :: 		rangeSelected=2;
	MOVLW      2
	MOVWF      _rangeSelected+0
	MOVLW      0
	MOVWF      _rangeSelected+1
;Proektna_2017.c,90 :: 		}
L_main29:
;Proektna_2017.c,91 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,94 :: 		case 9:
L_main30:
;Proektna_2017.c,96 :: 		if(oldstate==5 && started==1)
	MOVF       _oldstate+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main33
	MOVLW      0
	XORWF      _started+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      1
	XORWF      _started+0, 0
L__main68:
	BTFSS      STATUS+0, 2
	GOTO       L_main33
L__main48:
;Proektna_2017.c,99 :: 		currentHeatA=EEPROM_Read(0x10);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _currentHeatA+0
	CLRF       _currentHeatA+1
;Proektna_2017.c,100 :: 		PORTA=arrayStates[currentHeatA-1];
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
	MOVLW      _arrayStates+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_arrayStates+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTA+0
;Proektna_2017.c,101 :: 		}
	GOTO       L_main34
L_main33:
;Proektna_2017.c,102 :: 		else if(oldstate==6 && started==1)
	MOVF       _oldstate+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	MOVLW      0
	XORWF      _started+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      1
	XORWF      _started+0, 0
L__main69:
	BTFSS      STATUS+0, 2
	GOTO       L_main37
L__main47:
;Proektna_2017.c,105 :: 		currentHeatC=EEPROM_Read(0x10);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _currentHeatC+0
	CLRF       _currentHeatC+1
;Proektna_2017.c,106 :: 		PORTC=arrayStates[currentHeatC-1];
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
	MOVLW      _arrayStates+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_arrayStates+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;Proektna_2017.c,107 :: 		}
	GOTO       L_main38
L_main37:
;Proektna_2017.c,111 :: 		if(started!=1)
	MOVLW      0
	XORWF      _started+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      1
	XORWF      _started+0, 0
L__main70:
	BTFSC      STATUS+0, 2
	GOTO       L_main39
;Proektna_2017.c,113 :: 		Delay_ms(T1);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	NOP
	NOP
;Proektna_2017.c,114 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,115 :: 		started=1;
	MOVLW      1
	MOVWF      _started+0
	MOVLW      0
	MOVWF      _started+1
;Proektna_2017.c,116 :: 		}
L_main39:
;Proektna_2017.c,117 :: 		}
L_main38:
L_main34:
;Proektna_2017.c,118 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,121 :: 		case 10:
L_main41:
;Proektna_2017.c,123 :: 		if(oldstate==5)
	MOVF       _oldstate+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main42
;Proektna_2017.c,126 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Proektna_2017.c,127 :: 		currentHeatA=0;
	CLRF       _currentHeatA+0
	CLRF       _currentHeatA+1
;Proektna_2017.c,128 :: 		rangeSelected=0;
	CLRF       _rangeSelected+0
	CLRF       _rangeSelected+1
;Proektna_2017.c,129 :: 		}
	GOTO       L_main43
L_main42:
;Proektna_2017.c,130 :: 		else if(oldstate==6)
	MOVF       _oldstate+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main44
;Proektna_2017.c,133 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,134 :: 		currentHeatC=0;
	CLRF       _currentHeatC+0
	CLRF       _currentHeatC+1
;Proektna_2017.c,135 :: 		rangeSelected=0;
	CLRF       _rangeSelected+0
	CLRF       _rangeSelected+1
;Proektna_2017.c,136 :: 		}
	GOTO       L_main45
L_main44:
;Proektna_2017.c,141 :: 		Delay_ms(T2);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	NOP
;Proektna_2017.c,142 :: 		currentHeatA=0;
	CLRF       _currentHeatA+0
	CLRF       _currentHeatA+1
;Proektna_2017.c,143 :: 		currentHeatC=0;
	CLRF       _currentHeatC+0
	CLRF       _currentHeatC+1
;Proektna_2017.c,144 :: 		started=0;
	CLRF       _started+0
	CLRF       _started+1
;Proektna_2017.c,145 :: 		PORTC=0x00;
	CLRF       PORTC+0
;Proektna_2017.c,146 :: 		PORTA=0x6D;
	MOVLW      109
	MOVWF      PORTA+0
;Proektna_2017.c,147 :: 		}
L_main45:
L_main43:
;Proektna_2017.c,148 :: 		break;
	GOTO       L_main5
;Proektna_2017.c,150 :: 		}
L_main4:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main26
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main28
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main30
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main41
L_main5:
;Proektna_2017.c,152 :: 		oldstate=kp;
	MOVF       _kp+0, 0
	MOVWF      _oldstate+0
;Proektna_2017.c,153 :: 		kp=0;
	CLRF       _kp+0
;Proektna_2017.c,154 :: 		}
	GOTO       L_main0
;Proektna_2017.c,155 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
