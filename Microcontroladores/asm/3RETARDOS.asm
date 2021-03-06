	PROCESSOR	P16F887
	INCLUDE		<P16F887.INC>

	__CONFIG _CONFIG1, (_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
	__CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)



CT0		EQU		0x20

		ORG		0x00
		BANKSEL	ANSEL
		CLRF	ANSEL
		CLRF	ANSELH
		BANKSEL	TRISA
		MOVLW	0xFF
		MOVWF	TRISA
		CLRF	TRISB
		CLRF	TRISC
		CLRF	TRISD
		CLRF	TRISE
		MOVLW	0xD6
		MOVWF	OPTION_REG
		BANKSEL	PORTA
C_P
		CLRF	PORTB

		BSF		PORTB,RB0
		CALL	R08
		BCF		PORTB,RB0
		
		BANKSEL	TRISA
		MOVLW	0xD7
		MOVWF	OPTION_REG
		BANKSEL	PORTA
		
		BSF		PORTB,RB1
		CALL	R65
		BCF		PORTB,RB1
	
		BANKSEL	TRISA
		MOVLW	0xD6
		MOVWF	OPTION_REG
		BANKSEL	PORTA
	
		
		BSF		PORTB,RB2
		CALL	R1S
		BCF		PORTB,RB2
		GOTO	C_P


R08
		CLRF	TMR0
E64I	BTFSS	TMR0,6
		GOTO	E64I
		RETURN

R65
		CLRF	TMR0
EDT0	BTFSS	INTCON,T0IF
		GOTO	EDT0
		BCF	INTCON,T0IF
		RETURN

R1S
		MOVLW	0x7A
		MOVWF	CT0	
CIT0	CLRF	TMR0
E64		BTFSS	TMR0,6
		GOTO	E64
		DECFSZ	CT0,F
		GOTO	CIT0
	
R.5S
		MOVLW	0x41
		MOVWF	CT0	
CIT0S	CLRF	TMR0
E64S	BTFSS	TMR0,6
		GOTO	E64S
		DECFSZ	CT0,F
		GOTO	CIT0S
		END