

 .MACRO CLEARSIGNAL
 	cbi		PORTD, 6
	cbi		PORTD, 7
 .ENDMACRO


 /* North / South */
 .MACRO	RedNS
 	cbi		PORTB, 1
	cbi		PORTB, 2

	sbi		PORTB, 0
 .ENDMACRO

 .MACRO	YellowNS
	cbi		PORTB, 2
	cbi		PORTD, 6

	sbi		PORTB, 1
 .ENDMACRO

 .MACRO GreenNS
	cbi		PORTB, 0
	cbi		PORTB, 1

	sbi		PORTB, 2	
 .ENDMACRO

 .MACRO	ArrowNS
	sbi		PORTD, 6
 .ENDMACRO

 /* West / East */

 .MACRO	RedWE
	cbi		PORTB, 4
	cbi		PORTB, 5

	sbi		PORTB, 3
 .ENDMACRO

 .MACRO YellowWE
	cbi		PORTB, 5
	cbi		PORTD, 7

	sbi		PORTB, 4	
.ENDMACRO

.MACRO GreenWE
	cbi		PORTB, 3
	cbi		PORTB, 4

	sbi		PORTB, 5	
.ENDMACRO

.MACRO	ArrowWE
	sbi		PORTD, 7
.ENDMACRO