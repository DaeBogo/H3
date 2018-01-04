;
; Opgave_6.asm
;
; Created: 03/01/2018 10:11:00
; Author : Henrik Eriksen
;


; Replace with your application code
;******************** Delay med 2 sl�jfer og 16 bit register ******************************
;	Er programmeret til ATmega168.
; 	Forsinkelsen 
;	Optimeret til Atmel Studio 7.xx
; 	Softwareversion 1.0.
;	Programmeret af LTPE.
;	M� kopieres og anvendes, hvis kildeangivelse medtages.
;*******************************************************************************************

.include "m168def.inc"


	.def	LED=r16		;	s�tter LED til at bruge r16 register
	.def	count=r17	;	s�tter COUNT til at bruge r17 register

	.org	0x0000		;	start vectoren bliver sat til 0x0000
	
	rjmp	main		;	hopper til MAIN
	.org	0x0034		;	start vectoren bliver sat til 0x0034
	
main:	
	ser	LED				;	S�tter alle bits i register r16 til 1
	out	DDRB,LED		;	Kopier data fra r16 til retningsregisteret i
						;	PORTB.  DDRB indeholder nu samme data som r16 (LED)

	com	LED				;	Inverter alle bit i r16 (LED)
	ldi	r18, 0x02		;	r18 bliver sat til 0x02
	out	SPH, r18		;	SPH (0x3E) f�r v�rdien fra r18
	ldi	r18, 0xFF		;	s�tter R18 registeret til 0xFF
	out	SPL, r18		;	SPL (0x3D) f�r v�rdien fra r18

loop:	
	out	PORTB,LED		;	s�tter PORTB med v�rdierne fra LED (r16)
	rcall	delay		;	kalder den funtion eller "subroutine" der hedder delay.
	com	LED				;	Inverter alle bit i r16 (LED)
	rjmp	loop		;	hopper tilbage til loop flaget.

;********** Subrutinen Delay *************** 
delay:
	ldi	count,0x02		;	loader count (r17) med v�rdierne 0x02
loop1:	
	ldi	ZH,0xFF			;	loader ZH med v�rdierne 0xFF
	ldi	ZL,0xFF			;	loader LZ med v�rdierne 0xFF
loop2:	
	sbiw	ZL,1		;	tager v�rdien i LZ og minuser 1 (LZ = LZ - 1) // Subtract Immediate from Word
	brne	loop2		;	branch if LZ andet end 0
	dec	count			;	decrement count, (count = count --)
	brne	loop1		;	branch if count andet end 0
	ret
;************************************************

;Afpr�v programmet, og dokumenter alle kodelinjerne.
;Hvordan �ndres subrutinens forsinkelse til den dobbelte tid:
;	ldi count,0x02
;	skal �ndres til
;	ldi count,0x04
;_____________________________________________________________________
; 
;___________________________________________________________

