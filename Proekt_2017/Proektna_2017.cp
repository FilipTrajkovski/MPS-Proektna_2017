#line 1 "D:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Examples/Proektna_2017/Proekt_2017/Proektna_2017.c"
char keypadPort at PORTD;
int T1=20,V1=5,T2=25,started=0,rangeSelected=0,currentHeatA=0,currentHeatC=0;
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
 switch(kp)
 {

 case 1:
 {
 break;
 }

 case 2:
 {
 break;
 }

 case 5:
 {
 break;
 }

 case 6:
 {
 break;
 }

 case 9:
 {
 break;
 }

 case 10:
 {
 if(oldstate==5)
 {
 PORTA=0x00;
 currentHeatA=0;
 }
 else if(oldstate==6)
 {
 PORTC=0x00;
 currentHeatC=0;
 }
 else
 {
 currentHeatA=0;
 currentHeatC=0;
 started=0;
 PORTC=0x00;
 PORTA=0b01101101;
 }
 break;
 }
 }
 oldstate=kp;
 }
}
