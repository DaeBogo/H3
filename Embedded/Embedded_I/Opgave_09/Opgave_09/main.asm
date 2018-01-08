;
; Opgave_09.asm
;
; Created: 05/01/2018 08:42:23
; Author : Birdface
;


; Replace with your application code
.include "m168def.inc"
	.org	RWW_START_ADDR

	.def	count=r17
	.def	key=r18
	
	.def	LED=r16

	rjmp	main

	.org	INT_VECTORS_SIZE

main:
	clr		key			;Set all bits to 0
	ldi		LED, 0xFF	;put value 0xFF in register 16    (This is to change all bits from 0 to 1. so they are all output
	out		DDRB, LED	;Set all bit in Port B to Output
	out		DDRC, key	;set all bits to 0 in port d to ensure input
	rcall	red
	; Instead of the loop, have the button trigger here

	mainloop:
		sbic	PINC, 0
		rcall	yellow
		sbis	PINC, 0
		rcall	green
		rjmp	mainloop


	;Bit 1 : Red
	;Bit 2 : Yellow
	;Bit 3 : Green

	
	;********** Subrutine Red *************** 
	red:
	cbi		PORTB, 2
	cbi		PORTB, 3

	sbi		PORTB, 1
	ret
	;********** Subrutine Yellow *************** 
	yellow:

	cbi		PORTB, 3

	sbi		PORTB, 2
	ret
	;********** Subrutine Green *************** 
	green:
	cbi		PORTB, 1
	cbi		PORTB, 2

	sbi		PORTB, 3
	ret

	