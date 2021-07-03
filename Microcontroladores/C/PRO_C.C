#include		<htc.h>;
#include		<stdio.h>;

__CONFIG (FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);
__CONFIG (BOR4V_BOR40V & WRT_OFF);

void pause (unsigned short msvalue);
void msecbase (void);

//unsigned char VPA=0x00;
void main (void)
{

	ANSEL=0x60;
	ANSELH=0x00;
	
	TRISA=0x01;
	TRISB=0x00;
	TRISC=0x00;
	TRISD=0x00;
	TRISE=0x03;
	ADCON1=0x00;
	
	while(1)
	{
		
		ADCON0=0xD5;
		GO_DONE=1;
		while(GO_DONE);

		PORTB=ADRESH;
		pause(1);
		
		
		ADCON0=0xD9;
		GO_DONE=1;
		while(GO_DONE);

		PORTB=ADRESH;
		pause(1);
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
	TMR0 = 0x06;			
	while(!T0IF);			
	T0IF = 0;			
}