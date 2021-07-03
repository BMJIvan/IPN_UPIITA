
	#include		<htc.h>;
#include		<stdio.h>;

__CONFIG (FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);
__CONFIG (BOR4V_BOR40V & WRT_OFF);

void pause (unsigned short msvalue);
void msecbase (void);
void mubase(void);

void lcd_init (void);
void lcd_goto (unsigned char pos);
void lcd_clear (void);
void lcd_write (unsigned char c);
void lcd_puts (const char * s);
void lcd_putch (char c);

void init_micro(void);
void i2c_init();
void i2c_waitForIdle();
void i2c_start();
void i2c_repStart();
void i2c_stop();
int i2c_read( unsigned char ack );
unsigned char i2c_write( unsigned char i2cWriteData );
void I2C_EEOUT(unsigned char address, unsigned char data);
unsigned char I2C_EEIN(unsigned char address);

#define	LCD_RS RD6
#define	LCD_EN RD7
#define LCD_DATA	PORTB
#define	LCD_STROBE()((LCD_EN=1),(LCD_EN=0))

#define number 0x30

unsigned char b0;
float num;
float min;
char carac[8];

void main (void)
{
	OSCCON=0x70;
	TRISA=0x00;
	TRISB=0x00;
	TRISC=0x00;
	TRISD=0x00;
	TRISE=0x03;
	ADCON1=0x00;
	PORTA=0x00;	
	init_micro();	
	i2c_init();    
	//lcd_init();
	//lcd_clear();

	
	int cnt=0;		
 	unsigned char AH=0;
	unsigned char AL=0;
	 //while(cnt<=10)   
  	//{        
	 // PORTA=cnt;         		
  	//I2C_EEOUT(cnt,10-cnt);   	// Store 9 at address 1, 8 at address 2, ...
  	//cnt=cnt+1;				
 	 //pause(255);				
  	//}	

	 cnt=0;
	PORTA=0x01;
	 while(cnt<=255)
  	{
		ADCON0=0xD5;
		pause(1);
		GO_DONE=1;
		while(GO_DONE);
		AH=ADRESH;
		AL=ADRESL;
		pause(1);
 		I2C_EEOUT(cnt,cnt);
		cnt=cnt+1;
 	//	I2C_EEOUT(cnt,cnt);	
 	//	cnt=cnt+1;	
	//	pause(1);
		
  	}
	
	while(1){
	cnt=0;
	while(cnt<=255)
	{
	PORTA = I2C_EEIN(cnt);
	cnt=cnt+1;
	pause(100);
	}
	}

	/*while(1)
	{		
		ADCON0=0xD5;
		pause(1);
		GO_DONE=1;
		while(GO_DONE);
		//PORTB=ADRESH;
		CCPR1L=ADRESH;
		CCP1CON=0x0C|(ADRESL>>2);
		pause(1);	
		min=(ADRESH<<2)|(ADRESL>>6);
		num=(min*5)/1023;
		num=min*0.004887585;
		
		sprintf(carac, "%4.2f",num);
		lcd_goto(0x00);
		lcd_puts("V1:");
		lcd_puts(carac);
		num=min*0.097751710;
		sprintf(carac,"%5.1f",num);
		lcd_goto(0X08);
		lcd_puts("C1:");
		lcd_puts(carac);
		pause(100);

		ADCON0=0xD9;
		GO_DONE=1;
		while(GO_DONE);
		pause(1000);
		//PORTB=ADRESH;
		CCPR2L=ADRESH;
		CCP2CON=0x0C|(ADRESL>>2);
		pause(1);	
		min=(ADRESH<<2)|(ADRESL>>6);
		num=(min*5)/1023;
		num=min*0.004887585;
		
		sprintf(carac, "%4.2f",num);
		lcd_goto(0x40);
		lcd_puts("V2:");
		lcd_puts(carac);
		num=min*0.097751710;
		sprintf(carac,"%5.1f",num);
		lcd_goto(0X48);
		lcd_puts("C2:");
		lcd_puts(carac);
		pause(100);
	}*/

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

void mubase(void)
{
	OPTION_REG = 0b11000000;	
	TMR0=0x01;			
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
	LCD_RS = 1;	
	while(*s)
		lcd_write(*s++);
	
}

void lcd_putch(char c)
{
	LCD_RS = 1;	
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
	ANSEL =0x60;
	init_value = 0x03;
	TRISA=0;
	TRISC=0;
	LCD_RS = 0;
	LCD_EN = 0;
//	LCD_RW = 0;
	
	pause (15);				
	LCD_DATA= init_value;
	LCD_STROBE();
	pause(10);
	LCD_STROBE();
	pause(10);
	LCD_STROBE();
	pause(10);
	LCD_DATA = 2;	// Four bit mode
	LCD_STROBE();
	
	lcd_write(0x28); 
//	lcd_write(0xC); 
	lcd_write(0x0F); 
	lcd_clear();	
	lcd_write(0x06); 
}

void init_micro(void)
{
	ANSEL = 0x60; 		
	ANSELH = 0;
	CM1CON0 = 0;	
	CM2CON0 = 0;
	INTCON=0;	
}

void i2c_init()
{
 TRISC3=1; 
 TRISC4=1;
 SSPCON = 0x38;   
 SSPCON2 = 0x00;
 SSPADD = 0x13;     
CKE=1;     	
SMP=1;     	
 SSPIF=0;      	
 BCLIF=0;      	
}

void i2c_waitForIdle()
{
 while (( SSPCON2 & 0x1F )) {}; 
}

void i2c_start()
{
 i2c_waitForIdle();
 SEN=1;
}

void i2c_repStart()
{
 i2c_waitForIdle();
 RSEN=1;
}

void i2c_stop()
{
 i2c_waitForIdle();
 PEN=1;
}

int i2c_read( unsigned char ack )
{
 unsigned char i2cReadData;
 i2c_waitForIdle();
 RCEN=1;
 i2c_waitForIdle();
 i2cReadData = SSPBUF;
 i2c_waitForIdle();
 if ( ack )
  	{
  	ACKDT=0;
  	}
 	else
  	{
  		ACKDT=1;
  	}
  ACKEN=1;              
 return( i2cReadData );
}

unsigned char i2c_write( unsigned char i2cWriteData )
{
 i2c_waitForIdle();
 SSPBUF = i2cWriteData;
 return ( ! ACKSTAT  ); 
}

void I2C_EEOUT(unsigned char address, unsigned char data)
 {
   i2c_start();
   i2c_write(0xA0);
   i2c_write(address);
   i2c_write(data);
   i2c_stop();
   pause(12);
}

unsigned char I2C_EEIN(unsigned char address)
{
   unsigned char data;

   i2c_start();
   i2c_write(0xa0);
   i2c_write(address);
   i2c_repStart();
   i2c_write(0xa1);
   data=i2c_read(0);
   i2c_stop();
   return(data);
}