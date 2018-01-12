	
	/*****************************************************
	Project :Opgave02
	Version :1.0
	Date    : xx.xx. 2011
	Author  : John S�lvkj�r
	Chip type	   : ATmega168
	Program type : Application
	AVR Core Clock frequency: 12,000000 MHz
	*****************************************************/

	#define F_CPU 12000000UL  	// 16 MHz

	#include <avr/io.h> 	// avr header file for IO ports
	#include <util/delay.h>	// functions for delay loops


/*
digitalpin 


*/


	int main(void)
	{
		DDRC  = 0x00; 	// Alle bit i Port C s�ttes som input
		DDRB  = 0xFF;	// Alle bit i Port B s�ttes som output
		PORTB = 0x00;	// Alle bit p� Port B s�ttes til �0�

		while(1)	// Uendelig l�kke
		{
			if (PINC & (0x01)) // Hvis Port C bit 0 er forbundet til +5v s�..
			{
				PORTB |=  (1<<PB4);    	// PORTB.5 = high. Bit 4 = �1�
				PORTB &= ~(1<<PB4);    	// PORTB.5 = NOT PORTB.4. Bit 4 inverteres.		
			}
			else	      // Ellers, hvis Port C bit 0 er forbundet til GND s�..
			{
				PORTB &= ~(1<<PB4);    	// PORTB.5 = NOT PORTB.4. Bit 4 inverteres.	
				//PORTB |=  (1<<PB5);    	// PORTB.5 = high. Bit 5 = �1�
				//PORTB &= ~(1<<PB5);    	// PORTB.5 = NOT PORTB.5. Bit 5 inverteres.
			}
			
			if (PINC & (0x02)) // Hvis Port C bit 0 er forbundet til +5v s�..
			{
				PORTB |=  (1<<PB3);    	// PORTB.5 = high. Bit 5 = �1�
				PORTB &= ~(1<<PB3);    	// PORTB.5 = NOT PORTB.5. Bit 5 inverteres.
			}
			else	      // Ellers, hvis Port C bit 0 er forbundet til GND s�..
			{
				PORTB &= ~(1<<PB3);    	// PORTB.5 = NOT PORTB.5. Bit 5 inverteres.
				//PORTB |=  (1<<PB5);    	// PORTB.5 = high. Bit 5 = �1�
				//PORTB &= ~(1<<PB5);    	// PORTB.5 = NOT PORTB.5. Bit 5 inverteres.
			}			
		}
		return 1;
	}
