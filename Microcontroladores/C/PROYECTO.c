#include		<htc.h>;
#include		<stdio.h>;
__CONFIG (FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);
__CONFIG (BOR4V_BOR40V & WRT_OFF);

void pause (unsigned short msvalue);
void msecbase (void);

void Initialize_Bluetooth()
{
    TRISC6=1;
    TRISC7=1;
    SYNC=0;
    SPEN=1;
    BRGH=1;      
    SPBRG =25;
    RX9=0;
    TX9=0;
    TXEN=1; 
    CREN=1; 
    GIE = 0;
    PEIE= 0;
    RCIE=0;
    TXIE=0;
}

void BT_load_char(char byte)  
{
    TXREG = byte;
    while(!TXIF);  
    while(!TRMT);
}

void BT_load_string(char* string)
{
    while(*string)
    BT_load_char(*string++);
}

void broadcast_BT()
{
  TXREG = 13;  
pause(500);
}

char BT_get_char(void)   
{
    if(OERR)
    {
        CREN = 0;
        CREN = 1;
    }
    
    if(RCIF==1) //if the user has sent a char return the char (ASCII value)
    {
    while(!RCIF);  
    return RCREG;
    }
    else //if user has sent no message return 0
        return 0;
}

void main(void)
{
    int get_value;
    TRISB=0x00;
   Initialize_Bluetooth(); 
	
   //Show some introductory message once on power up//
   BT_load_string("Bluetooth Initialized and Ready");
   broadcast_BT();
   BT_load_string("Press 1 to turn ON LED");
   broadcast_BT();
   BT_load_string("Press 0 to turn OFF LED");
   broadcast_BT();
   //End of message//
	unsigned char cl=0;

	PORTB=0;   
    while(1) 
    {   
        
    get_value = BT_get_char(); //Read the char. received via BT
    
        if (get_value=='0')//detener
          {
             PORTB=0x00;
			PORTD=0x00; 
             broadcast_BT();
          }
       
        if (get_value=='1')//avanzar
          {
             PORTB=0x01;
				PORTD=0x40;
             broadcast_BT();
          }      
		if (get_value=='2')//retroceder
          {
             PORTB=0x02;
				PORTD=0x80; 
             broadcast_BT();
          }
       
        if (get_value=='3')//giro derecha 
          {
             PORTB=0x02;
			 PORTD=0x40;
			RA3=1;//led derecho
             broadcast_BT();
          }     		
		if (get_value=='4')//giro izquierda
          {
             PORTB=0x01;
			 PORTD=0x80; 
            RA4=1;//led izquierdo
			 broadcast_BT();
          }
       
        if (get_value=='5')//encender luces enfrente
          {
             RA0=1;
			 RA1=1;
             broadcast_BT();
          }     
        if (get_value=='6')//apagar luces enfrente
          {
             RA0=0;
			 RA1=0;
             broadcast_BT();
          }
        if (get_value=='7')//claxon
          {	
             RA2=1;
			pause(250);
			RA2=0;
             broadcast_BT();
          }
pause(100);    
}
}

void pause( unsigned short msvalue)
{
		unsigned short x;

		for(x=0;x<msvalue;x++)
				{ 
				msecbase();
				}
}
void msecbase(void)
{
	OPTION_REG = 0b11000001;	
	TMR0=0x06;			
	while(!T0IF);			
	T0IF=0;			
}
