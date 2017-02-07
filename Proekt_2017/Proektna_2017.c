char keypadPort at PORTD;
int T1=20,V1=5,T2=25,started=0,rangeSelected=0,currentHeatA=0,currentHeatC=0,i;
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
                     // + pressed on Keypad
                     case 1:
                     {
                          if(rangeSelected==1)
                          {
                               if(currentHeatA+1!=10)
                               {
                                currentHeatA++;
                               }
                               PORTA=arrayStates[currentHeatA-1];
                          }
                          else if(rangeSelected==2)
                          {
                               if(currentHeatC+1!=10)
                               {
                                currentHeatC++;
                               }
                               PORTC=arrayStates[currentHeatC-1];
                          }
                          break;
                     }
                     // - pressed on Keypad
                     case 2: 
                     {
                          if(rangeSelected==1)
                          {
                               if(currentHeatA-1!=0)
                               {
                                currentHeatA--;
                               }
                               PORTA=arrayStates[currentHeatA-1];
                          }
                          else if(rangeSelected==2)
                          {
                               if(currentHeatC-1!=0)
                               {
                                currentHeatC--;
                               }
                               PORTC=arrayStates[currentHeatC-1];
                          }
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
                              PORTA=0x6D;
                         }
                         break;
                     }
          }
          oldstate=kp;
     }
}