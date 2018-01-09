;
; opgave10.asm
;
; Created: 08/01/2018 10:24:50
; Author : Henrik Eriksen
;

/*
Opgave 10: Udvikling af software

I skal nu selv udvikle software, hvor du udnytter de strukturer og programmeringsteknikker, du har arbejdet med.
Opgaven skal udarbejdes i grupper, p� 2-3 personer.
N�r opgaven er udf�rt, freml�gger alle grupper for klassen. Du skal regne med at kunne bruge 15 minutter p� freml�ggelsen. 
P� denne m�de ses der forskellige m�der at arbejde p�. 
Samtidigt giver det �velse i at strukturere, og freml�gge. 
Hvis et program skal kunne l�ses og forst�s af andre, kr�ver det typisk mere struktur, end hvis man selv skal l�se det.
Bem�rk at jeres program skal virke i praksis.

Herunder er der vist, hvilke krav, der er til softwaren:	
�	Skal v�re programmeret i assembler.
�	Programmet skal simulere et trafiklys.  (R�d/Gul/Gr�n)
�	Der skal monteres 3 lysdioder.
�	Der skal anvendes funktioner og makroer.
�	Programmet skal struktureres, s�ledes at det med �ndring af �n define vil virke p� andet HW end ATMega168. 

Ekstraopgave 1
�	Lyset opbygges med 2 retninger. (6 dioder)

Ekstra opgave 2
�	Lyset forsynes med h�jresvings pil. (1 gr�n diode)


Efter endt freml�ggelse afleveres software og dokumentation til underviseren, der bed�mmer materialet. Der l�gges v�gt p� l�sbarhed og struktur.
*/

	.include "ProjectDefine.inc"
	//.include "m168def.inc"	.org		RWW_START_ADDR	rjmp		main
	.org		INT_VECTORS_SIZE
main: 
  clr    key		;Set all bits to 0
  ldi    LED, 0xFF	;sets r16 to 111111111 b
  out    DDRB, LED  ;Set all bit in Port B to Output
  out    DDRC, key  ;set all bits to 0 in port d to ensure input
					; this is not nessecary, but its good practice 
  rcall  red
  		
  mainloop: 
    sbic  PINC, 0 
    rcall  yellow 
    sbis  PINC, 0 
    rcall  green 
    rjmp  mainloop
  ;Bit 1 : Red 
  ;Bit 2 : Yellow 
  ;Bit 3 : Green

  ;********** Subrutine Red ***************  
 red:
	cbi    PORTB, 2
	cbi    PORTB, 3
	sbi    PORTB, 1
	ret
  ;********** Subrutine Yellow ***************  
 yellow:
	cbi    PORTB, 3
	sbi    PORTB, 2
	ret
  ;********** Subrutine Green ***************  
 green:
	cbi    PORTB, 1
	cbi    PORTB, 2
	sbi    PORTB, 3
	ret


  ;********** Subrutinen Delay *************** 
delay:
	ldi		count,0x02	
loop1:	
	ldi		ZH,0xFF	
	ldi		ZL,0xFF	
loop2:	
	sbiw	ZL,1	
	brne	loop2	
	dec		count	
	brne	loop1	
	ret
;************************************************
