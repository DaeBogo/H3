;
; opgave10.asm
;
; Created: 08/01/2018 10:24:50
; Author : Henrik Eriksen
;

/*
Opgave 10: Udvikling af software

I skal nu selv udvikle software, hvor du udnytter de strukturer og programmeringsteknikker, du har arbejdet med.
Opgaven skal udarbejdes i grupper, på 2-3 personer.
Når opgaven er udført, fremlægger alle grupper for klassen. Du skal regne med at kunne bruge 15 minutter på fremlæggelsen. 
På denne måde ses der forskellige måder at arbejde på. 
Samtidigt giver det øvelse i at strukturere, og fremlægge. 
Hvis et program skal kunne læses og forstås af andre, kræver det typisk mere struktur, end hvis man selv skal læse det.
Bemærk at jeres program skal virke i praksis.

Herunder er der vist, hvilke krav, der er til softwaren:	
•	Skal være programmeret i assembler.
•	Programmet skal simulere et trafiklys.  (Rød/Gul/Grøn)
•	Der skal monteres 3 lysdioder.
•	Der skal anvendes funktioner og makroer.
•	Programmet skal struktureres, således at det med ændring af én define vil virke på andet HW end ATMega168. 

Ekstraopgave 1
•	Lyset opbygges med 2 retninger. (6 dioder)

Ekstra opgave 2
•	Lyset forsynes med højresvings pil. (1 grøn diode)


Efter endt fremlæggelse afleveres software og dokumentation til underviseren, der bedømmer materialet. Der lægges vægt på læsbarhed og struktur.
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
