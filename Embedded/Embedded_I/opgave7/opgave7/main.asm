
;********************** LED_on_key **********************************************
;	Dette program scanner den f�rste tast,(bit 1 p� PORTD).
;	Hvis tasten er trykket ned, t�nder LED p� PORTB,4.
;	Er tasten ikke trykket ned, slukker LED p� PORTB,4.
;	Er programmeret til ATmega168.
; 	Optimeret til Atmel Studio 7.xx.
;	Softwareversion 2.0.
;	Programmeret af LTPE.
;	M� kopieres og anvendes, hvis kildeangivelse medtages.
;************************************************************************************


 
.include "m168def.inc"

	.def	LED=r16		; reg 16 kaldes "LED".
	.def	KEY=r17		; reg 17 kaldes "KEY".
	.org	0x0000		; "rjmp START" placeres p� adresse
						; 0000h (reset-adressen).
	rjmp	START		; spring til labellen "START".
	.org	0x0034		; programmet placeres fra adresse
						; 0034h.
START:	
	ser		LED			; "LED" f�r v�rdien 11111111 b.
	clr		KEY			; "KEY" f�r v�rdien 00000000 b.
	out		DDRD,KEY	; PORTD bliver til input.
	out		DDRB,LED	; PORTB bliver til output.

SCAN:	
	sbis	PIND, 1		; Hvis bit4=1 spring over
						; linien "rjmp LEDOFF".
	rjmp	LEDOFF		; spring til labellen "LEDOFF".
	sbi		PORTB, 4	; bit nummer "4" i PORTB 
						; s�ttes til 1.
	rjmp	SCAN		; spring til labellen "scan".

LEDOFF:	
	cbi		PORTB, 4	; bit nummer "4" i PORTB 
						; nulstilles.
	rjmp	SCAN		; spring til labellen "scan".
	

;	Simuler programmet i Atmel Studio.
;
;	Tilret programmet, s� du t�nder en anden LED, v.h.a. en anden taste.
;	Hvad har du �ndret?
;
;	sbis	PIND0,1	
;	instead of chekking all of PIND, it only checks PIND0


