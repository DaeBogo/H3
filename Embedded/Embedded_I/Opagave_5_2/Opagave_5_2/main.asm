;
; Opagave_5_2.asm
;
; Created: 03/01/2018 10:03:04
; Author : Henrik Eriksen
;
;
;
; Replace with your application code
; Tilpas den viste kode, s�ledes at programmet udnytter startvektoren i adresse $0000, 
; og programkoden starter i adresse 0x0034.
;
;
;******************** Delay med 2 sl�jfer ***********************************************
;	Dette delay med 2 sl�jfer giver et delay p�:
;	((4*(COUNT1-1))+8)*COUNT2, eller (4*(COUNT1+4))*COUNT2.
; 	Resultatet er i antal "cycles". �n cycle=�n periode af
;	clock-frekvensen. 
;	Hurtigere clock-frekvens = Kortere delay.
; 	Rutinen kan inds�ttes i et program, som en sub-rutine.
; 	Maksimalt delay=261,12 ms, med en clock-frekvens p� 1 MHz.
;	Er programmeret til ATmega168.
;	Optimeret til Atmel Studio 7.xx
; 	Softwareversion 1.0.
;	Programmeret af LTPE.
;	M� kopieres og anvendes, hvis kildeangivelse medtages.
;*******************************************************************************************

.include "m168def.inc"
.org	0x0000

rjmp	main

.org	0x0034

main:
	.def	COUNT1=r16	; reg 16 kaldes "COUNT1".
	.def	COUNT2=r17	; reg 17 kaldes "COUNT2".

	ldi	COUNT2,0x10	; reg 17 f�r v�rdien 10h.
loop2:	ldi	COUNT1,0x10	; reg 16 f�r v�rdien 10h.

loop1:	dec	COUNT1		; Der tr�kkes "1" fra "COUNT1".
	breq	end1		; Spring til "end1", hvis Z=1.
	rjmp	loop1		; Spring til labellen "loop1".

end1:	dec 	COUNT2		; Der tr�kkes "1" fra "COUNT2".
	breq	end2		; Spring til "end2", hvis Z=1.
	rjmp 	loop2		; Spring til labellen "loop2".

end2:	nop			; "No operation" (bruges her som 
	rjmp	end2		; fyld).

