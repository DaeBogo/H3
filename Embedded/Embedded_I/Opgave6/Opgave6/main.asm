; Opgave6.asm
;
; Created: 04-01-2018 11:06:06
; Author : DAE

.include "m168def.inc"

	.def LED=r16	
	.def count=r17	

	.org 0x0000	
	
	rjmp main	
	.org 0x0034	
	
main:	
	ser	LED	
	out	DDRB,LED	
	com	LED	
	ldi	r18, 0x02
	out	SPH, r18	
	ldi	r18, 0xFF	
	out	SPL, r18

loop:	
	out	PORTB5,LED  
	rcall delay	
	com	LED	
	rjmp loop	

;********** Subrutinen Delay *************** 
delay:
	ldi	count,0x14
loop1:	
	ldi	ZH,0xFF	
	ldi	ZL,0xFF	
loop2:	
	sbiw ZL,1	
	brne loop2	
	dec	count	
	brne loop1	
	ret
;************************************************
