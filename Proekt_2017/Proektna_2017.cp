#line 1 "D:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Examples/Proektna_2017/Proekt_2017/Proektna_2017.c"
char keypadPort at PORTD;
const int T1=20,V1=4,T2=25;
int started=0,rangeSelected=0,currentHeatA=0,currentHeatC=0,i;
int arrayStates[9]={0x6,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
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
 PORTA=0x6D;
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
 if(rangeSelected==1 && currentHeatA!=0)
 {
 if(currentHeatA+1!=10)
 {
 currentHeatA++;
 }
 PORTA=arrayStates[currentHeatA-1];
 }
 else if(rangeSelected==2 && currentHeatC!=0)
 {
 if(currentHeatC+1!=10)
 {
 currentHeatC++;
 }
 PORTC=arrayStates[currentHeatC-1];
 }
 break;
 }

 case 2:
 {
 if(rangeSelected==1 && started==1)
 {
 if(currentHeatA-1!=0)
 {
 currentHeatA--;
 }
 PORTA=arrayStates[currentHeatA-1];
 }
 else if(rangeSelected==2 && started==1)
 {
 if(currentHeatC-1!=0)
 {
 currentHeatC--;
 }
 PORTC=arrayStates[currentHeatC-1];
 }
 break;
 }

 case 5:
 {
 if(started==1){
 rangeSelected=1;
 }
 break;
 }

 case 6:
 {
 if(started==1){
 rangeSelected=2;
 }
 break;
 }

 case 9:
 {
 if(oldstate==5 && started==1)
 {
 currentHeatA=EEPROM_Read(0x10);
 PORTA=arrayStates[currentHeatA-1];
 }
 else if(oldstate==6 && started==1)
 {
 currentHeatC=EEPROM_Read(0x10);
 PORTC=arrayStates[currentHeatC-1];
 }
 else
 {

 Delay_ms(T1);
 PORTA=0x00;
 started=1;
 }
 break;
 }

 case 10:
 {
 if(oldstate==5)
 {
 PORTA=0x00;
 currentHeatA=0;
 rangeSelected=0;
 }
 else if(oldstate==6)
 {
 PORTC=0x00;
 currentHeatC=0;
 rangeSelected=0;
 }
 else
 {

 Delay_ms(T2);
 currentHeatA=0;
 currentHeatC=0;
 started=0;
 PORTC=0x00;
 PORTA=0x6D;
 }
 break;
 }
 }
 oldstate=kp;
 kp=0;
 }
}
