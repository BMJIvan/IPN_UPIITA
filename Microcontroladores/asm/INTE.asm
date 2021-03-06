	PROCESSOR	P16F887
	INCLUDE		<P16F887.INC>

	__CONFIG _CONFIG1, (_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
	__CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)

CONT	EQU			0x20

		ORG			0x00
		GOTO		INICIO
		ORG			0x04
		GOTO		S_AI

INICIO	ORG			0x05
		BANKSEL 	ANSELH
		CLRF		ANSEL
		CLRF		ANSELH
		BANKSEL		TRISA
		MOVLW		0x03
		MOVWF		TRISA
		CLRF		TRISB
		CLRF		TRISC
		CLRF		TRISD
		CLRF		TRISE		

		MOVLW		0xD7
		MOVWF		OPTION_REG
		BANKSEL 	PORTA
		MOVLW		0x10--D'16'
		MOVWF		CONT
		MOVLW		B'10100000'
		MOVWF		INTCON
		MOVLW		D'12'
		MOVWF		TMR0	
C_P
		BTFSS		PORTA,RA0
		GOTO		RB0_0
		BSF			PORTB,RB0
		GOTO		ERA1
RB0_0	BCF			PORTB,RB0

ERA1
		BTFSS		PORTA,RA1
		GOTO		RB1_0
		BSF			PORTB,RB1
		GOTO		C_P
RB1_0	BCF			PORTB,RB1
		GOTO		C_P

S_AI	MOVLW		B'10100000'
		MOVWF		INTCON
		MOVLW		D'12'
		MOVWF		TMR0
		DECFSZ		CONT,F	
		GOTO		FSAI
		MOVLW		D'16'
		MOVWF		CONT
		BTFSS		PORTB,7
		GOTO		SRB7
		BCF			PORTB,7
		GOTO		FSAI
SRB7	BSF			PORTB,7
FSAI	RETFIE
		END