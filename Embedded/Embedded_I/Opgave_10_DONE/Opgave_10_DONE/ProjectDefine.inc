

	#define ATMEGA168
	#undef ATMEGA328
	#undef ATMEGA2560
				
	#if defined(ATMEGA168)
		.include "m168def.inc"
		
		.def KEY = r16
		.def LED = r17	
		.def count = r18
	
	#endif

	#if defined(ATMEGA328)
		.include "m328def.inc"

	#endif

	#if defined(ATMEGA2560)	
		.include "m2560def.inc"

	#endif
