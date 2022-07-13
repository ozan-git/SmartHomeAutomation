
_init_digital_keypad:

;digital_keypad.c,8 :: 		void init_digital_keypad(void) { TRISB = TRISB | 0b00111111; }
	MOVLW       63
	IORWF       TRISB+0, 1 
L_end_init_digital_keypad:
	RETURN      0
; end of _init_digital_keypad

_keypad_and_input:

;digital_keypad.c,11 :: 		unsigned char keypad_and_input() { return (PORTB & 0b00111111); }
	MOVLW       63
	ANDWF       PORTB+0, 0 
	MOVWF       R0 
L_end_keypad_and_input:
	RETURN      0
; end of _keypad_and_input

_not_all_released:

;digital_keypad.c,13 :: 		int not_all_released() {
;digital_keypad.c,14 :: 		if (PORTB != 0b00111111)
	MOVF        PORTB+0, 0 
	XORLW       63
	BTFSC       STATUS+0, 2 
	GOTO        L_not_all_released0
;digital_keypad.c,15 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_not_all_released
L_not_all_released0:
;digital_keypad.c,16 :: 		}
L_end_not_all_released:
	RETURN      0
; end of _not_all_released

_all_released:

;digital_keypad.c,18 :: 		int all_released() {
;digital_keypad.c,19 :: 		if (PORTB == 0b00111111)
	MOVF        PORTB+0, 0 
	XORLW       63
	BTFSS       STATUS+0, 2 
	GOTO        L_all_released1
;digital_keypad.c,20 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	GOTO        L_end_all_released
L_all_released1:
;digital_keypad.c,21 :: 		}
L_end_all_released:
	RETURN      0
; end of _all_released

_not_all_released_and_once:

;digital_keypad.c,23 :: 		void not_all_released_and_once() {
;digital_keypad.c,24 :: 		once = 0;
	CLRF        digital_keypad_once+0 
;digital_keypad.c,25 :: 		longpress = 0;
	CLRF        digital_keypad_longpress+0 
;digital_keypad.c,26 :: 		pre_key = keypad_and_input();
	CALL        _keypad_and_input+0, 0
	MOVF        R0, 0 
	MOVWF       digital_keypad_pre_key+0 
;digital_keypad.c,27 :: 		}
L_end_not_all_released_and_once:
	RETURN      0
; end of _not_all_released_and_once

_read_digital_keypad:

;digital_keypad.c,29 :: 		unsigned char read_digital_keypad(unsigned char mode) {
;digital_keypad.c,30 :: 		if (mode == LEVEL_DETECTION) {
	MOVF        FARG_read_digital_keypad_mode+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_read_digital_keypad2
;digital_keypad.c,31 :: 		return keypad_and_input();
	CALL        _keypad_and_input+0, 0
	GOTO        L_end_read_digital_keypad
;digital_keypad.c,32 :: 		}
L_read_digital_keypad2:
;digital_keypad.c,34 :: 		if (not_all_released() && once) {
	CALL        _not_all_released+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_read_digital_keypad6
	MOVF        digital_keypad_once+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_read_digital_keypad6
L__read_digital_keypad20:
;digital_keypad.c,35 :: 		not_all_released_and_once();
	CALL        _not_all_released_and_once+0, 0
;digital_keypad.c,36 :: 		}
	GOTO        L_read_digital_keypad7
L_read_digital_keypad6:
;digital_keypad.c,37 :: 		else if ((pre_key == keypad_and_input()) && longpress < 20 && !once) {
	CALL        _keypad_and_input+0, 0
	MOVF        digital_keypad_pre_key+0, 0 
	XORWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_read_digital_keypad10
	MOVLW       20
	SUBWF       digital_keypad_longpress+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_read_digital_keypad10
	MOVF        digital_keypad_once+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_read_digital_keypad10
L__read_digital_keypad19:
;digital_keypad.c,38 :: 		longpress++;
	INCF        digital_keypad_longpress+0, 1 
;digital_keypad.c,39 :: 		}
	GOTO        L_read_digital_keypad11
L_read_digital_keypad10:
;digital_keypad.c,40 :: 		else if (longpress == 20) {
	MOVF        digital_keypad_longpress+0, 0 
	XORLW       20
	BTFSS       STATUS+0, 2 
	GOTO        L_read_digital_keypad12
;digital_keypad.c,41 :: 		longpress++;
	INCF        digital_keypad_longpress+0, 1 
;digital_keypad.c,42 :: 		return 0x80 | pre_key;
	MOVLW       128
	IORWF       digital_keypad_pre_key+0, 0 
	MOVWF       R0 
	GOTO        L_end_read_digital_keypad
;digital_keypad.c,44 :: 		}
L_read_digital_keypad12:
;digital_keypad.c,45 :: 		else if(all_released() && !once) {
	CALL        _all_released+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_read_digital_keypad16
	MOVF        digital_keypad_once+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_read_digital_keypad16
L__read_digital_keypad18:
;digital_keypad.c,46 :: 		once = 1;
	MOVLW       1
	MOVWF       digital_keypad_once+0 
;digital_keypad.c,47 :: 		if(longpress < 20) {
	MOVLW       20
	SUBWF       digital_keypad_longpress+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_read_digital_keypad17
;digital_keypad.c,48 :: 		return pre_key;
	MOVF        digital_keypad_pre_key+0, 0 
	MOVWF       R0 
	GOTO        L_end_read_digital_keypad
;digital_keypad.c,49 :: 		}
L_read_digital_keypad17:
;digital_keypad.c,50 :: 		}
L_read_digital_keypad16:
L_read_digital_keypad11:
L_read_digital_keypad7:
;digital_keypad.c,52 :: 		return ALL_RELEASED;
	MOVLW       63
	MOVWF       R0 
;digital_keypad.c,53 :: 		}
L_end_read_digital_keypad:
	RETURN      0
; end of _read_digital_keypad
