#include		<htc.h>;
#include		<stdlib.h>;
#include		<stdio.h>;

__CONFIG (FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);
__CONFIG (BOR4V_BOR40V & WRT_OFF);

void pause (unsigned short msvalue);
void msecbase (void);
void delay(int p);
void init_TMR1();
void lcd_init (void);
void lcd_goto (unsigned char pos);
void lcd_clear (void);
void lcd_write (unsigned char c);
void lcd_puts (const char * s);
void lcd_putch (char c);

#define	LCD_RS RD6
#define	LCD_EN RD7
#define LCD_DATA	PORTB
#define	LCD_STROBE()((LCD_EN=1),(LCD_EN=0))

#define number 0x30

unsigned char b0;
    //unsigned int conteo=0;
	float conteo=0;              
    float distancia=0;
	float tiempo=0;
char carac[8];

//trig D1 0x02
//echo D0 0x01
//unsigned char VPA=0x00;
void main (void)
{
	ANSEL=0x00;
	ANSELH=0x00;
	
	TRISA=0x00;
	TRISB=0x00;
	TRISC=0x00;
	TRISD=0x01;
	TRISE=0x00;
	ADCON1=0x00;
	delay(10);
	lcd_init();
	lcd_clear();
    //init_TMR1();                
//setup_timer_1(T1_INTERNAL|T1_DIV_BY_1);

while(1)
{

RD1=1;                   
delay(10);                       
RD1=0;
//	TMR1H=0;
//	TMR1L=0;
while(!RD0){}                     
//TMR1ON=1;               
while(RD0){
tiempo=tiempo+1;}                     
//TMR1ON=0;
//TMR1IF=0;

//	conteo=TMR1H;
//	conteoLSB=TMR1L;

	//conteo=conteo+conteoLSB;
conteo=tiempo;
				distancia=conteo*5*1.3;
				sprintf(carac,"Distancia:");
				lcd_goto(0x00);             	
				lcd_puts(carac);
				sprintf(carac,"%4f",distancia);
				lcd_goto(0x0A);
				lcd_puts(carac);
				sprintf(carac,"cm");
				lcd_goto(0x0E);             	
				lcd_puts(carac);
				pause(200);	
				sprintf(carac,"%4.0f",tiempo);
				lcd_goto(0x40);             	
				lcd_puts(carac);
					
				//sprintf(carac,"%u",conteoLSB);
				//lcd_goto(0x47);             	
				//lcd_puts(carac);
				//sprintf(carac,"%u",conteo);
				//lcd_goto(0x08);
				//lcd_puts(carac);
				pause(200);
				//conteo=0;
				tiempo=0;		 	       
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

void delay(int p)
{
}
void msecbase(void)
{
	OPTION_REG = 0b11000001;	
	TMR0=0x06;			
	while(!T0IF);			
	T0IF=0;			
}

void init_TMR1(void)
{	
	TMR1IE=0;
	TMR1CS=0;
	T1CKPS1=0;
	T1CKPS0=0;	
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

	ANSEL =0x00;			// Disable analog pins on PORTA
	
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
//	lcd_write(0xC); // Display On, Cursor Off, Blink Off
	lcd_write(0x0F); // Display On, Cursor On, Cursor Blink
	lcd_clear();	// Clear screen
	lcd_write(0x06); // Set entry Mode
}
