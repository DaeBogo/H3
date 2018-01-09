;
; Test_01.asm
;
; Created: 04/01/2018 09:19:57
; Author : Birdface
;

.include "m168def.inc"
.include "Signals.asm"

	.org	RWW_START_ADDR

	.def	count=r17
	.def	count2=r18
	
	.def	LED=r16

	rjmp	main

	.org	INT_VECTORS_SIZE

main:
	ldi		LED, 0xFF	;put value 0x00 in register 16    (This is the default value tho.)
	out		DDRB, LED	;Set all bit in Port B to Output
	out		DDRD, LED	;Set all bit in Port D to Output
	;sbi		DDRB, 0		;Set Bit 0 in Port B to Output
	;sbi		PORTB, 0	;Set Bit 0 in port B to high (send 5 volt of the port)   0 is default. set operation sets bit to 1... reset operation sets it to 0
	
	startloop:
		sbic	PINC, 0
		rjmp	loop

		rjmp	startloop


	loop:


	RedNS

	GreenWE
	rcall	delay

	YellowWE
	rcall	delay

	RedWE
	rcall	arrowWE 
	rcall	arrowNS
	rcall	delay

	CLEARSIGNAL

	YellowNS
	rcall	delay

	
	GreenNS	
	RedWE
	rcall	delay

	YellowNS
	rcall	delay

	RedNS
	YellowWE
	rcall	delay

	rjmp	loop

	; North South
	;Bit 0 : Red
	;Bit 1 : Yellow
	;Bit 2 : Green
	;Bit 6 : Arrow

	; West East
	;Bit 3 : Red
	;Bit 4 : Yellow
	;Bit 5 : Green
	;Bit 7 : Arrow
	

	;********** Subrutine ArrowNS ***************
	arrowNS:
	sbi		PORTD, 6
	ret

		;********** Subrutine ArrowWE ***************
	arrowWE:
	sbi		PORTD, 7
	ret


	;********** Subrutine Delay *************** 
delay:
	ldi		count,0x70		;	loader count (r17) med værdierne 0x02
loop1:	
	ldi		ZH,0xFF			;	loader ZH med værdierne 0xFF
	ldi		ZL,0xFF			;	loader ZL med værdierne 0xFF
loop2:	
	sbiw	ZL,1		;	tager værdien i ZL og minuser 1 (ZL = ZL - 1) // Subtract Immediate from Word
	brne	loop2		;	branch if ZL andet end 0
	dec		count		;	decrement count, (count = count --)
	brne	loop1		;	branch if count andet end 0
	ret