#include		<htc.h>;
#include		<stdio.h>;

__CONFIG (FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);
__CONFIG (BOR4V_BOR40V & WRT_OFF);

void pause (unsigned short msvalue);
void msecbase (void);

#define	LCD_RS RC0
#define	LCD_EN RC1
#define LCD_DATA	PORTD
#define	LCD_STROBE()((LCD_EN=1),(LCD_EN=0))

#define number 0x30

unsigned char b0;


//unsigned char VPA=0x00;
void main (void)
{
	ANSEL=0x60;
	ANSELH=0x00;
	
	TRISA=0x00;
	TRISB=0x00;
	TRISC=0x00;
	TRISD=0x00;
	TRISE=0x03;
	ADCON1=0x00;
	CM1CON0 = 0;
	CM2CON0 = 0;
	
	while(1)
	{		
		ADCON0=0xD5;
		GO_DONE=1;
		while(GO_DONE);

		//PORTB=ADRESH;
		pause(1);
			
		ADCON0=0xD9;
		GO_DONE=1;
		while(GO_DONE);

		//PORTB=ADRESH;
		pause(1);
		
		
	lcd_init();		

	while (1)
	{
	lcd_clear();				
	lcd_goto(0);				
//	lcd_puts("Beginners Guide");	// Display Hello World
	for (b0=0; b0<10; b0=b0+1)	// Create counting loop
		{
		lcd_putch(b0+number);	// Display count on LCD
		pause (250);			// Delay 250 msec to see count
		}
	lcd_goto(0x40);				// Select second line
//	lcd_puts("    Volume 2");	// Display Hello World
	lcd_puts("Hello World");	// Display Hello World
	pause (100);				// Delay for 1 second to read display
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

void lcd_write(unsigned char c)
{
	pause (1);
	LCD_DATA=((c>>4)&0x0F);
	LCD_STROBE();
	LCD_DATA=(c&0x0F);
	LCD_STROBE();	
}

void lcd_clear(void)
{
	LCD_RS = 0;
	lcd_write(0x01);
	pause (2);
}

void lcd_puts(const char * s)
{
	LCD_RS = 1;	// write characters
	while(*s)
		lcd_write(*s++);
}

void lcd_putch(char c)
{
	LCD_RS = 1;	// write characters
	lcd_write( c );
}

void lcd_goto(unsigned char pos)
{
	LCD_RS = 0;
	lcd_write(0x80+pos);
}

void lcd_init(void)
{
	char init_value;

	ANSEL =0x60;			// Disable analog pins on PORTA
	
	init_value = 0x03;
	TRISA=0;
	TRISC=0;
	LCD_RS = 0;
	LCD_EN = 0;
//	LCD_RW = 0;
	
	pause (15);				// wait 15mSec after power applied,
	LCD_DATA	 = init_value;
	LCD_STROBE();
	pause(10);
	LCD_STROBE();
	pause(10);
	LCD_STROBE();
	pause(10);
	LCD_DATA = 2;	// Four bit mode
	LCD_STROBE();
	
	lcd_write(0x28); // Set interface length
//	lcd_write(0x0C); // Display On, Cursor Off, Blink Off
	lcd_write(0x0F); // Display On, Cursor On, Cursor Blink
	lcd_clear();	// Clear screen
	lcd_write(0x06); // Set entry Mode
}
