
_interrupt:

;isr.c,10 :: 		void interrupt () {
;isr.c,14 :: 		if (TMR2IF_bit == 1) {
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt0
;isr.c,15 :: 		if (++count == 100) {
	INFSNZ      interrupt_count_L0+0, 1 
	INCF        interrupt_count_L0+1, 1 
	MOVLW       0
	XORWF       interrupt_count_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt10
	MOVLW       100
	XORWF       interrupt_count_L0+0, 0 
L__interrupt10:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;isr.c,16 :: 		count = 0;
	CLRF        interrupt_count_L0+0 
	CLRF        interrupt_count_L0+1 
;isr.c,17 :: 		if(sec > 0) { sec--; }
	MOVF        _sec+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt2
	DECF        _sec+0, 1 
	GOTO        L_interrupt3
L_interrupt2:
;isr.c,18 :: 		else if(sec == 0 && min > 0) {
	MOVF        _sec+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt6
	MOVF        _min+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt6
L__interrupt7:
;isr.c,19 :: 		min--;
	DECF        _min+0, 1 
;isr.c,20 :: 		sec = 59;
	MOVLW       59
	MOVWF       _sec+0 
;isr.c,21 :: 		}
L_interrupt6:
L_interrupt3:
;isr.c,22 :: 		}
L_interrupt1:
;isr.c,23 :: 		TMR2IF_bit = 0;    //reset the interrupt flag
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
;isr.c,24 :: 		}
L_interrupt0:
;isr.c,25 :: 		}
L_end_interrupt:
L__interrupt9:
	RETFIE      1
; end of _interrupt
