/*****************************************************
Project 	:Opgave01
Version 	:1.0
Date    	: 29.04. 2011
Author 	: John S�lvkj�r
Chip type      : ATmega328p
Program type   : Application
AVR Core Clock frequency: 12,000000 MHz
*****************************************************/
#define True 1
#define False 0

#define F_CPU 12000000UL  // 12 MHz krystal p� boarded !!

#include <avr/io.h> 	// avr header file for IO ports
#include <util/delay.h>	// functions for delay loop

int main(void)
{
	DDRB  = 0xFF;		// Alle bit i Port B s�ttes som udgang
	PORTB = 0xFF;		// S�t �1� p� alle bit I Port B
	int delay = 200;
	
	
	while(True)
	{
		
		_delay_ms(delay/2);		
		PORTB = ~PORTB;  	// Inverter alle 8 bit I Port B
		_delay_ms(delay/2);
	}
}
