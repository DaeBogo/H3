/*
 * ProjectDefine.inc
 *
 *  Created: 08/01/2018 12:31:46
 *   Author: Henrik Eriksen
 */ 
	#define ATMEGA168
	#undef ATMEGA328P
	#undef ATMEGA2560
				
	#if defined(ATMEGA168)
		.include "m168def.inc"
		
	;	.def KEY = r16
	;	.def LED = r17	
	
	#endif

	#if defined(ATMEGA328P)
		#include "m328def.inc"

	#endif

	#if defined(ATMEGA2560)	
		#include "m2560def.inc"

	#endif
