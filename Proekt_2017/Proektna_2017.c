char keypadPort at PORTD;
int T1=20,V1=5,T2=25;
void main() {
     TRISA=0x00;
     PORTA=0x00;
     TRISC=0x00;
     PORTC=0x00;
     EEPROM_Write(0x00 , T1);
     EEPROM_Write(0x10 , V1);
     EEPROM_Write(0x20 , T2);
}