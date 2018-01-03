;
; Opagev5,1Henrik.asm
;
; Created: 03/01/2018 09:59:33
; Author : Henrik Eriksen
;


; Replace with your application code

;******************** Delay med 1 sl�jfe *********************************************
;	Dette delay med 1 sl�jfe giver et delay p�:
;	(4*(COUNT1-1))+4, eller 4*COUNT1.
; 	Resultatet er i antal "cycles". �n cycle=�n periode af
;	clock-frekvensen. 
;	Hurtigere clock-frekvens = Kortere delay.
; 	Rutinen kan inds�ttes i et program, som en sub-rutine.
; 	Maksimalt delay=1,02 ms, med en clock-frekvens p� 1 MHz.
;	Er programmeret til ATmega168.
;	Optimeret til Atmel Studio 7.xx
; 	Softwareversion 1.0.
;	Programmeret af LTPE.
;	M� kopieres og anvendes, hvis kildeangivelse medtages.
;****************************************************************************************

.include "m168def.inc"

	.def	COUNT1=r16	; r16 kaldes "COUNT1".

	.org	0000
	rjmp	main

	.org	0x0034
		
main:	ldi	COUNT1,0x10	; reg 16 f�r v�rdien 10h.
loop1:	dec	COUNT1		; Der tr�kkes "1" fra "COUNT1".
	breq	end1		; Spring til "end1", hvis Z=1.
	rjmp	loop1		; Spring til labellen "loop1".
end1:	nop				; "No operation" (bruges her som fyld.
	rjmp	end1		;  Spring til end1. Endel�s loop
