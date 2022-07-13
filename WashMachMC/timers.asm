
_init_timer2:

;timers.c,1 :: 		void init_timer2(void) {
;timers.c,3 :: 		T2CKPS0_bit = 1;
	BSF         T2CKPS0_bit+0, BitPos(T2CKPS0_bit+0) 
;timers.c,4 :: 		T2CKPS1_bit = 1;
	BSF         T2CKPS1_bit+0, BitPos(T2CKPS1_bit+0) 
;timers.c,7 :: 		PR2 = 250;
	MOVLW       250
	MOVWF       PR2+0 
;timers.c,10 :: 		TMR2IE_bit = 1;
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
;timers.c,13 :: 		TMR2ON_bit = 0;
	BCF         TMR2ON_bit+0, BitPos(TMR2ON_bit+0) 
;timers.c,14 :: 		}
L_end_init_timer2:
	RETURN      0
; end of _init_timer2
