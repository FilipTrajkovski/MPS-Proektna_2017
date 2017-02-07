char keypadPort at PORTD;
int T1=20,V1=5,T2=25,started=0,rangeSelected=0;
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
                     // + pressed on Keypad
                     case 1:
                     {
                          break;
                     }
                     // - pressed on Keypad
                     case 2: 
                     {
                          break;
                     }
                     // P1 pressed on Keypad
                     case 5:
                     {
                          break;
                     }
                     // P2 pressd on Keypad
                     case 6:
                     {
                          break;
                     }
                     // START pressed on Keypad
                     case 9:
                     {
                          break;
                     }
                     // END pressed on Keypad
                     case 10:
                     {
                         break;
                     }
          }
          oldstate=kp;
     }
}