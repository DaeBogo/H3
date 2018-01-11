/*****************************************************
Project 	:Opgave01
Version 	:1.0
Date    	: 29.04. 2011
Author 	: John Sølvkjær
Chip type      : ATmega328p
Program type   : Application
AVR Core Clock frequency: 12,000000 MHz
*****************************************************/
#define True 1
#define False 0

#define F_CPU 12000000UL  // 12 MHz krystal på boarded !!

#include <avr/io.h> 	// avr header file for IO ports
#include <util/delay.h>	// functions for delay loop

int main(void)
{
	DDRB  = 0xFF;		// Alle bit i Port B sættes som udgang
	PORTB = 0xFF;		// Sæt “1” på alle bit I Port B
	int delay = 200;
	
	
	while(True)
	{
		
		_delay_ms(delay/2);		
		PORTB = ~PORTB;  	// Inverter alle 8 bit I Port B
		_delay_ms(delay/2);
	}
}
