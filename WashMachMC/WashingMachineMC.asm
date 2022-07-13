
WashingMachineMC_init_config:

;WashingMachineMC.c,21 :: 		static void init_config(void) {
;WashingMachineMC.c,23 :: 		ANSELA = 0;
	CLRF        ANSELA+0 
;WashingMachineMC.c,24 :: 		ANSELB = 0;
	CLRF        ANSELB+0 
;WashingMachineMC.c,25 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;WashingMachineMC.c,26 :: 		ANSELD = 0;
	CLRF        ANSELD+0 
;WashingMachineMC.c,27 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;WashingMachineMC.c,30 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;WashingMachineMC.c,33 :: 		init_digital_keypad();
	CALL        _init_digital_keypad+0, 0
;WashingMachineMC.c,36 :: 		init_timer2();
	CALL        _init_timer2+0, 0
;WashingMachineMC.c,39 :: 		FAN_DDR = 0;
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;WashingMachineMC.c,40 :: 		BUZZER_DDR = 0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;WashingMachineMC.c,43 :: 		PEIE_bit = 1;     // Enable peripheral interrupts.
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;WashingMachineMC.c,44 :: 		GIE_bit = 1;      // Enable global interrupt
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;WashingMachineMC.c,45 :: 		}
L_end_init_config:
	RETURN      0
; end of WashingMachineMC_init_config

_main:

;WashingMachineMC.c,47 :: 		void main(void) {
;WashingMachineMC.c,48 :: 		init_config();
	CALL        WashingMachineMC_init_config+0, 0
;WashingMachineMC.c,50 :: 		key = 0x3F;
	MOVLW       63
	MOVWF       _key+0 
;WashingMachineMC.c,51 :: 		operation_mode = WASHING_PROGRAM_DISPLAY;
	MOVLW       1
	MOVWF       _operation_mode+0 
;WashingMachineMC.c,52 :: 		reset_mode = WASHING_PROGRAM_DISPLAY_RESET;
	MOVLW       16
	MOVWF       _reset_mode+0 
;WashingMachineMC.c,54 :: 		Lcd_Cmd(_LCD_CLEAR);                  // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;WashingMachineMC.c,55 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);             // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;WashingMachineMC.c,57 :: 		Lcd_Out(1, 3, " Press START to");       // Write text in first row
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,58 :: 		Lcd_Out(2, 3, " Starting the   ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,59 :: 		Lcd_Out(3, 3, " Washing Machine");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,62 :: 		while (read_digital_keypad(STATE) != SW5) { Delay_us(300); }
L_main0:
	MOVLW       1
	MOVWF       FARG_read_digital_keypad_mode+0 
	CALL        _read_digital_keypad+0, 0
	MOVF        R0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L_main1
	MOVLW       199
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	NOP
	NOP
	GOTO        L_main0
L_main1:
;WashingMachineMC.c,65 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,68 :: 		power_on_screen();
	CALL        _power_on_screen+0, 0
;WashingMachineMC.c,70 :: 		while (1) {
L_main3:
;WashingMachineMC.c,72 :: 		key = read_digital_keypad(STATE);
	MOVLW       1
	MOVWF       FARG_read_digital_keypad_mode+0 
	CALL        _read_digital_keypad+0, 0
	MOVF        R0, 0 
	MOVWF       _key+0 
;WashingMachineMC.c,73 :: 		Delay_uS(10);
	MOVLW       6
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	NOP
;WashingMachineMC.c,75 :: 		if (key == LSW4 && operation_mode == WASHING_PROGRAM_DISPLAY) {
	MOVF        _key+0, 0 
	XORLW       183
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
	MOVF        _operation_mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
L__main129:
;WashingMachineMC.c,78 :: 		operation_mode = WATER_LEVEL;
	MOVLW       2
	MOVWF       _operation_mode+0 
;WashingMachineMC.c,79 :: 		reset_mode = WATER_LEVEL_RESET;
	MOVLW       17
	MOVWF       _reset_mode+0 
;WashingMachineMC.c,80 :: 		}
	GOTO        L_main9
L_main8:
;WashingMachineMC.c,81 :: 		else if (key == LSW4 && operation_mode == WATER_LEVEL) {
	MOVF        _key+0, 0 
	XORLW       183
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
	MOVF        _operation_mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
L__main128:
;WashingMachineMC.c,84 :: 		set_time_for_program();
	CALL        _set_time_for_program+0, 0
;WashingMachineMC.c,85 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,88 :: 		Lcd_Out(1, 4, " PLEASE PRESS");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,89 :: 		Lcd_Out(2, 4, " START BUTTON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,90 :: 		Lcd_Out(3, 4, "      OR     ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,91 :: 		Lcd_Out(4, 4, " BACK  BUTTON ");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,92 :: 		operation_mode = START_STOP_SCREEN;
	MOVLW       3
	MOVWF       _operation_mode+0 
;WashingMachineMC.c,93 :: 		}
	GOTO        L_main13
L_main12:
;WashingMachineMC.c,94 :: 		else if (key == SW5 && operation_mode == PAUSE) {
	MOVF        _key+0, 0 
	XORLW       47
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
	MOVF        _operation_mode+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
L__main127:
;WashingMachineMC.c,95 :: 		TMR2ON_bit = ON; //START TIMER
	BSF         TMR2ON_bit+0, BitPos(TMR2ON_bit+0) 
;WashingMachineMC.c,96 :: 		FAN = ON;
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;WashingMachineMC.c,97 :: 		operation_mode = START_PROGRAM;
	MOVLW       4
	MOVWF       _operation_mode+0 
;WashingMachineMC.c,98 :: 		}
L_main16:
L_main13:
L_main9:
;WashingMachineMC.c,100 :: 		switch (operation_mode) {
	GOTO        L_main17
;WashingMachineMC.c,101 :: 		case WASHING_PROGRAM_DISPLAY:
L_main19:
;WashingMachineMC.c,102 :: 		washing_program_display(key);
	MOVF        _key+0, 0 
	MOVWF       FARG_washing_program_display_key+0 
	CALL        _washing_program_display+0, 0
;WashingMachineMC.c,103 :: 		break;
	GOTO        L_main18
;WashingMachineMC.c,105 :: 		case WATER_LEVEL:
L_main20:
;WashingMachineMC.c,106 :: 		water_level_display(key);
	MOVF        _key+0, 0 
	MOVWF       FARG_water_level_display_key+0 
	CALL        _water_level_display+0, 0
;WashingMachineMC.c,107 :: 		break;
	GOTO        L_main18
;WashingMachineMC.c,109 :: 		case START_STOP_SCREEN:
L_main21:
;WashingMachineMC.c,110 :: 		if (key == SW5) {
	MOVF        _key+0, 0 
	XORLW       47
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
;WashingMachineMC.c,111 :: 		operation_mode = START_PROGRAM;
	MOVLW       4
	MOVWF       _operation_mode+0 
;WashingMachineMC.c,112 :: 		reset_mode = START_PROGRAM_RESET;
	MOVLW       18
	MOVWF       _reset_mode+0 
;WashingMachineMC.c,113 :: 		continue;
	GOTO        L_main3
;WashingMachineMC.c,114 :: 		}
L_main22:
;WashingMachineMC.c,115 :: 		else if (key == SW6) {
	MOVF        _key+0, 0 
	XORLW       31
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;WashingMachineMC.c,116 :: 		operation_mode = WASHING_PROGRAM_DISPLAY;
	MOVLW       1
	MOVWF       _operation_mode+0 
;WashingMachineMC.c,117 :: 		reset_mode = WASHING_PROGRAM_DISPLAY_RESET;
	MOVLW       16
	MOVWF       _reset_mode+0 
;WashingMachineMC.c,118 :: 		continue;
	GOTO        L_main3
;WashingMachineMC.c,119 :: 		}
L_main24:
;WashingMachineMC.c,120 :: 		break;
	GOTO        L_main18
;WashingMachineMC.c,122 :: 		case START_PROGRAM:
L_main25:
;WashingMachineMC.c,123 :: 		run_program(key);
	MOVF        _key+0, 0 
	MOVWF       FARG_run_program_key+0 
	CALL        _run_program+0, 0
;WashingMachineMC.c,124 :: 		break;
	GOTO        L_main18
;WashingMachineMC.c,125 :: 		}
L_main17:
	MOVF        _operation_mode+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
	MOVF        _operation_mode+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
	MOVF        _operation_mode+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _operation_mode+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
L_main18:
;WashingMachineMC.c,126 :: 		reset_mode = REST_NOTHING;
	CLRF        _reset_mode+0 
;WashingMachineMC.c,127 :: 		}
	GOTO        L_main3
;WashingMachineMC.c,128 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_clear_screen:

;WashingMachineMC.c,130 :: 		void clear_screen(void) {
;WashingMachineMC.c,131 :: 		Lcd_Cmd(_LCD_CLEAR);                  // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;WashingMachineMC.c,132 :: 		Delay_uS(100);
	MOVLW       66
	MOVWF       R13, 0
L_clear_screen26:
	DECFSZ      R13, 1, 1
	BRA         L_clear_screen26
	NOP
;WashingMachineMC.c,133 :: 		}
L_end_clear_screen:
	RETURN      0
; end of _clear_screen

_power_on_screen:

;WashingMachineMC.c,135 :: 		void power_on_screen(void) {
;WashingMachineMC.c,137 :: 		for (i = 1; i < 20; i++) {
	MOVLW       1
	MOVWF       _i+0 
L_power_on_screen27:
	MOVLW       20
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_power_on_screen28
;WashingMachineMC.c,138 :: 		Lcd_Out(1, i, "#");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _i+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,137 :: 		for (i = 1; i < 20; i++) {
	INCF        _i+0, 1 
;WashingMachineMC.c,139 :: 		}
	GOTO        L_power_on_screen27
L_power_on_screen28:
;WashingMachineMC.c,141 :: 		Lcd_Out(2, 1, "    STARTING THE");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,142 :: 		Lcd_Out(3, 1, "  WASHING MACHINE");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,145 :: 		for (i = 1; i < 20; i++) {
	MOVLW       1
	MOVWF       _i+0 
L_power_on_screen30:
	MOVLW       20
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_power_on_screen31
;WashingMachineMC.c,146 :: 		Lcd_Out(4, i, "#");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _i+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,145 :: 		for (i = 1; i < 20; i++) {
	INCF        _i+0, 1 
;WashingMachineMC.c,147 :: 		}
	GOTO        L_power_on_screen30
L_power_on_screen31:
;WashingMachineMC.c,148 :: 		}
L_end_power_on_screen:
	RETURN      0
; end of _power_on_screen

_washing_program_display:

;WashingMachineMC.c,150 :: 		void washing_program_display(unsigned char key) {
;WashingMachineMC.c,151 :: 		if (reset_mode == WASHING_PROGRAM_DISPLAY_RESET) {
	MOVF        _reset_mode+0, 0 
	XORLW       16
	BTFSS       STATUS+0, 2 
	GOTO        L_washing_program_display33
;WashingMachineMC.c,152 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,153 :: 		program_no = 0;
	CLRF        _program_no+0 
;WashingMachineMC.c,154 :: 		}
L_washing_program_display33:
;WashingMachineMC.c,155 :: 		if (key == SW4) {
	MOVF        FARG_washing_program_display_key+0, 0 
	XORLW       55
	BTFSS       STATUS+0, 2 
	GOTO        L_washing_program_display34
;WashingMachineMC.c,156 :: 		program_no++;
	INCF        _program_no+0, 1 
;WashingMachineMC.c,157 :: 		if (program_no == 12)
	MOVF        _program_no+0, 0 
	XORLW       12
	BTFSS       STATUS+0, 2 
	GOTO        L_washing_program_display35
;WashingMachineMC.c,158 :: 		program_no = 0;
	CLRF        _program_no+0 
L_washing_program_display35:
;WashingMachineMC.c,159 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,160 :: 		}
L_washing_program_display34:
;WashingMachineMC.c,162 :: 		Lcd_Out(1, 1, " WASHING PROGRAM");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,163 :: 		Lcd_Out(2, 1, "->");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,165 :: 		if (program_no <= 9) {
	MOVF        _program_no+0, 0 
	SUBLW       9
	BTFSS       STATUS+0, 0 
	GOTO        L_washing_program_display36
;WashingMachineMC.c,166 :: 		Lcd_Out(2, 4, washing_prog[program_no]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       4
	MOVWF       R2 
	MOVF        _program_no+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__washing_program_display136:
	BZ          L__washing_program_display137
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__washing_program_display136
L__washing_program_display137:
	MOVLW       _washing_prog+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,167 :: 		Lcd_Out(3, 4, washing_prog[program_no + 1]);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _program_no+0, 0 
	ADDLW       1
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	ADDWFC      R4, 1 
	MOVLW       4
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__washing_program_display138:
	BZ          L__washing_program_display139
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__washing_program_display138
L__washing_program_display139:
	MOVLW       _washing_prog+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,168 :: 		Lcd_Out(4, 4, washing_prog[program_no + 2]);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       2
	ADDWF       _program_no+0, 0 
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	ADDWFC      R4, 1 
	MOVLW       4
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__washing_program_display140:
	BZ          L__washing_program_display141
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__washing_program_display140
L__washing_program_display141:
	MOVLW       _washing_prog+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,169 :: 		}
	GOTO        L_washing_program_display37
L_washing_program_display36:
;WashingMachineMC.c,170 :: 		else if (program_no == 10) {
	MOVF        _program_no+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_washing_program_display38
;WashingMachineMC.c,171 :: 		Lcd_Out(2, 4, washing_prog[program_no]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       4
	MOVWF       R2 
	MOVF        _program_no+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__washing_program_display142:
	BZ          L__washing_program_display143
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__washing_program_display142
L__washing_program_display143:
	MOVLW       _washing_prog+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,172 :: 		Lcd_Out(3, 4, washing_prog[program_no + 1]);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _program_no+0, 0 
	ADDLW       1
	MOVWF       R3 
	CLRF        R4 
	MOVLW       0
	ADDWFC      R4, 1 
	MOVLW       4
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__washing_program_display144:
	BZ          L__washing_program_display145
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__washing_program_display144
L__washing_program_display145:
	MOVLW       _washing_prog+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,173 :: 		Lcd_Out(4, 4, washing_prog[0]);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _washing_prog+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,174 :: 		}
	GOTO        L_washing_program_display39
L_washing_program_display38:
;WashingMachineMC.c,175 :: 		else if (program_no == 11) {
	MOVF        _program_no+0, 0 
	XORLW       11
	BTFSS       STATUS+0, 2 
	GOTO        L_washing_program_display40
;WashingMachineMC.c,176 :: 		Lcd_Out(2, 4, washing_prog[program_no]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       4
	MOVWF       R2 
	MOVF        _program_no+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__washing_program_display146:
	BZ          L__washing_program_display147
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__washing_program_display146
L__washing_program_display147:
	MOVLW       _washing_prog+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,177 :: 		Lcd_Out(3, 4, washing_prog[0]);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _washing_prog+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,178 :: 		Lcd_Out(4, 4, washing_prog[1]);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _washing_prog+16
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_washing_prog+16)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,179 :: 		}
L_washing_program_display40:
L_washing_program_display39:
L_washing_program_display37:
;WashingMachineMC.c,180 :: 		}
L_end_washing_program_display:
	RETURN      0
; end of _washing_program_display

_water_level_display:

;WashingMachineMC.c,182 :: 		void water_level_display(unsigned char key) {
;WashingMachineMC.c,183 :: 		if (reset_mode == WATER_LEVEL_RESET) {
	MOVF        _reset_mode+0, 0 
	XORLW       17
	BTFSS       STATUS+0, 2 
	GOTO        L_water_level_display41
;WashingMachineMC.c,184 :: 		water_level_index = 0;
	CLRF        _water_level_index+0 
;WashingMachineMC.c,185 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,186 :: 		}
L_water_level_display41:
;WashingMachineMC.c,187 :: 		if (key == SW4) {
	MOVF        FARG_water_level_display_key+0, 0 
	XORLW       55
	BTFSS       STATUS+0, 2 
	GOTO        L_water_level_display42
;WashingMachineMC.c,188 :: 		water_level_index++;
	INCF        _water_level_index+0, 1 
;WashingMachineMC.c,190 :: 		if (water_level_index == 5) {
	MOVF        _water_level_index+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_water_level_display43
;WashingMachineMC.c,191 :: 		water_level_index = 0;
	CLRF        _water_level_index+0 
;WashingMachineMC.c,192 :: 		}
L_water_level_display43:
;WashingMachineMC.c,193 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,194 :: 		}
L_water_level_display42:
;WashingMachineMC.c,196 :: 		Lcd_Out(1, 1, " WATER LEVEL");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,197 :: 		Lcd_Out(2, 1, "->");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,199 :: 		if (water_level_index <= 2) {
	MOVF        _water_level_index+0, 0 
	SUBLW       2
	BTFSS       STATUS+0, 0 
	GOTO        L_water_level_display44
;WashingMachineMC.c,200 :: 		Lcd_Out(2, 4, water_level_arr[water_level_index]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       7
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _water_level_index+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _water_level_arr+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,201 :: 		Lcd_Out(3, 4, water_level_arr[water_level_index + 1]);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _water_level_index+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       7
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _water_level_arr+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,202 :: 		Lcd_Out(4, 4, water_level_arr[water_level_index + 2]);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       2
	ADDWF       _water_level_index+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       7
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _water_level_arr+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,203 :: 		}
	GOTO        L_water_level_display45
L_water_level_display44:
;WashingMachineMC.c,204 :: 		else if (water_level_index == 3) {
	MOVF        _water_level_index+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_water_level_display46
;WashingMachineMC.c,205 :: 		Lcd_Out(2, 4, water_level_arr[water_level_index]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       7
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _water_level_index+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _water_level_arr+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,206 :: 		Lcd_Out(3, 4, water_level_arr[water_level_index + 1]);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        _water_level_index+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       7
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _water_level_arr+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,207 :: 		Lcd_Out(4, 4, water_level_arr[0]);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _water_level_arr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,208 :: 		}
	GOTO        L_water_level_display47
L_water_level_display46:
;WashingMachineMC.c,209 :: 		else if (water_level_index == 4) {
	MOVF        _water_level_index+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_water_level_display48
;WashingMachineMC.c,210 :: 		Lcd_Out(2, 4, water_level_arr[water_level_index]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       7
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _water_level_index+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _water_level_arr+0
	ADDWF       R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+0)
	ADDWFC      R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,211 :: 		Lcd_Out(3, 4, water_level_arr[0]);
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _water_level_arr+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,212 :: 		Lcd_Out(4, 4, water_level_arr[1]);
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _water_level_arr+7
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_water_level_arr+7)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,213 :: 		}
L_water_level_display48:
L_water_level_display47:
L_water_level_display45:
;WashingMachineMC.c,214 :: 		}
L_end_water_level_display:
	RETURN      0
; end of _water_level_display

_set_time_for_program:

;WashingMachineMC.c,216 :: 		void set_time_for_program(void) {
;WashingMachineMC.c,217 :: 		switch (program_no) {
	GOTO        L_set_time_for_program49
;WashingMachineMC.c,218 :: 		case 0: //Quick program
L_set_time_for_program51:
;WashingMachineMC.c,219 :: 		switch (water_level_index) {
	GOTO        L_set_time_for_program52
;WashingMachineMC.c,220 :: 		case 1://low
L_set_time_for_program54:
;WashingMachineMC.c,221 :: 		sec = 33;  // 33
	MOVLW       33
	MOVWF       _sec+0 
;WashingMachineMC.c,222 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,223 :: 		break;
	GOTO        L_set_time_for_program53
;WashingMachineMC.c,224 :: 		case 0:
L_set_time_for_program55:
;WashingMachineMC.c,225 :: 		case 2:
L_set_time_for_program56:
;WashingMachineMC.c,226 :: 		sec = 41;     //41
	MOVLW       41
	MOVWF       _sec+0 
;WashingMachineMC.c,227 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,228 :: 		break;
	GOTO        L_set_time_for_program53
;WashingMachineMC.c,229 :: 		case 3:
L_set_time_for_program57:
;WashingMachineMC.c,230 :: 		case 4:
L_set_time_for_program58:
;WashingMachineMC.c,231 :: 		sec = 45;
	MOVLW       45
	MOVWF       _sec+0 
;WashingMachineMC.c,232 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,233 :: 		}
	GOTO        L_set_time_for_program53
L_set_time_for_program52:
	MOVF        _water_level_index+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program54
	MOVF        _water_level_index+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program55
	MOVF        _water_level_index+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program56
	MOVF        _water_level_index+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program57
	MOVF        _water_level_index+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program58
L_set_time_for_program53:
;WashingMachineMC.c,234 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,235 :: 		case 1://Bulky
L_set_time_for_program59:
;WashingMachineMC.c,236 :: 		switch (water_level_index) {
	GOTO        L_set_time_for_program60
;WashingMachineMC.c,238 :: 		case 1://LOW
L_set_time_for_program62:
;WashingMachineMC.c,239 :: 		sec = 43;
	MOVLW       43
	MOVWF       _sec+0 
;WashingMachineMC.c,240 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,241 :: 		case 0:
L_set_time_for_program63:
;WashingMachineMC.c,242 :: 		case 2:
L_set_time_for_program64:
;WashingMachineMC.c,243 :: 		sec = 50;
	MOVLW       50
	MOVWF       _sec+0 
;WashingMachineMC.c,244 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,245 :: 		break;
	GOTO        L_set_time_for_program61
;WashingMachineMC.c,246 :: 		case 3:
L_set_time_for_program65:
;WashingMachineMC.c,247 :: 		case 4:
L_set_time_for_program66:
;WashingMachineMC.c,248 :: 		sec = 57;
	MOVLW       57
	MOVWF       _sec+0 
;WashingMachineMC.c,249 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,250 :: 		}
	GOTO        L_set_time_for_program61
L_set_time_for_program60:
	MOVF        _water_level_index+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program62
	MOVF        _water_level_index+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program63
	MOVF        _water_level_index+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program64
	MOVF        _water_level_index+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program65
	MOVF        _water_level_index+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program66
L_set_time_for_program61:
;WashingMachineMC.c,251 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,252 :: 		case 2: //Gentle
L_set_time_for_program67:
;WashingMachineMC.c,253 :: 		switch (water_level_index) {
	GOTO        L_set_time_for_program68
;WashingMachineMC.c,255 :: 		case 1://Low
L_set_time_for_program70:
;WashingMachineMC.c,256 :: 		case 0:
L_set_time_for_program71:
;WashingMachineMC.c,257 :: 		case 2:
L_set_time_for_program72:
;WashingMachineMC.c,258 :: 		sec = 26;
	MOVLW       26
	MOVWF       _sec+0 
;WashingMachineMC.c,259 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,260 :: 		break;
	GOTO        L_set_time_for_program69
;WashingMachineMC.c,261 :: 		case 3:
L_set_time_for_program73:
;WashingMachineMC.c,262 :: 		case 4:
L_set_time_for_program74:
;WashingMachineMC.c,263 :: 		sec = 31;
	MOVLW       31
	MOVWF       _sec+0 
;WashingMachineMC.c,264 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,265 :: 		}
	GOTO        L_set_time_for_program69
L_set_time_for_program68:
	MOVF        _water_level_index+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program70
	MOVF        _water_level_index+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program71
	MOVF        _water_level_index+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program72
	MOVF        _water_level_index+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program73
	MOVF        _water_level_index+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program74
L_set_time_for_program69:
;WashingMachineMC.c,266 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,267 :: 		case 3: //whites
L_set_time_for_program75:
;WashingMachineMC.c,268 :: 		sec = 16;
	MOVLW       16
	MOVWF       _sec+0 
;WashingMachineMC.c,269 :: 		min = 1;
	MOVLW       1
	MOVWF       _min+0 
;WashingMachineMC.c,270 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,271 :: 		case 4: //Stain Wash 96sec
L_set_time_for_program76:
;WashingMachineMC.c,272 :: 		sec = 36;
	MOVLW       36
	MOVWF       _sec+0 
;WashingMachineMC.c,273 :: 		min = 1;
	MOVLW       1
	MOVWF       _min+0 
;WashingMachineMC.c,274 :: 		case 5: //Cotton Cycle
L_set_time_for_program77:
;WashingMachineMC.c,275 :: 		sec = 28;
	MOVLW       28
	MOVWF       _sec+0 
;WashingMachineMC.c,276 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,277 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,278 :: 		case 6: //Wool Cycle
L_set_time_for_program78:
;WashingMachineMC.c,279 :: 		sec = 29;
	MOVLW       29
	MOVWF       _sec+0 
;WashingMachineMC.c,280 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,281 :: 		case 7: //Sport Cycle
L_set_time_for_program79:
;WashingMachineMC.c,282 :: 		switch (water_level_index) {
	GOTO        L_set_time_for_program80
;WashingMachineMC.c,283 :: 		case 1: // low
L_set_time_for_program82:
;WashingMachineMC.c,284 :: 		sec = 46;
	MOVLW       46
	MOVWF       _sec+0 
;WashingMachineMC.c,285 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,286 :: 		case 0:
L_set_time_for_program83:
;WashingMachineMC.c,287 :: 		case 2:
L_set_time_for_program84:
;WashingMachineMC.c,288 :: 		sec = 53;
	MOVLW       53
	MOVWF       _sec+0 
;WashingMachineMC.c,289 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,290 :: 		break;
	GOTO        L_set_time_for_program81
;WashingMachineMC.c,291 :: 		case 3:
L_set_time_for_program85:
;WashingMachineMC.c,292 :: 		case 4:
L_set_time_for_program86:
;WashingMachineMC.c,293 :: 		sec = 60;
	MOVLW       60
	MOVWF       _sec+0 
;WashingMachineMC.c,294 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,295 :: 		}
	GOTO        L_set_time_for_program81
L_set_time_for_program80:
	MOVF        _water_level_index+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program82
	MOVF        _water_level_index+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program83
	MOVF        _water_level_index+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program84
	MOVF        _water_level_index+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program85
	MOVF        _water_level_index+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program86
L_set_time_for_program81:
;WashingMachineMC.c,296 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,297 :: 		case 8: //Rinse and Spin
L_set_time_for_program87:
;WashingMachineMC.c,298 :: 		switch (water_level_index) {
	GOTO        L_set_time_for_program88
;WashingMachineMC.c,299 :: 		case 1: //low
L_set_time_for_program90:
;WashingMachineMC.c,300 :: 		sec = 18;
	MOVLW       18
	MOVWF       _sec+0 
;WashingMachineMC.c,301 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,302 :: 		case 0:
L_set_time_for_program91:
;WashingMachineMC.c,303 :: 		case 2:
L_set_time_for_program92:
;WashingMachineMC.c,304 :: 		case 3:
L_set_time_for_program93:
;WashingMachineMC.c,305 :: 		case 4:
L_set_time_for_program94:
;WashingMachineMC.c,306 :: 		sec = 20;
	MOVLW       20
	MOVWF       _sec+0 
;WashingMachineMC.c,307 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,308 :: 		}
	GOTO        L_set_time_for_program89
L_set_time_for_program88:
	MOVF        _water_level_index+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program90
	MOVF        _water_level_index+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program91
	MOVF        _water_level_index+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program92
	MOVF        _water_level_index+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program93
	MOVF        _water_level_index+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program94
L_set_time_for_program89:
;WashingMachineMC.c,309 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,310 :: 		case 9: //Spin only
L_set_time_for_program95:
;WashingMachineMC.c,311 :: 		sec = 6;
	MOVLW       6
	MOVWF       _sec+0 
;WashingMachineMC.c,312 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,313 :: 		case 10: //Wash Only
L_set_time_for_program96:
;WashingMachineMC.c,314 :: 		case 11: //Aqua store
L_set_time_for_program97:
;WashingMachineMC.c,315 :: 		switch (water_level_index) {
	GOTO        L_set_time_for_program98
;WashingMachineMC.c,316 :: 		case 1: //low
L_set_time_for_program100:
;WashingMachineMC.c,317 :: 		sec = 16;
	MOVLW       16
	MOVWF       _sec+0 
;WashingMachineMC.c,318 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,319 :: 		case 0:
L_set_time_for_program101:
;WashingMachineMC.c,320 :: 		case 2:
L_set_time_for_program102:
;WashingMachineMC.c,321 :: 		sec = 21;
	MOVLW       21
	MOVWF       _sec+0 
;WashingMachineMC.c,322 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,323 :: 		break;
	GOTO        L_set_time_for_program99
;WashingMachineMC.c,324 :: 		case 3:
L_set_time_for_program103:
;WashingMachineMC.c,325 :: 		case 4:
L_set_time_for_program104:
;WashingMachineMC.c,326 :: 		sec = 26;
	MOVLW       26
	MOVWF       _sec+0 
;WashingMachineMC.c,327 :: 		min = 0;
	CLRF        _min+0 
;WashingMachineMC.c,328 :: 		}
	GOTO        L_set_time_for_program99
L_set_time_for_program98:
	MOVF        _water_level_index+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program100
	MOVF        _water_level_index+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program101
	MOVF        _water_level_index+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program102
	MOVF        _water_level_index+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program103
	MOVF        _water_level_index+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program104
L_set_time_for_program99:
;WashingMachineMC.c,329 :: 		break;
	GOTO        L_set_time_for_program50
;WashingMachineMC.c,330 :: 		}
L_set_time_for_program49:
	MOVF        _program_no+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program51
	MOVF        _program_no+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program59
	MOVF        _program_no+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program67
	MOVF        _program_no+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program75
	MOVF        _program_no+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program76
	MOVF        _program_no+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program77
	MOVF        _program_no+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program78
	MOVF        _program_no+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program79
	MOVF        _program_no+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program87
	MOVF        _program_no+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program95
	MOVF        _program_no+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program96
	MOVF        _program_no+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_set_time_for_program97
L_set_time_for_program50:
;WashingMachineMC.c,331 :: 		}
L_end_set_time_for_program:
	RETURN      0
; end of _set_time_for_program

_door_status_check:

;WashingMachineMC.c,333 :: 		void door_status_check(void) {
;WashingMachineMC.c,335 :: 		if (RB0_bit == 0) {
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_door_status_check105
;WashingMachineMC.c,337 :: 		BUZZER = ON;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;WashingMachineMC.c,338 :: 		FAN = OFF;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;WashingMachineMC.c,339 :: 		TMR2ON_bit = OFF;
	BCF         TMR2ON_bit+0, BitPos(TMR2ON_bit+0) 
;WashingMachineMC.c,341 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,342 :: 		Lcd_Out(1, 1, " DOOR : OPEN");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,343 :: 		Lcd_Out(3, 1, " Please Close");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr17_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,346 :: 		while (RB0 == 0) { ; }
L_door_status_check106:
	GOTO        L_door_status_check106
;WashingMachineMC.c,357 :: 		}
L_door_status_check105:
;WashingMachineMC.c,358 :: 		}
L_end_door_status_check:
	RETURN      0
; end of _door_status_check

_run_program:

;WashingMachineMC.c,361 :: 		void run_program(unsigned char key) {
;WashingMachineMC.c,363 :: 		door_status_check();
	CALL        _door_status_check+0, 0
;WashingMachineMC.c,364 :: 		Lcd_Out(2, 9, " ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,365 :: 		Lcd_Out(2, 13, " ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,367 :: 		if (reset_mode == START_PROGRAM_RESET) {
	MOVF        _reset_mode+0, 0 
	XORLW       18
	BTFSS       STATUS+0, 2 
	GOTO        L_run_program108
;WashingMachineMC.c,368 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,369 :: 		Lcd_Out(1, 1, " PROGRAM: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr23_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr23_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,370 :: 		Lcd_Chr(1, 7, washing_prog[program_no]);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       4
	MOVWF       R2 
	MOVF        _program_no+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        R2, 0 
L__run_program152:
	BZ          L__run_program153
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__run_program152
L__run_program153:
	MOVLW       _washing_prog+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_washing_prog+0)
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;WashingMachineMC.c,371 :: 		Lcd_Out(2, 1, " TIME:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr24_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr24_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,373 :: 		Lcd_Out(2, 9, byte_to_str(min));
	MOVF        _min+0, 0 
	MOVWF       FARG_byte_to_str_input+0 
	MOVLW       0
	MOVWF       FARG_byte_to_str_input+1 
	CALL        _byte_to_str+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       0
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,374 :: 		Lcd_Out(2, 9, " ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr25_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr25_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,375 :: 		Lcd_Chr(2, 12, ':');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;WashingMachineMC.c,376 :: 		Lcd_Out(2, 13, byte_to_str(sec));
	MOVF        _sec+0, 0 
	MOVWF       FARG_byte_to_str_input+0 
	MOVLW       0
	MOVWF       FARG_byte_to_str_input+1 
	CALL        _byte_to_str+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       0
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,377 :: 		Lcd_Out(2, 13, " ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr26_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr26_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,378 :: 		Lcd_Out(3, 8, " (MM:SS)");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr27_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr27_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,380 :: 		Delay_mS(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_run_program109:
	DECFSZ      R13, 1, 1
	BRA         L_run_program109
	DECFSZ      R12, 1, 1
	BRA         L_run_program109
	DECFSZ      R11, 1, 1
	BRA         L_run_program109
	NOP
	NOP
;WashingMachineMC.c,383 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,384 :: 		Lcd_Out(1, 1, " FUNCTION -");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr28_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr28_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,385 :: 		Lcd_Out(2, 1, " TIME");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr29_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,386 :: 		Lcd_Out(4, 1, " B4-START  B5-PAUSE");
	MOVLW       4
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr30_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr30_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,389 :: 		time = total_time = (min * 60 + sec);
	MOVLW       60
	MULWF       _min+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        _sec+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       WashingMachineMC_total_time+0 
	MOVF        R1, 0 
	MOVWF       WashingMachineMC_total_time+1 
	MOVF        R0, 0 
	MOVWF       WashingMachineMC_time+0 
	MOVF        R1, 0 
	MOVWF       WashingMachineMC_time+1 
;WashingMachineMC.c,390 :: 		wash_time = (int) total_time * (46 / 100);
	CLRF        _wash_time+0 
	CLRF        _wash_time+1 
;WashingMachineMC.c,391 :: 		rinse_time = (int) total_time * (12 / 100);
	CLRF        _rinse_time+0 
	CLRF        _rinse_time+1 
;WashingMachineMC.c,392 :: 		spin_time = total_time - wash_time - rinse_time;
	MOVF        R0, 0 
	MOVWF       _spin_time+0 
	MOVF        R1, 0 
	MOVWF       _spin_time+1 
;WashingMachineMC.c,395 :: 		TMR2ON_bit = 1;
	BSF         TMR2ON_bit+0, BitPos(TMR2ON_bit+0) 
;WashingMachineMC.c,398 :: 		}
L_run_program108:
;WashingMachineMC.c,401 :: 		if (key == SW6) {
	MOVF        FARG_run_program_key+0, 0 
	XORLW       31
	BTFSS       STATUS+0, 2 
	GOTO        L_run_program110
;WashingMachineMC.c,402 :: 		TMR2ON_bit = OFF; //TURN OFF TIMER
	BCF         TMR2ON_bit+0, BitPos(TMR2ON_bit+0) 
;WashingMachineMC.c,403 :: 		FAN = OFF;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;WashingMachineMC.c,404 :: 		operation_mode = PAUSE;
	MOVLW       5
	MOVWF       _operation_mode+0 
;WashingMachineMC.c,405 :: 		}
L_run_program110:
;WashingMachineMC.c,407 :: 		total_time = (min * 60 + sec);
	MOVLW       60
	MULWF       _min+0 
	MOVF        PRODL+0, 0 
	MOVWF       WashingMachineMC_total_time+0 
	MOVF        PRODH+0, 0 
	MOVWF       WashingMachineMC_total_time+1 
	MOVF        _sec+0, 0 
	ADDWF       WashingMachineMC_total_time+0, 1 
	MOVLW       0
	ADDWFC      WashingMachineMC_total_time+1, 1 
;WashingMachineMC.c,409 :: 		if (program_no <= 7) {
	MOVF        _program_no+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_run_program111
;WashingMachineMC.c,410 :: 		if (total_time >= (time - wash_time)) { Lcd_Out(1, 12, " Wash"); }
	MOVF        _wash_time+0, 0 
	SUBWF       WashingMachineMC_time+0, 0 
	MOVWF       R1 
	MOVF        _wash_time+1, 0 
	SUBWFB      WashingMachineMC_time+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       WashingMachineMC_total_time+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__run_program154
	MOVF        R1, 0 
	SUBWF       WashingMachineMC_total_time+0, 0 
L__run_program154:
	BTFSS       STATUS+0, 0 
	GOTO        L_run_program112
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr31_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr31_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_run_program113
L_run_program112:
;WashingMachineMC.c,411 :: 		else if (total_time >= (time - wash_time - rinse_time)) { Lcd_Out(1, 12, " Rinse"); }
	MOVF        _wash_time+0, 0 
	SUBWF       WashingMachineMC_time+0, 0 
	MOVWF       R0 
	MOVF        _wash_time+1, 0 
	SUBWFB      WashingMachineMC_time+1, 0 
	MOVWF       R1 
	MOVF        _rinse_time+0, 0 
	SUBWF       R0, 0 
	MOVWF       R2 
	MOVF        _rinse_time+1, 0 
	SUBWFB      R1, 0 
	MOVWF       R3 
	MOVLW       128
	XORWF       WashingMachineMC_total_time+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__run_program155
	MOVF        R2, 0 
	SUBWF       WashingMachineMC_total_time+0, 0 
L__run_program155:
	BTFSS       STATUS+0, 0 
	GOTO        L_run_program114
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr32_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr32_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_run_program115
L_run_program114:
;WashingMachineMC.c,412 :: 		else Lcd_Out(1, 12, " Spin");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr33_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr33_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_run_program115:
L_run_program113:
;WashingMachineMC.c,413 :: 		}
	GOTO        L_run_program116
L_run_program111:
;WashingMachineMC.c,415 :: 		else if (program_no == 8) {
	MOVF        _program_no+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_run_program117
;WashingMachineMC.c,416 :: 		if (total_time >= (time - (0.40 * time))) { Lcd_Out(1, 12, " Rinse"); }
	MOVF        WashingMachineMC_time+0, 0 
	MOVWF       R0 
	MOVF        WashingMachineMC_time+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__run_program+0 
	MOVF        R1, 0 
	MOVWF       FLOC__run_program+1 
	MOVF        R2, 0 
	MOVWF       FLOC__run_program+2 
	MOVF        R3, 0 
	MOVWF       FLOC__run_program+3 
	MOVLW       205
	MOVWF       R0 
	MOVLW       204
	MOVWF       R1 
	MOVLW       76
	MOVWF       R2 
	MOVLW       125
	MOVWF       R3 
	MOVF        FLOC__run_program+0, 0 
	MOVWF       R4 
	MOVF        FLOC__run_program+1, 0 
	MOVWF       R5 
	MOVF        FLOC__run_program+2, 0 
	MOVWF       R6 
	MOVF        FLOC__run_program+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__run_program+0, 0 
	MOVWF       R0 
	MOVF        FLOC__run_program+1, 0 
	MOVWF       R1 
	MOVF        FLOC__run_program+2, 0 
	MOVWF       R2 
	MOVF        FLOC__run_program+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__run_program+0 
	MOVF        R1, 0 
	MOVWF       FLOC__run_program+1 
	MOVF        R2, 0 
	MOVWF       FLOC__run_program+2 
	MOVF        R3, 0 
	MOVWF       FLOC__run_program+3 
	MOVF        WashingMachineMC_total_time+0, 0 
	MOVWF       R0 
	MOVF        WashingMachineMC_total_time+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        FLOC__run_program+0, 0 
	MOVWF       R4 
	MOVF        FLOC__run_program+1, 0 
	MOVWF       R5 
	MOVF        FLOC__run_program+2, 0 
	MOVWF       R6 
	MOVF        FLOC__run_program+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_run_program118
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr34_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr34_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_run_program119
L_run_program118:
;WashingMachineMC.c,417 :: 		else { Lcd_Out(1, 12, " Spin "); }
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr35_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr35_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_run_program119:
;WashingMachineMC.c,418 :: 		}
	GOTO        L_run_program120
L_run_program117:
;WashingMachineMC.c,420 :: 		else if (program_no == 9) { Lcd_Out(1, 12, " Rinse"); }//aqua store
	MOVF        _program_no+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_run_program121
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr36_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr36_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_run_program122
L_run_program121:
;WashingMachineMC.c,421 :: 		else { Lcd_Out(1, 12, " Wash"); }
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr37_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr37_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_run_program122:
L_run_program120:
L_run_program116:
;WashingMachineMC.c,423 :: 		Lcd_Out(2, 9, byte_to_str(min));
	MOVF        _min+0, 0 
	MOVWF       FARG_byte_to_str_input+0 
	MOVLW       0
	MOVWF       FARG_byte_to_str_input+1 
	CALL        _byte_to_str+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       0
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,424 :: 		Lcd_Out(2, 9, " ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr38_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr38_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,425 :: 		Lcd_Chr(2, 12, ':');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       58
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;WashingMachineMC.c,426 :: 		Lcd_Out(2, 13, byte_to_str(sec));
	MOVF        _sec+0, 0 
	MOVWF       FARG_byte_to_str_input+0 
	MOVLW       0
	MOVWF       FARG_byte_to_str_input+1 
	CALL        _byte_to_str+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       0
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,427 :: 		Lcd_Out(2, 13, " ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr39_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr39_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,429 :: 		if (sec == 0 && min == 0) {
	MOVF        _sec+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_run_program125
	MOVF        _min+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_run_program125
L__run_program130:
;WashingMachineMC.c,432 :: 		TMR2ON_bit = OFF;
	BCF         TMR2ON_bit+0, BitPos(TMR2ON_bit+0) 
;WashingMachineMC.c,434 :: 		FAN = OFF;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;WashingMachineMC.c,436 :: 		BUZZER = ON;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;WashingMachineMC.c,438 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,440 :: 		Lcd_Out(1, 1, " Program Completed ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr40_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr40_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,441 :: 		Lcd_Out(3, 1, " Cloths are Removed");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr41_WashingMachineMC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr41_WashingMachineMC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;WashingMachineMC.c,442 :: 		Delay_mS(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_run_program126:
	DECFSZ      R13, 1, 1
	BRA         L_run_program126
	DECFSZ      R12, 1, 1
	BRA         L_run_program126
	DECFSZ      R11, 1, 1
	BRA         L_run_program126
	NOP
;WashingMachineMC.c,443 :: 		BUZZER = OFF;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;WashingMachineMC.c,444 :: 		operation_mode = WASHING_PROGRAM_DISPLAY;
	MOVLW       1
	MOVWF       _operation_mode+0 
;WashingMachineMC.c,445 :: 		reset_mode = WASHING_PROGRAM_DISPLAY_RESET;
	MOVLW       16
	MOVWF       _reset_mode+0 
;WashingMachineMC.c,446 :: 		clear_screen();
	CALL        _clear_screen+0, 0
;WashingMachineMC.c,447 :: 		}
L_run_program125:
;WashingMachineMC.c,448 :: 		}
L_end_run_program:
	RETURN      0
; end of _run_program

_byte_to_str:

;WashingMachineMC.c,450 :: 		char byte_to_str(int input) {
;WashingMachineMC.c,451 :: 		ByteToStrWithZeros(input, str);
	MOVF        FARG_byte_to_str_input+0, 0 
	MOVWF       FARG_ByteToStrWithZeros_input+0 
	MOVF        _str+0, 0 
	MOVWF       FARG_ByteToStrWithZeros_output+0 
	MOVLW       0
	MOVWF       FARG_ByteToStrWithZeros_output+1 
	CALL        _ByteToStrWithZeros+0, 0
;WashingMachineMC.c,452 :: 		return str;
	MOVF        _str+0, 0 
	MOVWF       R0 
;WashingMachineMC.c,453 :: 		}
L_end_byte_to_str:
	RETURN      0
; end of _byte_to_str
