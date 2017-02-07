#line 1 "D:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Examples/Proektna_2017/Proekt_2017/Proektna_2017.c"
char keypadPort at PORTD;
int T1=20,V1=5,T2=25;
char kp,oldstate;
void main()
{
 TRISA=0x00;
 PORTA=0x00;
 TRISC=0x00;
 PORTC=0x00;
 EEPROM_Write(0x00 , T1);
 EEPROM_Write(0x10 , V1);
 EEPROM_Write(0x20 , T2);
 PORTA=0b01101101;
 while(1)
 {
 while(!kp)
 {
 kp=Keypad_Key_Click();
 }
 switch(kp){

 }
 }
}
