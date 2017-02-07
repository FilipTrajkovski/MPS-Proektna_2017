char keypadPort at PORTD;
char kp,oldstate;

const int T1=20,V1=4,T2=25;
const int arrayStates[9]={0x6,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

int started=0,rangeSelected=0,currentHeatA=0,currentHeatC=0,i;

void main() 
{
     // Set O-pins and initial values to Port A,C
     TRISA=0x00;
     PORTA=0x00;
     TRISC=0x00;
     PORTC=0x00;
     // Saved T1,V1,T2 into EEPROM
     EEPROM_Write(0x00 , T1);
     EEPROM_Write(0x10 , V1);
     EEPROM_Write(0x20 , T2);
     
     PORTA=0x6D;
     while(1)
     {
          // Loop until Keypad is pressed
          while(!kp)
          {
                     kp=Keypad_Key_Click();
          }
          switch(kp)
          {
                     // + pressed on Keypad
                     case 1:
                     {
                          if(rangeSelected==1 && currentHeatA!=0)
                          {
                               // Check if incrementing the heat will result in higher than 9
                               if(currentHeatA+1!=10)
                               {
                                currentHeatA++;
                               }
                               PORTA=arrayStates[currentHeatA-1];
                          }
                          else if(rangeSelected==2 && currentHeatC!=0)
                          {
                               // Check if incrementing the heat will result in higher than 9
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
                          if(rangeSelected==1  && started==1)
                          {
                               // Check if decrementing the heat will result in lower than 1
                               if(currentHeatA-1!=0)
                               {
                                currentHeatA--;
                               }
                               PORTA=arrayStates[currentHeatA-1];
                          }
                          else if(rangeSelected==2  && started==1)
                          {
                               // Check if decrementing the heat will result in lower than 1
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
                          if(started==1){
                               rangeSelected=1;
                          }
                          break;
                     }
                     // P2 pressd on Keypad
                     case 6:
                     {
                          if(started==1){
                               rangeSelected=2;
                          }
                          break;
                     }
                     // START pressed on Keypad
                     case 9:
                     {
                          if(oldstate==5 && started==1)
                          {
                                  //Set up and start P1
                                  currentHeatA=EEPROM_Read(0x10);
                                  PORTA=arrayStates[currentHeatA-1];
                          }
                          else if(oldstate==6 && started==1)
                          {
                                  //Set up and start P2
                                  currentHeatC=EEPROM_Read(0x10);
                                  PORTC=arrayStates[currentHeatC-1];
                          }
                          else
                          {
                                  //Delay_ms(EEPROM_Read(0x00));
                                  if(started!=1)
                                  {
                                      Delay_ms(T1);
                                      PORTA=0x00;
                                      started=1;
                                  }
                          }
                          break;
                     }
                     // END pressed on Keypad
                     case 10:
                     {
                         if(oldstate==5)
                         {
                              //Reset and shutdown on P1
                              PORTA=0x00;
                              currentHeatA=0;
                              rangeSelected=0;
                         }
                         else if(oldstate==6)
                         {
                              //Reset and shutdown on P2
                              PORTC=0x00;
                              currentHeatC=0;
                              rangeSelected=0;
                         }
                         else
                         {
                              //Delay_ms(EEPROM_Read(0x20));
                              //Reset and shutdown on both ranges
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
          //Save previous Keypad button pressed and reset current Keypad pressed button
          oldstate=kp;
          kp=0;
     }
}