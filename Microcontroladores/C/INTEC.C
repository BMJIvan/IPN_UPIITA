#include		<htc.h>;
#include		<stdio.h>;

__CONFIG (FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);
__CONFIG (BOR4V_BOR40V & WRT_OFF);

void pause (unsigned short msvalue);
void msecbase (void);
#define LED RC0	

unsigned char TOC;

void interrupt isr(void)
{
if (TMR1IF = 1)
	{
	TMR1H = 0x0B;			// Preset Timer 1 to 3035 decimal 
	TMR1L = 0xDB;			//  using $0BDB hex
	TOC = TOC +1;			// Increment the timer overflow count
	TMR1IF = 0;				// Clear Timer1 overflow interrupt flag
	}
if(INTF)
	 {						// test if RB0 interrupt occurred
		LED=1^LED;		// toggle LED
		INTF=0;			// clear the interrupt
	 }
}
#define LED RC0	
//unsigned char VPA=0x00;
void main (void)
{
	ANSEL=0x00;
	ANSELH=0x00;
	
	TRISA=0x00;
	TRISB=0x01;
	TRISC=0x00;
	TRISD=0x00;
	TRISE=0x00;
	ADCON1=0x00;
	CM1CON0 = 0;
	CM2CON0 = 0;
		
	LED = 1;		// First time through interrupt will occur so this clears LED at start
	TRISB1 = 0;		// RC0 Set to output to drive LED 
	TRISB0 = 1;		// Set A2/INT pin to input
	//RBPU= 0;		// Use internal pullups
	OPTION_REG=0x80;
	WPUB0 = 1;		// RA2/INT Pull-up Enabled
	INTEDG = 0;		// falling edge trigger the interrupt
	INTE = 1;		// enable the external interrupt
	GIE = 1;		
//	CCP1CON=0x0C;
//	CCP2CON=0x0C;
//	T2CON=0X06;
//	T1CON=0X06;
//	while(!TMR2IF);


/* Timer1 Register Setup */

TMR1H = 0x0B;				// Preset Timer 1 to 3035 
TMR1L = 0xDB;				//  using $0BDB hex
T1CON = 0b00110000;			// Setup Timer1 with 1:8 prescaler
PIE1 = 0b00000001;			// Enable Timer1 Interrupt only
INTCON = 0b11000000;		// Enable interrupts GIE =1, PEIE = 1
TMR1ON = 1;					// Timer 1 On

/* PORTs and Global Variables Initialization */

//PORTB =0xFF;					// Initialize all LEDs off					// PortC all Outputs
TOC = 0;					// Initialize counter to zero

/* Continuous Loop */

while (1)
	{
if (TOC == 4)
		{
		PORTC = PORTC << 1;     // Light next LED by shifting bit left
		TOC = 0;				// Reset counter to zero
		}
	
	if (PORTC > 8)
		{
		PORTC = 1;				// Reset PORTC to Light DS1 LED
		}
	
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

