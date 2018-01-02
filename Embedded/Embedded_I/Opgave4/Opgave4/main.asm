; Assembler_opgave_4.asm
;
; Created: 02-01-2018 12:50:58
; Author : DAE

.include "m168def.inc"

	.def	LED=r16			; Register r16, benævnes “LED”
	.def	RETNING=r18		; og register r18, benævnes “RETNING” 
							; i dette program.

	.org	0x0000			; Startvektoren i en ATMEGA168 er adresse 
							; 0x0000. Første instruktion placeres på                
							; denne adresse.
	
	rjmp	main			; Hop til memory adresse 0x0034 

	.org	0x0034			; Selve programmet starter i adresse 0x0000
							; Første programinstruktion placeres på denne
							; adresse.
	
main:	ser	RETNING			; Sæt alle bit i register r18 til 1
							; r18 = ”11111111”

		out	DDRB, RETNING	; Kopier data fra r18 til retningsregisteret i
							; PORTB.  DDRB indeholder
							; nu værdien ”11111111” 
		ser	LED
loop:	out	PORTB, LED		; Kopier data fra r16 til PORTB
		com	LED				; Inverter alle bit i r16
		rjmp loop			; Hop tilbage til labelen “loop”
							; Uendelig loop.