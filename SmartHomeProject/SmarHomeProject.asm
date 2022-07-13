
_get_password:

;SmarHomeProject.c,36 :: 		char get_password() {
;SmarHomeProject.c,37 :: 		line1:
___get_password_line1:
;SmarHomeProject.c,38 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,39 :: 		Lcd_Out(1, 1, "ENTER PASSWORD");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,41 :: 		for (i = 0; i < 4; i++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_get_password0:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_password162
	MOVLW       4
	SUBWF       _i+0, 0 
L__get_password162:
	BTFSC       STATUS+0, 0 
	GOTO        L_get_password1
;SmarHomeProject.c,42 :: 		while (password[i] == 0) {
L_get_password3:
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password4
;SmarHomeProject.c,43 :: 		password[i] = Keypad_Key_Click();
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FLOC__get_password+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FLOC__get_password+1 
	CALL        _Keypad_Key_Click+0, 0
	MOVFF       FLOC__get_password+0, FSR1L+0
	MOVFF       FLOC__get_password+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;SmarHomeProject.c,44 :: 		}
	GOTO        L_get_password3
L_get_password4:
;SmarHomeProject.c,45 :: 		if (password[i] == 1) password[i] = '7';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password5
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       55
	MOVWF       POSTINC1+0 
L_get_password5:
;SmarHomeProject.c,46 :: 		if (password[i] == 2) password[i] = '8';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password6
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       56
	MOVWF       POSTINC1+0 
L_get_password6:
;SmarHomeProject.c,47 :: 		if (password[i] == 3) password[i] = '9';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password7
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       57
	MOVWF       POSTINC1+0 
L_get_password7:
;SmarHomeProject.c,48 :: 		if (password[i] == 5) password[i] = '4';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password8
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       52
	MOVWF       POSTINC1+0 
L_get_password8:
;SmarHomeProject.c,49 :: 		if (password[i] == 6) password[i] = '5';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password9
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       53
	MOVWF       POSTINC1+0 
L_get_password9:
;SmarHomeProject.c,50 :: 		if (password[i] == 7) password[i] = '6';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password10
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       54
	MOVWF       POSTINC1+0 
L_get_password10:
;SmarHomeProject.c,51 :: 		if (password[i] == 9) password[i] = '1';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password11
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       49
	MOVWF       POSTINC1+0 
L_get_password11:
;SmarHomeProject.c,52 :: 		if (password[i] == 10) password[i] = '2';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password12
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       50
	MOVWF       POSTINC1+0 
L_get_password12:
;SmarHomeProject.c,53 :: 		if (password[i] == 11) password[i] = '3';
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0L+1 
	MOVF        POSTINC0+0, 0 
	XORLW       11
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password13
	MOVLW       _password+0
	ADDWF       _i+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(_password+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       51
	MOVWF       POSTINC1+0 
L_get_password13:
;SmarHomeProject.c,55 :: 		Lcd_Chr(2, i + 1, '*');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _i+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       42
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SmarHomeProject.c,41 :: 		for (i = 0; i < 4; i++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;SmarHomeProject.c,56 :: 		}
	GOTO        L_get_password0
L_get_password1:
;SmarHomeProject.c,58 :: 		if (strcmp(password, "1925") == 0) {
	MOVLW       _password+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_password+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr2_SmarHomeProject+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr2_SmarHomeProject+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_password163
	MOVLW       0
	XORWF       R0, 0 
L__get_password163:
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password14
;SmarHomeProject.c,59 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,60 :: 		Lcd_Out(1, 5, "WELCOME");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,61 :: 		Lcd_Out(2, 4, "SMART HOME");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,62 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_get_password15:
	DECFSZ      R13, 1, 1
	BRA         L_get_password15
	DECFSZ      R12, 1, 1
	BRA         L_get_password15
	DECFSZ      R11, 1, 1
	BRA         L_get_password15
;SmarHomeProject.c,64 :: 		PORTA.RA3 = 1;
	BSF         PORTA+0, 3 
;SmarHomeProject.c,65 :: 		PORTE.RE2 = 0;
	BCF         PORTE+0, 2 
;SmarHomeProject.c,66 :: 		PORTE.RE0 = 1;
	BSF         PORTE+0, 0 
;SmarHomeProject.c,67 :: 		delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password16:
	DECFSZ      R13, 1, 1
	BRA         L_get_password16
	DECFSZ      R12, 1, 1
	BRA         L_get_password16
	DECFSZ      R11, 1, 1
	BRA         L_get_password16
	NOP
;SmarHomeProject.c,69 :: 		PORTA.RA3 = 0;
	BCF         PORTA+0, 3 
;SmarHomeProject.c,70 :: 		PORTE.RE2 = 0;
	BCF         PORTE+0, 2 
;SmarHomeProject.c,71 :: 		delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password17:
	DECFSZ      R13, 1, 1
	BRA         L_get_password17
	DECFSZ      R12, 1, 1
	BRA         L_get_password17
	DECFSZ      R11, 1, 1
	BRA         L_get_password17
	NOP
;SmarHomeProject.c,73 :: 		PORTA.RA3 = 0;
	BCF         PORTA+0, 3 
;SmarHomeProject.c,74 :: 		PORTE.RE2 = 1;
	BSF         PORTE+0, 2 
;SmarHomeProject.c,75 :: 		delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_get_password18:
	DECFSZ      R13, 1, 1
	BRA         L_get_password18
	DECFSZ      R12, 1, 1
	BRA         L_get_password18
	DECFSZ      R11, 1, 1
	BRA         L_get_password18
	NOP
;SmarHomeProject.c,77 :: 		PORTE.RE2 = 0;
	BCF         PORTE+0, 2 
;SmarHomeProject.c,78 :: 		PORTA.RA3 = 0;
	BCF         PORTA+0, 3 
;SmarHomeProject.c,79 :: 		PORTE.RE0 = 0;
	BCF         PORTE+0, 0 
;SmarHomeProject.c,81 :: 		} else {
	GOTO        L_get_password19
L_get_password14:
;SmarHomeProject.c,82 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,83 :: 		Lcd_Out(1, 1, "WRONG PASSWORD");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,84 :: 		password[0] = 0;
	CLRF        _password+0 
;SmarHomeProject.c,85 :: 		password[1] = 0;
	CLRF        _password+1 
;SmarHomeProject.c,86 :: 		password[2] = 0;
	CLRF        _password+2 
;SmarHomeProject.c,87 :: 		password[3] = 0;
	CLRF        _password+3 
;SmarHomeProject.c,88 :: 		password[4] = 0;
	CLRF        _password+4 
;SmarHomeProject.c,89 :: 		PORTE.RE1 = 1;
	BSF         PORTE+0, 1 
;SmarHomeProject.c,90 :: 		delay_ms(400);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_get_password20:
	DECFSZ      R13, 1, 1
	BRA         L_get_password20
	DECFSZ      R12, 1, 1
	BRA         L_get_password20
	DECFSZ      R11, 1, 1
	BRA         L_get_password20
	NOP
;SmarHomeProject.c,91 :: 		PORTE.RE1 = 0;
	BCF         PORTE+0, 1 
;SmarHomeProject.c,93 :: 		b++;
	INFSNZ      _b+0, 1 
	INCF        _b+1, 1 
;SmarHomeProject.c,94 :: 		if (b == 3) {
	MOVLW       0
	XORWF       _b+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__get_password164
	MOVLW       3
	XORWF       _b+0, 0 
L__get_password164:
	BTFSS       STATUS+0, 2 
	GOTO        L_get_password21
;SmarHomeProject.c,95 :: 		goto here;
	GOTO        ___get_password_here
;SmarHomeProject.c,96 :: 		}
L_get_password21:
;SmarHomeProject.c,97 :: 		goto line1;
	GOTO        ___get_password_line1
;SmarHomeProject.c,99 :: 		here:
___get_password_here:
;SmarHomeProject.c,100 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,101 :: 		Lcd_Out(1, 1, "SYSTEM BLOCK");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,102 :: 		Lcd_Out(2, 1, "WAIT 10 SECOND ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,103 :: 		PORTE.RE1 = 1;
	BSF         PORTE+0, 1 
;SmarHomeProject.c,104 :: 		delay_ms(4000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_get_password22:
	DECFSZ      R13, 1, 1
	BRA         L_get_password22
	DECFSZ      R12, 1, 1
	BRA         L_get_password22
	DECFSZ      R11, 1, 1
	BRA         L_get_password22
	NOP
;SmarHomeProject.c,105 :: 		PORTE.RE1 = 0;
	BCF         PORTE+0, 1 
;SmarHomeProject.c,106 :: 		goto line1;
	GOTO        ___get_password_line1
;SmarHomeProject.c,107 :: 		}
L_get_password19:
;SmarHomeProject.c,108 :: 		}
L_end_get_password:
	RETURN      0
; end of _get_password

_interrupt:

;SmarHomeProject.c,111 :: 		void interrupt() {
;SmarHomeProject.c,112 :: 		if (INT0F_bit == 1) {
	BTFSS       INT0F_bit+0, BitPos(INT0F_bit+0) 
	GOTO        L_interrupt23
;SmarHomeProject.c,113 :: 		PORTB.RB1 = 0;    //ALL SYSTEM OFF WITH INTERRUPT
	BCF         PORTB+0, 1 
;SmarHomeProject.c,114 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;SmarHomeProject.c,115 :: 		PORTB.RB3 = 0;
	BCF         PORTB+0, 3 
;SmarHomeProject.c,116 :: 		PORTB.RB4 = 0;
	BCF         PORTB+0, 4 
;SmarHomeProject.c,117 :: 		PORTB.RB5 = 0;
	BCF         PORTB+0, 5 
;SmarHomeProject.c,118 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;SmarHomeProject.c,119 :: 		PORTB.RB7 = 0;
	BCF         PORTB+0, 7 
;SmarHomeProject.c,121 :: 		PORTE.RE0 = 1;
	BSF         PORTE+0, 0 
;SmarHomeProject.c,122 :: 		PORTA.RA3 = 1;
	BSF         PORTA+0, 3 
;SmarHomeProject.c,123 :: 		PORTE.RE2 = 0;
	BCF         PORTE+0, 2 
;SmarHomeProject.c,124 :: 		PORTE.RE1 = 1;
	BSF         PORTE+0, 1 
;SmarHomeProject.c,125 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt24:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt24
	DECFSZ      R12, 1, 1
	BRA         L_interrupt24
	DECFSZ      R11, 1, 1
	BRA         L_interrupt24
;SmarHomeProject.c,126 :: 		PORTE.RE1 = 0;
	BCF         PORTE+0, 1 
;SmarHomeProject.c,127 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt25:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt25
	DECFSZ      R12, 1, 1
	BRA         L_interrupt25
	DECFSZ      R11, 1, 1
	BRA         L_interrupt25
;SmarHomeProject.c,128 :: 		PORTE.RE1 = 1;
	BSF         PORTE+0, 1 
;SmarHomeProject.c,129 :: 		delay_ms(500);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt26:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt26
	DECFSZ      R12, 1, 1
	BRA         L_interrupt26
	DECFSZ      R11, 1, 1
	BRA         L_interrupt26
	NOP
	NOP
;SmarHomeProject.c,130 :: 		PORTE.RE1 = 0;     // DOORS OPEN WITH INTERRUPT
	BCF         PORTE+0, 1 
;SmarHomeProject.c,131 :: 		delay_ms(500);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt27:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt27
	DECFSZ      R12, 1, 1
	BRA         L_interrupt27
	DECFSZ      R11, 1, 1
	BRA         L_interrupt27
	NOP
	NOP
;SmarHomeProject.c,132 :: 		PORTE.RE1 = 0;
	BCF         PORTE+0, 1 
;SmarHomeProject.c,133 :: 		PORTE.RE0 = 0;
	BCF         PORTE+0, 0 
;SmarHomeProject.c,134 :: 		PORTA.RA3 = 0;
	BCF         PORTA+0, 3 
;SmarHomeProject.c,135 :: 		PORTE.RE2 = 0;
	BCF         PORTE+0, 2 
;SmarHomeProject.c,136 :: 		for (k = 0; k < 10; k++) {
	CLRF        _k+0 
	CLRF        _k+1 
L_interrupt28:
	MOVLW       128
	XORWF       _k+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt167
	MOVLW       10
	SUBWF       _k+0, 0 
L__interrupt167:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt29
;SmarHomeProject.c,137 :: 		PORTE.RE1 = 1;
	BSF         PORTE+0, 1 
;SmarHomeProject.c,138 :: 		Delay_ms(300);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_interrupt31:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt31
	DECFSZ      R12, 1, 1
	BRA         L_interrupt31
	DECFSZ      R11, 1, 1
	BRA         L_interrupt31
	NOP
;SmarHomeProject.c,139 :: 		PORTE.RE1 = 0;
	BCF         PORTE+0, 1 
;SmarHomeProject.c,140 :: 		Delay_ms(300);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_interrupt32:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt32
	DECFSZ      R12, 1, 1
	BRA         L_interrupt32
	DECFSZ      R11, 1, 1
	BRA         L_interrupt32
	NOP
;SmarHomeProject.c,136 :: 		for (k = 0; k < 10; k++) {
	INFSNZ      _k+0, 1 
	INCF        _k+1, 1 
;SmarHomeProject.c,141 :: 		}
	GOTO        L_interrupt28
L_interrupt29:
;SmarHomeProject.c,142 :: 		PORTA.RA3 = 0;
	BCF         PORTA+0, 3 
;SmarHomeProject.c,143 :: 		PORTE.RE2 = 1;
	BSF         PORTE+0, 2 
;SmarHomeProject.c,144 :: 		delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_interrupt33:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt33
	DECFSZ      R12, 1, 1
	BRA         L_interrupt33
	DECFSZ      R11, 1, 1
	BRA         L_interrupt33
	NOP
;SmarHomeProject.c,145 :: 		PORTA.RA3 = 0;
	BCF         PORTA+0, 3 
;SmarHomeProject.c,146 :: 		PORTE.RE2 = 0;
	BCF         PORTE+0, 2 
;SmarHomeProject.c,147 :: 		PORTE.RE0 = 0;
	BCF         PORTE+0, 0 
;SmarHomeProject.c,148 :: 		}
L_interrupt23:
;SmarHomeProject.c,149 :: 		INT0F_bit = 0;
	BCF         INT0F_bit+0, BitPos(INT0F_bit+0) 
;SmarHomeProject.c,150 :: 		}
L_end_interrupt:
L__interrupt166:
	RETFIE      1
; end of _interrupt

_clock_signal:

;SmarHomeProject.c,154 :: 		void clock_signal(void) {
;SmarHomeProject.c,155 :: 		CLOCK_pin = 1;
	BSF         RA6_bit+0, BitPos(RA6_bit+0) 
;SmarHomeProject.c,156 :: 		delay_us(500);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_clock_signal34:
	DECFSZ      R13, 1, 1
	BRA         L_clock_signal34
	DECFSZ      R12, 1, 1
	BRA         L_clock_signal34
	NOP
	NOP
;SmarHomeProject.c,157 :: 		CLOCK_pin = 0;
	BCF         RA6_bit+0, BitPos(RA6_bit+0) 
;SmarHomeProject.c,158 :: 		delay_us(500);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_clock_signal35:
	DECFSZ      R13, 1, 1
	BRA         L_clock_signal35
	DECFSZ      R12, 1, 1
	BRA         L_clock_signal35
	NOP
	NOP
;SmarHomeProject.c,159 :: 		}
L_end_clock_signal:
	RETURN      0
; end of _clock_signal

_latch_enable:

;SmarHomeProject.c,161 :: 		void latch_enable(void) {
;SmarHomeProject.c,162 :: 		LATCH_pin = 1;
	BSF         PORTB+0, 7 
;SmarHomeProject.c,163 :: 		delay_us(500);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_latch_enable36:
	DECFSZ      R13, 1, 1
	BRA         L_latch_enable36
	DECFSZ      R12, 1, 1
	BRA         L_latch_enable36
	NOP
	NOP
;SmarHomeProject.c,164 :: 		LATCH_pin = 0;
	BCF         PORTB+0, 7 
;SmarHomeProject.c,165 :: 		}
L_end_latch_enable:
	RETURN      0
; end of _latch_enable

_send_data:

;SmarHomeProject.c,167 :: 		void send_data(unsigned int data_out) {
;SmarHomeProject.c,168 :: 		for (i = 0; i < 8; i++) {
	CLRF        _i+0 
	CLRF        _i+1 
L_send_data37:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__send_data171
	MOVLW       8
	SUBWF       _i+0, 0 
L__send_data171:
	BTFSC       STATUS+0, 0 
	GOTO        L_send_data38
;SmarHomeProject.c,169 :: 		DATA_pin = (data_out >> i) & (0x01);
	MOVF        _i+0, 0 
	MOVWF       R2 
	MOVF        FARG_send_data_data_out+0, 0 
	MOVWF       R0 
	MOVF        FARG_send_data_data_out+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__send_data172:
	BZ          L__send_data173
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	ADDLW       255
	GOTO        L__send_data172
L__send_data173:
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__send_data174
	BCF         RA7_bit+0, BitPos(RA7_bit+0) 
	GOTO        L__send_data175
L__send_data174:
	BSF         RA7_bit+0, BitPos(RA7_bit+0) 
L__send_data175:
;SmarHomeProject.c,170 :: 		clock_signal();
	CALL        _clock_signal+0, 0
;SmarHomeProject.c,168 :: 		for (i = 0; i < 8; i++) {
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;SmarHomeProject.c,171 :: 		}
	GOTO        L_send_data37
L_send_data38:
;SmarHomeProject.c,172 :: 		latch_enable(); // Data finally submitted
	CALL        _latch_enable+0, 0
;SmarHomeProject.c,173 :: 		}
L_end_send_data:
	RETURN      0
; end of _send_data

_main:

;SmarHomeProject.c,175 :: 		void main() {
;SmarHomeProject.c,176 :: 		ANSELA = 0;               //SET all Pins of PORTA digital
	CLRF        ANSELA+0 
;SmarHomeProject.c,177 :: 		ANSELB = 0;               //SET all Pins of PORTB digital
	CLRF        ANSELB+0 
;SmarHomeProject.c,178 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;SmarHomeProject.c,179 :: 		ANSELD = 0;               //SET all Pins of PORTD digital
	CLRF        ANSELD+0 
;SmarHomeProject.c,180 :: 		ANSELE = 0;               //SET all Pins of PORTE digital
	CLRF        ANSELE+0 
;SmarHomeProject.c,182 :: 		TRISA.RA0 = 1;
	BSF         TRISA+0, 0 
;SmarHomeProject.c,183 :: 		TRISA.RA2 = 1;
	BSF         TRISA+0, 2 
;SmarHomeProject.c,184 :: 		TRISA.RA3 = 0;
	BCF         TRISA+0, 3 
;SmarHomeProject.c,185 :: 		TRISA.RA4 = 0;
	BCF         TRISA+0, 4 
;SmarHomeProject.c,186 :: 		TRISC.RC0 = 1;
	BSF         TRISC+0, 0 
;SmarHomeProject.c,187 :: 		TRISA.RA5 = 0;
	BCF         TRISA+0, 5 
;SmarHomeProject.c,188 :: 		TRISA.RA6 = 0;
	BCF         TRISA+0, 6 
;SmarHomeProject.c,189 :: 		TRISA.RA7 = 0;
	BCF         TRISA+0, 7 
;SmarHomeProject.c,190 :: 		TRISC.RC2 = 0;
	BCF         TRISC+0, 2 
;SmarHomeProject.c,193 :: 		TRISB.RB0 = 1;
	BSF         TRISB+0, 0 
;SmarHomeProject.c,194 :: 		INTEDG0_bit = 0;
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;SmarHomeProject.c,195 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;SmarHomeProject.c,196 :: 		INT0IE_bit = 1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;SmarHomeProject.c,197 :: 		GIE_bit = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;SmarHomeProject.c,199 :: 		PWM1_Init(1000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;SmarHomeProject.c,200 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;SmarHomeProject.c,201 :: 		PWM1_Set_Duty(0);
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;SmarHomeProject.c,203 :: 		PWM2_Init(1000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM2_Init+0, 0
;SmarHomeProject.c,204 :: 		PWM2_Start();
	CALL        _PWM2_Start+0, 0
;SmarHomeProject.c,205 :: 		PWM2_Set_Duty(0);
	CLRF        FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;SmarHomeProject.c,207 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;SmarHomeProject.c,209 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;SmarHomeProject.c,210 :: 		TRISE = 0x00;
	CLRF        TRISE+0 
;SmarHomeProject.c,212 :: 		OSCCON = 0x76;
	MOVLW       118
	MOVWF       OSCCON+0 
;SmarHomeProject.c,214 :: 		Lcd_Init();                // Initialize LCD
	CALL        _Lcd_Init+0, 0
;SmarHomeProject.c,215 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,216 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,218 :: 		get_password();
	CALL        _get_password+0, 0
;SmarHomeProject.c,220 :: 		Lcd_Out(1, 3, "Orhan YILDIZ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,221 :: 		Lcd_Out(2, 4, "180403064 ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,222 :: 		Delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main40:
	DECFSZ      R13, 1, 1
	BRA         L_main40
	DECFSZ      R12, 1, 1
	BRA         L_main40
	DECFSZ      R11, 1, 1
	BRA         L_main40
	NOP
;SmarHomeProject.c,224 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,225 :: 		Lcd_Out(1, 2, "SYSTEM READY..");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,226 :: 		Lcd_Out(2, 3, "PLEASE WAIT");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,227 :: 		Delay_ms(500);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 1
	BRA         L_main41
	DECFSZ      R12, 1, 1
	BRA         L_main41
	DECFSZ      R11, 1, 1
	BRA         L_main41
	NOP
	NOP
;SmarHomeProject.c,229 :: 		UART1_Init(9600); // Initialize UART module at 9600 bps
	BSF         BAUDCON+0, 3, 0
	MOVLW       1
	MOVWF       SPBRGH+0 
	MOVLW       160
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;SmarHomeProject.c,230 :: 		Delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 1
	BRA         L_main42
	DECFSZ      R12, 1, 1
	BRA         L_main42
	DECFSZ      R11, 1, 1
	BRA         L_main42
;SmarHomeProject.c,233 :: 		UART1_Write_Text(" WELCOME HOME \r\n ");
	MOVLW       ?lstr12_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,234 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 1
	BRA         L_main43
	DECFSZ      R12, 1, 1
	BRA         L_main43
	DECFSZ      R11, 1, 1
	BRA         L_main43
;SmarHomeProject.c,235 :: 		UART1_Write_Text("SYSTEM READY...\r\n ");
	MOVLW       ?lstr13_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,236 :: 		Delay_ms(400);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 1
	BRA         L_main44
	DECFSZ      R12, 1, 1
	BRA         L_main44
	DECFSZ      R11, 1, 1
	BRA         L_main44
	NOP
;SmarHomeProject.c,238 :: 		UART1_Write_Text("PRESS 0; ALL SYSTEM OFF  \r\n ");
	MOVLW       ?lstr14_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,239 :: 		UART1_Write_Text("PRESS 1; COOLER FAN MANUEL MODE ON \r\n ");
	MOVLW       ?lstr15_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,240 :: 		UART1_Write_Text("PRESS 2; COOLER FAN MANUEL MODE OFF \r\n ");
	MOVLW       ?lstr16_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr16_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,241 :: 		UART1_Write_Text("PRESS 3; HEATER FAN MANUEL MODE ON  \r\n ");
	MOVLW       ?lstr17_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr17_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,242 :: 		UART1_Write_Text("PRESS 4; HEATER FAN MANUEL MODE OFF \r\n ");
	MOVLW       ?lstr18_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr18_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,243 :: 		UART1_Write_Text("PRESS 5; TV ON \r\n ");
	MOVLW       ?lstr19_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr19_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,244 :: 		UART1_Write_Text("PRESS 6; TV OFF \r\n ");
	MOVLW       ?lstr20_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr20_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,245 :: 		UART1_Write_Text("PRESS 7; GARDEN BULBS ON \r\n ");
	MOVLW       ?lstr21_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr21_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,246 :: 		UART1_Write_Text("PRESS 8; GARDEN BULBS OFF \r\n ");
	MOVLW       ?lstr22_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr22_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,247 :: 		UART1_Write_Text("PRESS B; BLINDS ON \r\n ");
	MOVLW       ?lstr23_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr23_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,248 :: 		UART1_Write_Text("PRESS b; BLINDS OFF \r\n ");
	MOVLW       ?lstr24_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr24_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,249 :: 		UART1_Write_Text("PRESS C; FOR TEMPERATURE \r\n ");
	MOVLW       ?lstr25_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr25_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,250 :: 		UART1_Write_Text("PRESS a; KITCHEN LIGHTS ON \r\n ");
	MOVLW       ?lstr26_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr26_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,251 :: 		UART1_Write_Text("PRESS A; KITCHEN LIGHTS OFF \r\n ");
	MOVLW       ?lstr27_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr27_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,253 :: 		UART1_Write_Text("PRESS d; DROOM LIGHTS ON \r\n ");
	MOVLW       ?lstr28_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr28_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,254 :: 		UART1_Write_Text("PRESS D; DROOM LIGHTS OFF \r\n ");
	MOVLW       ?lstr29_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr29_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,256 :: 		UART1_Write_Text("PRESS e; EROOM LIGHTS ON \r\n ");
	MOVLW       ?lstr30_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr30_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,257 :: 		UART1_Write_Text("PRESS E; EROOM LIGHTS OFF \r\n ");
	MOVLW       ?lstr31_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr31_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,259 :: 		UART1_Write_Text("PRESS g; BEDROOM LIGHTS ON \r\n ");
	MOVLW       ?lstr32_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr32_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,260 :: 		UART1_Write_Text("PRESS G; BEDROOM LIGHTS OFF \r\n ");
	MOVLW       ?lstr33_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr33_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,262 :: 		UART1_Write_Text("PRESS i; BATHROOM LIGHTS ON \r\n ");
	MOVLW       ?lstr34_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr34_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,263 :: 		UART1_Write_Text("PRESS I; BATHROOM LIGHTS OFF \r\n ");
	MOVLW       ?lstr35_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr35_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,265 :: 		UART1_Write_Text("PRESS k; CORRIDOR LIGHTS ON \r\n ");
	MOVLW       ?lstr36_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr36_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,266 :: 		UART1_Write_Text("PRESS K; CORRIDOR LIGHTS OFF \r\n ");
	MOVLW       ?lstr37_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr37_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,268 :: 		UART1_Write_Text("PRESS n; CHILDREN'S LIGHTS ON \r\n ");
	MOVLW       ?lstr38_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr38_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,269 :: 		UART1_Write_Text("PRESS N; CHILDREN'S LIGHTS OFF \r\n ");
	MOVLW       ?lstr39_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr39_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,271 :: 		UART1_Write_Text("PRESS o; OROOM LIGHTS ON \r\n ");
	MOVLW       ?lstr40_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr40_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,272 :: 		UART1_Write_Text("PRESS O; OROOM LIGHTS OFF \r\n ");
	MOVLW       ?lstr41_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr41_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,274 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,276 :: 		while (1) {
L_main45:
;SmarHomeProject.c,277 :: 		if (GAS == 1) {
	BTFSS       PORTC+0, 0 
	GOTO        L_main47
;SmarHomeProject.c,278 :: 		Lcd_Out(1, 1, "GAS DETECTED      ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr42_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr42_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,279 :: 		UART1_Write_Text(" GAS DETECTED ALARM ACTIVE \r\n ");
	MOVLW       ?lstr43_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr43_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,280 :: 		PORTB.RB1 = 0;
	BCF         PORTB+0, 1 
;SmarHomeProject.c,281 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;SmarHomeProject.c,282 :: 		PORTB.RB3 = 0;
	BCF         PORTB+0, 3 
;SmarHomeProject.c,283 :: 		PORTB.RB4 = 0;
	BCF         PORTB+0, 4 
;SmarHomeProject.c,284 :: 		PORTB.RB5 = 0;
	BCF         PORTB+0, 5 
;SmarHomeProject.c,285 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;SmarHomeProject.c,286 :: 		PORTB.RB7 = 0;
	BCF         PORTB+0, 7 
;SmarHomeProject.c,287 :: 		Delay_ms(500);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main48:
	DECFSZ      R13, 1, 1
	BRA         L_main48
	DECFSZ      R12, 1, 1
	BRA         L_main48
	DECFSZ      R11, 1, 1
	BRA         L_main48
	NOP
	NOP
;SmarHomeProject.c,288 :: 		} else {
	GOTO        L_main49
L_main47:
;SmarHomeProject.c,289 :: 		Lcd_Out(1, 1, "SYSTEM SAFE      ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr44_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr44_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,290 :: 		}
L_main49:
;SmarHomeProject.c,292 :: 		if (PIR == 1) {
	BTFSS       PORTA+0, 2 
	GOTO        L_main50
;SmarHomeProject.c,293 :: 		Lcd_Out(1, 1, "MOTION DETECTED      ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr45_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr45_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,294 :: 		UART1_Write_Text(" MOTION DETECTED ALARM ACTIVE \r\n ");
	MOVLW       ?lstr46_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr46_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,295 :: 		PORTB.RB4 = 1;
	BSF         PORTB+0, 4 
;SmarHomeProject.c,296 :: 		PORTA.RA3 = 0;
	BCF         PORTA+0, 3 
;SmarHomeProject.c,297 :: 		PORTE.RE2 = 1;
	BSF         PORTE+0, 2 
;SmarHomeProject.c,298 :: 		PORTB.RB5 = 1;
	BSF         PORTB+0, 5 
;SmarHomeProject.c,299 :: 		PORTE.RE1 = 1;
	BSF         PORTE+0, 1 
;SmarHomeProject.c,300 :: 		Delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main51:
	DECFSZ      R13, 1, 1
	BRA         L_main51
	DECFSZ      R12, 1, 1
	BRA         L_main51
	DECFSZ      R11, 1, 1
	BRA         L_main51
	NOP
;SmarHomeProject.c,301 :: 		PORTA.RA3 = 0;
	BCF         PORTA+0, 3 
;SmarHomeProject.c,302 :: 		PORTE.RE2 = 0;
	BCF         PORTE+0, 2 
;SmarHomeProject.c,303 :: 		PORTB.RB5 = 0;
	BCF         PORTB+0, 5 
;SmarHomeProject.c,304 :: 		Delay_ms(2000);
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_main52:
	DECFSZ      R13, 1, 1
	BRA         L_main52
	DECFSZ      R12, 1, 1
	BRA         L_main52
	DECFSZ      R11, 1, 1
	BRA         L_main52
;SmarHomeProject.c,305 :: 		PORTB.RB4 = 0;
	BCF         PORTB+0, 4 
;SmarHomeProject.c,306 :: 		PORTE.RE1 = 0;
	BCF         PORTE+0, 1 
;SmarHomeProject.c,307 :: 		} else {
	GOTO        L_main53
L_main50:
;SmarHomeProject.c,308 :: 		Lcd_Out(1, 1, "SYSTEM SAFE      ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr47_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr47_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,309 :: 		}
L_main53:
;SmarHomeProject.c,310 :: 		Lcd_Chr(2, 12, 223);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       223
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SmarHomeProject.c,311 :: 		Lcd_Chr(2, 13, 'C');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;SmarHomeProject.c,313 :: 		temperature = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temperature+0 
	MOVF        R1, 0 
	MOVWF       _temperature+1 
;SmarHomeProject.c,314 :: 		mV = temperature * 5000.0 / 1024.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       64
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       139
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _mV+0 
	MOVF        R1, 0 
	MOVWF       _mV+1 
	MOVF        R2, 0 
	MOVWF       _mV+2 
	MOVF        R3, 0 
	MOVWF       _mV+3 
;SmarHomeProject.c,315 :: 		mV = mV / 10.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _mV+0 
	MOVF        R1, 0 
	MOVWF       _mV+1 
	MOVF        R2, 0 
	MOVWF       _mV+2 
	MOVF        R3, 0 
	MOVWF       _mV+3 
;SmarHomeProject.c,316 :: 		FloatToStr(mV, txt);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;SmarHomeProject.c,317 :: 		txt[4] = 0;
	CLRF        _txt+4 
;SmarHomeProject.c,318 :: 		Lcd_out(2, 1, tempTxt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _tempTxt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_tempTxt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,319 :: 		Lcd_out(2, 8, txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,320 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main54:
	DECFSZ      R13, 1, 1
	BRA         L_main54
	DECFSZ      R12, 1, 1
	BRA         L_main54
	DECFSZ      R11, 1, 1
	BRA         L_main54
;SmarHomeProject.c,324 :: 		if (mV > 25 && mV < 30) {
	MOVF        _mV+0, 0 
	MOVWF       R4 
	MOVF        _mV+1, 0 
	MOVWF       R5 
	MOVF        _mV+2, 0 
	MOVWF       R6 
	MOVF        _mV+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main57
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        _mV+0, 0 
	MOVWF       R0 
	MOVF        _mV+1, 0 
	MOVWF       R1 
	MOVF        _mV+2, 0 
	MOVWF       R2 
	MOVF        _mV+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main57
L__main160:
;SmarHomeProject.c,325 :: 		PORTB.RB1 = 1;
	BSF         PORTB+0, 1 
;SmarHomeProject.c,326 :: 		dutycycle = 63;
	MOVLW       63
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,327 :: 		PWM1_Set_Duty(dutycycle);
	MOVLW       63
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;SmarHomeProject.c,328 :: 		}
L_main57:
;SmarHomeProject.c,330 :: 		if (mV > 30 && mV < 35) {
	MOVF        _mV+0, 0 
	MOVWF       R4 
	MOVF        _mV+1, 0 
	MOVWF       R5 
	MOVF        _mV+2, 0 
	MOVWF       R6 
	MOVF        _mV+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       112
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main60
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       12
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	MOVF        _mV+0, 0 
	MOVWF       R0 
	MOVF        _mV+1, 0 
	MOVWF       R1 
	MOVF        _mV+2, 0 
	MOVWF       R2 
	MOVF        _mV+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main60
L__main159:
;SmarHomeProject.c,331 :: 		PORTB.RB1 = 1;
	BSF         PORTB+0, 1 
;SmarHomeProject.c,332 :: 		dutycycle = 128;
	MOVLW       128
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,333 :: 		PWM1_Set_Duty(dutycycle);
	MOVLW       128
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;SmarHomeProject.c,334 :: 		}
L_main60:
;SmarHomeProject.c,336 :: 		if (mV > 35 && mV < 60) {
	MOVF        _mV+0, 0 
	MOVWF       R4 
	MOVF        _mV+1, 0 
	MOVWF       R5 
	MOVF        _mV+2, 0 
	MOVWF       R6 
	MOVF        _mV+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       12
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main63
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	MOVF        _mV+0, 0 
	MOVWF       R0 
	MOVF        _mV+1, 0 
	MOVWF       R1 
	MOVF        _mV+2, 0 
	MOVWF       R2 
	MOVF        _mV+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main63
L__main158:
;SmarHomeProject.c,337 :: 		PORTB.RB1 = 1;
	BSF         PORTB+0, 1 
;SmarHomeProject.c,338 :: 		dutycycle = 255;
	MOVLW       255
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,339 :: 		PWM1_Set_Duty(dutycycle);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;SmarHomeProject.c,340 :: 		}
L_main63:
;SmarHomeProject.c,342 :: 		if (mV > 23 && mV < 25) {
	MOVF        _mV+0, 0 
	MOVWF       R4 
	MOVF        _mV+1, 0 
	MOVWF       R5 
	MOVF        _mV+2, 0 
	MOVWF       R6 
	MOVF        _mV+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       56
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main66
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        _mV+0, 0 
	MOVWF       R0 
	MOVF        _mV+1, 0 
	MOVWF       R1 
	MOVF        _mV+2, 0 
	MOVWF       R2 
	MOVF        _mV+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main66
L__main157:
;SmarHomeProject.c,343 :: 		PORTB.RB1 = 0;
	BCF         PORTB+0, 1 
;SmarHomeProject.c,344 :: 		}
L_main66:
;SmarHomeProject.c,347 :: 		if (mV > 10 && mV < 15) {
	MOVF        _mV+0, 0 
	MOVWF       R4 
	MOVF        _mV+1, 0 
	MOVWF       R5 
	MOVF        _mV+2, 0 
	MOVWF       R6 
	MOVF        _mV+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main69
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        _mV+0, 0 
	MOVWF       R0 
	MOVF        _mV+1, 0 
	MOVWF       R1 
	MOVF        _mV+2, 0 
	MOVWF       R2 
	MOVF        _mV+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main69
L__main156:
;SmarHomeProject.c,348 :: 		PORTB.RB2 = 1;
	BSF         PORTB+0, 2 
;SmarHomeProject.c,349 :: 		dutycycle = 63;
	MOVLW       63
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,350 :: 		PWM2_Set_Duty(dutycycle);
	MOVLW       63
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;SmarHomeProject.c,351 :: 		}
L_main69:
;SmarHomeProject.c,353 :: 		if (mV > 5 && mV < 10) {
	MOVF        _mV+0, 0 
	MOVWF       R4 
	MOVF        _mV+1, 0 
	MOVWF       R5 
	MOVF        _mV+2, 0 
	MOVWF       R6 
	MOVF        _mV+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main72
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        _mV+0, 0 
	MOVWF       R0 
	MOVF        _mV+1, 0 
	MOVWF       R1 
	MOVF        _mV+2, 0 
	MOVWF       R2 
	MOVF        _mV+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main72
L__main155:
;SmarHomeProject.c,354 :: 		PORTB.RB2 = 1;
	BSF         PORTB+0, 2 
;SmarHomeProject.c,355 :: 		dutycycle = 128;
	MOVLW       128
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,356 :: 		PWM2_Set_Duty(dutycycle);
	MOVLW       128
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;SmarHomeProject.c,357 :: 		}
L_main72:
;SmarHomeProject.c,359 :: 		if (mV > 1 && mV < 5) {
	MOVF        _mV+0, 0 
	MOVWF       R4 
	MOVF        _mV+1, 0 
	MOVWF       R5 
	MOVF        _mV+2, 0 
	MOVWF       R6 
	MOVF        _mV+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main75
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	MOVF        _mV+0, 0 
	MOVWF       R0 
	MOVF        _mV+1, 0 
	MOVWF       R1 
	MOVF        _mV+2, 0 
	MOVWF       R2 
	MOVF        _mV+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main75
L__main154:
;SmarHomeProject.c,360 :: 		PORTB.RB2 = 1;
	BSF         PORTB+0, 2 
;SmarHomeProject.c,361 :: 		dutycycle = 255;
	MOVLW       255
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,362 :: 		PWM2_Set_Duty(dutycycle);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;SmarHomeProject.c,363 :: 		}
L_main75:
;SmarHomeProject.c,365 :: 		if (mV > 15 && mV < 17) {
	MOVF        _mV+0, 0 
	MOVWF       R4 
	MOVF        _mV+1, 0 
	MOVWF       R5 
	MOVF        _mV+2, 0 
	MOVWF       R6 
	MOVF        _mV+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       112
	MOVWF       R2 
	MOVLW       130
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main78
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       131
	MOVWF       R7 
	MOVF        _mV+0, 0 
	MOVWF       R0 
	MOVF        _mV+1, 0 
	MOVWF       R1 
	MOVF        _mV+2, 0 
	MOVWF       R2 
	MOVF        _mV+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main78
L__main153:
;SmarHomeProject.c,366 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;SmarHomeProject.c,367 :: 		}
L_main78:
;SmarHomeProject.c,370 :: 		if (UART1_Data_Ready()) {
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main79
;SmarHomeProject.c,371 :: 		uart_rd = UART1_READ();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;SmarHomeProject.c,372 :: 		switch (uart_rd) {
	GOTO        L_main80
;SmarHomeProject.c,373 :: 		case '0':
L_main82:
;SmarHomeProject.c,374 :: 		PORTB.RB1 = 0;
	BCF         PORTB+0, 1 
;SmarHomeProject.c,375 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;SmarHomeProject.c,376 :: 		PORTB.RB3 = 0;
	BCF         PORTB+0, 3 
;SmarHomeProject.c,377 :: 		PORTB.RB4 = 0;
	BCF         PORTB+0, 4 
;SmarHomeProject.c,378 :: 		PORTB.RB5 = 0;
	BCF         PORTB+0, 5 
;SmarHomeProject.c,379 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;SmarHomeProject.c,380 :: 		PORTB.RB7 = 0;
	BCF         PORTB+0, 7 
;SmarHomeProject.c,381 :: 		UART1_Write_Text(" ALL SYSTEM OFF \r\n ");
	MOVLW       ?lstr48_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr48_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,382 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,384 :: 		case '1':
L_main83:
;SmarHomeProject.c,385 :: 		Delay_ms(1500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main84:
	DECFSZ      R13, 1, 1
	BRA         L_main84
	DECFSZ      R12, 1, 1
	BRA         L_main84
	DECFSZ      R11, 1, 1
	BRA         L_main84
	NOP
;SmarHomeProject.c,386 :: 		UART1_Write_Text("**CHOOSE COOLER FAN SPEED** \r\n ");
	MOVLW       ?lstr49_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr49_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,387 :: 		UART1_Write_Text("PRESS l; LOW SPEED  \r\n ");
	MOVLW       ?lstr50_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr50_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,388 :: 		UART1_Write_Text("PRESS m; MEDIUM SPEED \r\n ");
	MOVLW       ?lstr51_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr51_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,389 :: 		UART1_Write_Text("PRESS h; HIGH SPEED  \r\n ");
	MOVLW       ?lstr52_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr52_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,390 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,392 :: 		case 'l':
L_main85:
;SmarHomeProject.c,393 :: 		PORTB.RB1 = 1;
	BSF         PORTB+0, 1 
;SmarHomeProject.c,394 :: 		dutycycle = 63;
	MOVLW       63
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,395 :: 		PWM1_Set_Duty(dutycycle);
	MOVLW       63
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;SmarHomeProject.c,396 :: 		UART1_Write_Text("LOW SPEED ACTIVE \r\n ");
	MOVLW       ?lstr53_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr53_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,397 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,399 :: 		case 'm':
L_main86:
;SmarHomeProject.c,400 :: 		PORTB.RB1 = 1;
	BSF         PORTB+0, 1 
;SmarHomeProject.c,401 :: 		dutycycle = 128;
	MOVLW       128
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,402 :: 		PWM1_Set_Duty(dutycycle);
	MOVLW       128
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;SmarHomeProject.c,403 :: 		UART1_Write_Text("MEDIUM SPEED ACTIVE  \r\n ");
	MOVLW       ?lstr54_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr54_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,404 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,406 :: 		case 'h':
L_main87:
;SmarHomeProject.c,407 :: 		PORTB.RB1 = 1;
	BSF         PORTB+0, 1 
;SmarHomeProject.c,408 :: 		dutycycle = 255;
	MOVLW       255
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,409 :: 		PWM1_Set_Duty(dutycycle);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;SmarHomeProject.c,410 :: 		UART1_Write_Text("HIGH SPEED ACTIVE \r\n ");
	MOVLW       ?lstr55_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr55_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,411 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,413 :: 		case '2':
L_main88:
;SmarHomeProject.c,414 :: 		PORTB.RB1 = 0;
	BCF         PORTB+0, 1 
;SmarHomeProject.c,415 :: 		UART1_Write_Text("COOLER FAN OFF \r\n ");
	MOVLW       ?lstr56_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr56_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,416 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,418 :: 		case '3':
L_main89:
;SmarHomeProject.c,419 :: 		UART1_Write_Text("**CHOOSE HEATER FAN SPEED** \r\n ");
	MOVLW       ?lstr57_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr57_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,420 :: 		UART1_Write_Text("PRESS L; LOW SPEED  \r\n ");
	MOVLW       ?lstr58_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr58_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,421 :: 		UART1_Write_Text("PRESS M; MEDIUM SPEED \r\n ");
	MOVLW       ?lstr59_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr59_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,422 :: 		UART1_Write_Text("PRESS H; HIGH SPEED  \r\n ");
	MOVLW       ?lstr60_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr60_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,423 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,425 :: 		case 'L':
L_main90:
;SmarHomeProject.c,426 :: 		PORTB.RB2 = 1;
	BSF         PORTB+0, 2 
;SmarHomeProject.c,427 :: 		dutycycle = 63;
	MOVLW       63
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,428 :: 		PWM2_Set_Duty(dutycycle);
	MOVLW       63
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;SmarHomeProject.c,429 :: 		UART1_Write_Text("LOW SPEED ACTIVE \r\n ");
	MOVLW       ?lstr61_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr61_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,430 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,432 :: 		case 'M':
L_main91:
;SmarHomeProject.c,433 :: 		PORTB.RB2 = 1;
	BSF         PORTB+0, 2 
;SmarHomeProject.c,434 :: 		dutycycle = 128;
	MOVLW       128
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,435 :: 		PWM2_Set_Duty(dutycycle);
	MOVLW       128
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;SmarHomeProject.c,436 :: 		UART1_Write_Text("MEDIUM SPEED ACTIVE  \r\n ");
	MOVLW       ?lstr62_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr62_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,437 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,439 :: 		case 'H':
L_main92:
;SmarHomeProject.c,440 :: 		PORTB.RB2 = 1;
	BSF         PORTB+0, 2 
;SmarHomeProject.c,441 :: 		dutycycle = 255;
	MOVLW       255
	MOVWF       _dutycycle+0 
;SmarHomeProject.c,442 :: 		PWM2_Set_Duty(dutycycle);
	MOVLW       255
	MOVWF       FARG_PWM2_Set_Duty_new_duty+0 
	CALL        _PWM2_Set_Duty+0, 0
;SmarHomeProject.c,443 :: 		UART1_Write_Text("HIGH SPEED ACTIVE \r\n ");
	MOVLW       ?lstr63_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr63_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,444 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,446 :: 		case '4':
L_main93:
;SmarHomeProject.c,447 :: 		PORTB.RB2 = 0;
	BCF         PORTB+0, 2 
;SmarHomeProject.c,448 :: 		UART1_Write_Text("HEATER FAN OFF \r\n ");
	MOVLW       ?lstr64_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr64_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,449 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,451 :: 		case '5':
L_main94:
;SmarHomeProject.c,452 :: 		PORTB.RB3 = 1;
	BSF         PORTB+0, 3 
;SmarHomeProject.c,453 :: 		UART1_Write_Text(" TV ON \r\n ");
	MOVLW       ?lstr65_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr65_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,454 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,456 :: 		case '6':
L_main95:
;SmarHomeProject.c,457 :: 		PORTB.RB3 = 0;
	BCF         PORTB+0, 3 
;SmarHomeProject.c,458 :: 		UART1_Write_Text("TV OFF \r\n ");
	MOVLW       ?lstr66_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr66_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,459 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,461 :: 		case '7':
L_main96:
;SmarHomeProject.c,462 :: 		PORTB.RB4 = 1;
	BSF         PORTB+0, 4 
;SmarHomeProject.c,463 :: 		UART1_Write_Text("GARDEN BULBS ON \r\n ");
	MOVLW       ?lstr67_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr67_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,464 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,466 :: 		case '8':
L_main97:
;SmarHomeProject.c,467 :: 		PORTB.RB4 = 0;
	BCF         PORTB+0, 4 
;SmarHomeProject.c,468 :: 		UART1_Write_Text("GARDEN BULBS OFF \r\n ");
	MOVLW       ?lstr68_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr68_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,469 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,471 :: 		case 'C':
L_main98:
;SmarHomeProject.c,472 :: 		UART1_Write_Text(" TEMPERATURE = ");
	MOVLW       ?lstr69_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr69_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,473 :: 		UART1_Write_Text(txt);
	MOVLW       _txt+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,474 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,476 :: 		case 'B':
L_main99:
;SmarHomeProject.c,477 :: 		PORTE.RE0 = 1;
	BSF         PORTE+0, 0 
;SmarHomeProject.c,478 :: 		UART1_Write_Text("BLINDS ON\r\n ");
	MOVLW       ?lstr70_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr70_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,479 :: 		Delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main100:
	DECFSZ      R13, 1, 1
	BRA         L_main100
	DECFSZ      R12, 1, 1
	BRA         L_main100
	DECFSZ      R11, 1, 1
	BRA         L_main100
	NOP
;SmarHomeProject.c,480 :: 		PORTE.RE0 = 0;
	BCF         PORTE+0, 0 
;SmarHomeProject.c,481 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,483 :: 		case 'b':
L_main101:
;SmarHomeProject.c,484 :: 		PORTB.RB5 = 1;
	BSF         PORTB+0, 5 
;SmarHomeProject.c,485 :: 		UART1_Write_Text("BLINDS OFF\r\n ");
	MOVLW       ?lstr71_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr71_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,486 :: 		Delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main102:
	DECFSZ      R13, 1, 1
	BRA         L_main102
	DECFSZ      R12, 1, 1
	BRA         L_main102
	DECFSZ      R11, 1, 1
	BRA         L_main102
	NOP
;SmarHomeProject.c,487 :: 		PORTB.RB5 = 0;
	BCF         PORTB+0, 5 
;SmarHomeProject.c,488 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,490 :: 		case 'c':
L_main103:
;SmarHomeProject.c,491 :: 		PORTB.RB6 = 1;
	BSF         PORTB+0, 6 
;SmarHomeProject.c,492 :: 		UART1_Write_Text("COFFEE MACHINE ON\r\n ");
	MOVLW       ?lstr72_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr72_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,493 :: 		Delay_ms(4000);
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main104:
	DECFSZ      R13, 1, 1
	BRA         L_main104
	DECFSZ      R12, 1, 1
	BRA         L_main104
	DECFSZ      R11, 1, 1
	BRA         L_main104
	NOP
;SmarHomeProject.c,494 :: 		PORTB.RB6 = 0;
	BCF         PORTB+0, 6 
;SmarHomeProject.c,495 :: 		UART1_Write_Text("YOUR COFFEE IS READY ");
	MOVLW       ?lstr73_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr73_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,496 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,498 :: 		case 'a':
L_main105:
;SmarHomeProject.c,499 :: 		hexVal = hexVal | 0b00000010;
	MOVLW       2
	IORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,500 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,501 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main106:
	DECFSZ      R13, 1, 1
	BRA         L_main106
	DECFSZ      R12, 1, 1
	BRA         L_main106
	DECFSZ      R11, 1, 1
	BRA         L_main106
;SmarHomeProject.c,502 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,503 :: 		Lcd_Out(2, 1, "Kitchen Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr74_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr74_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,504 :: 		Lcd_Out(2, 18, "ON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr75_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr75_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,505 :: 		UART1_Write_Text("Kitchen Light ON\r\n ");
	MOVLW       ?lstr76_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr76_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,506 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main107:
	DECFSZ      R13, 1, 1
	BRA         L_main107
	DECFSZ      R12, 1, 1
	BRA         L_main107
	DECFSZ      R11, 1, 1
	BRA         L_main107
;SmarHomeProject.c,507 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,508 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,510 :: 		case 'A':
L_main108:
;SmarHomeProject.c,511 :: 		hexVal = hexVal ^ 0b00000010;
	MOVLW       2
	XORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,512 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,513 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main109:
	DECFSZ      R13, 1, 1
	BRA         L_main109
	DECFSZ      R12, 1, 1
	BRA         L_main109
	DECFSZ      R11, 1, 1
	BRA         L_main109
;SmarHomeProject.c,514 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,515 :: 		Lcd_Out(2, 1, "Kitchen Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr77_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr77_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,516 :: 		Lcd_Out(2, 18, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr78_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr78_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,517 :: 		UART1_Write_Text("Kitchen Light OFF\r\n ");
	MOVLW       ?lstr79_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr79_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,518 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main110:
	DECFSZ      R13, 1, 1
	BRA         L_main110
	DECFSZ      R12, 1, 1
	BRA         L_main110
	DECFSZ      R11, 1, 1
	BRA         L_main110
;SmarHomeProject.c,519 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,520 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,522 :: 		case 'd':
L_main111:
;SmarHomeProject.c,523 :: 		hexVal = hexVal | 0b00100000;
	MOVLW       32
	IORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,524 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,525 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main112:
	DECFSZ      R13, 1, 1
	BRA         L_main112
	DECFSZ      R12, 1, 1
	BRA         L_main112
	DECFSZ      R11, 1, 1
	BRA         L_main112
;SmarHomeProject.c,526 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,527 :: 		Lcd_Out(2, 1, "Room Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr80_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr80_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,528 :: 		Lcd_Out(2, 18, "ON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr81_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr81_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,529 :: 		UART1_Write_Text("DRoom Light ON\r\n ");
	MOVLW       ?lstr82_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr82_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,530 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main113:
	DECFSZ      R13, 1, 1
	BRA         L_main113
	DECFSZ      R12, 1, 1
	BRA         L_main113
	DECFSZ      R11, 1, 1
	BRA         L_main113
;SmarHomeProject.c,531 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,532 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,534 :: 		case 'D':
L_main114:
;SmarHomeProject.c,535 :: 		hexVal = hexVal ^ 0b00100000;
	MOVLW       32
	XORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,536 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,537 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main115:
	DECFSZ      R13, 1, 1
	BRA         L_main115
	DECFSZ      R12, 1, 1
	BRA         L_main115
	DECFSZ      R11, 1, 1
	BRA         L_main115
;SmarHomeProject.c,538 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,539 :: 		Lcd_Out(2, 1, "Room Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr83_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr83_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,540 :: 		Lcd_Out(2, 18, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr84_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr84_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,541 :: 		UART1_Write_Text("DRoom Light OFF\r\n ");
	MOVLW       ?lstr85_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr85_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,542 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main116:
	DECFSZ      R13, 1, 1
	BRA         L_main116
	DECFSZ      R12, 1, 1
	BRA         L_main116
	DECFSZ      R11, 1, 1
	BRA         L_main116
;SmarHomeProject.c,543 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,544 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,546 :: 		case 'e':
L_main117:
;SmarHomeProject.c,547 :: 		hexVal = hexVal | 0b00010000;
	MOVLW       16
	IORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,548 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,549 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main118:
	DECFSZ      R13, 1, 1
	BRA         L_main118
	DECFSZ      R12, 1, 1
	BRA         L_main118
	DECFSZ      R11, 1, 1
	BRA         L_main118
;SmarHomeProject.c,550 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,551 :: 		Lcd_Out(2, 1, "Room Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr86_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr86_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,552 :: 		Lcd_Out(2, 18, "ON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr87_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr87_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,553 :: 		UART1_Write_Text("ERoom Light ON\r\n ");
	MOVLW       ?lstr88_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr88_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,554 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main119:
	DECFSZ      R13, 1, 1
	BRA         L_main119
	DECFSZ      R12, 1, 1
	BRA         L_main119
	DECFSZ      R11, 1, 1
	BRA         L_main119
;SmarHomeProject.c,555 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,556 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,558 :: 		case 'E':
L_main120:
;SmarHomeProject.c,559 :: 		hexVal = hexVal ^ 0b00010000;
	MOVLW       16
	XORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,560 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,561 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main121:
	DECFSZ      R13, 1, 1
	BRA         L_main121
	DECFSZ      R12, 1, 1
	BRA         L_main121
	DECFSZ      R11, 1, 1
	BRA         L_main121
;SmarHomeProject.c,562 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,563 :: 		Lcd_Out(2, 1, "Room Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr89_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr89_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,564 :: 		Lcd_Out(2, 18, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr90_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr90_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,565 :: 		UART1_Write_Text("ERoom Light OFF\r\n ");
	MOVLW       ?lstr91_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr91_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,566 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main122:
	DECFSZ      R13, 1, 1
	BRA         L_main122
	DECFSZ      R12, 1, 1
	BRA         L_main122
	DECFSZ      R11, 1, 1
	BRA         L_main122
;SmarHomeProject.c,567 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,568 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,570 :: 		case 'g':
L_main123:
;SmarHomeProject.c,571 :: 		hexVal = hexVal | 0b10000000;
	MOVLW       128
	IORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,572 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,573 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main124:
	DECFSZ      R13, 1, 1
	BRA         L_main124
	DECFSZ      R12, 1, 1
	BRA         L_main124
	DECFSZ      R11, 1, 1
	BRA         L_main124
;SmarHomeProject.c,574 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,575 :: 		Lcd_Out(2, 1, "Bedroom Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr92_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr92_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,576 :: 		Lcd_Out(2, 18, "ON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr93_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr93_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,577 :: 		UART1_Write_Text("Bedroom Light ON\r\n ");
	MOVLW       ?lstr94_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr94_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,578 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main125:
	DECFSZ      R13, 1, 1
	BRA         L_main125
	DECFSZ      R12, 1, 1
	BRA         L_main125
	DECFSZ      R11, 1, 1
	BRA         L_main125
;SmarHomeProject.c,579 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,580 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,582 :: 		case 'G':
L_main126:
;SmarHomeProject.c,583 :: 		hexVal = hexVal ^ 0b10000000;
	MOVLW       128
	XORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,584 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,585 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main127:
	DECFSZ      R13, 1, 1
	BRA         L_main127
	DECFSZ      R12, 1, 1
	BRA         L_main127
	DECFSZ      R11, 1, 1
	BRA         L_main127
;SmarHomeProject.c,586 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,587 :: 		Lcd_Out(2, 1, "Bedroom Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr95_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr95_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,588 :: 		Lcd_Out(2, 18, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr96_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr96_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,589 :: 		UART1_Write_Text("Bedroom Light OFF\r\n ");
	MOVLW       ?lstr97_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr97_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,590 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main128:
	DECFSZ      R13, 1, 1
	BRA         L_main128
	DECFSZ      R12, 1, 1
	BRA         L_main128
	DECFSZ      R11, 1, 1
	BRA         L_main128
;SmarHomeProject.c,591 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,592 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,594 :: 		case 'i':
L_main129:
;SmarHomeProject.c,595 :: 		hexVal = hexVal | 0b01000000;
	MOVLW       64
	IORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,596 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,597 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main130:
	DECFSZ      R13, 1, 1
	BRA         L_main130
	DECFSZ      R12, 1, 1
	BRA         L_main130
	DECFSZ      R11, 1, 1
	BRA         L_main130
;SmarHomeProject.c,598 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,599 :: 		Lcd_Out(2, 1, "Bathroom Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr98_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr98_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,600 :: 		Lcd_Out(2, 18, "ON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr99_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr99_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,601 :: 		UART1_Write_Text("Bathroom Light ON\r\n ");
	MOVLW       ?lstr100_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr100_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,602 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main131:
	DECFSZ      R13, 1, 1
	BRA         L_main131
	DECFSZ      R12, 1, 1
	BRA         L_main131
	DECFSZ      R11, 1, 1
	BRA         L_main131
;SmarHomeProject.c,603 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,604 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,606 :: 		case 'I':
L_main132:
;SmarHomeProject.c,607 :: 		hexVal = hexVal ^ 0b01000000;
	MOVLW       64
	XORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,608 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,609 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main133:
	DECFSZ      R13, 1, 1
	BRA         L_main133
	DECFSZ      R12, 1, 1
	BRA         L_main133
	DECFSZ      R11, 1, 1
	BRA         L_main133
;SmarHomeProject.c,610 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,611 :: 		Lcd_Out(2, 1, "Bathroom Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr101_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr101_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,612 :: 		Lcd_Out(2, 18, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr102_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr102_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,613 :: 		UART1_Write_Text("Bathroom Light OFF\r\n ");
	MOVLW       ?lstr103_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr103_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,614 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main134:
	DECFSZ      R13, 1, 1
	BRA         L_main134
	DECFSZ      R12, 1, 1
	BRA         L_main134
	DECFSZ      R11, 1, 1
	BRA         L_main134
;SmarHomeProject.c,615 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,616 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,618 :: 		case 'k':
L_main135:
;SmarHomeProject.c,619 :: 		hexVal = hexVal | 0b00001000;
	MOVLW       8
	IORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,620 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,621 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main136:
	DECFSZ      R13, 1, 1
	BRA         L_main136
	DECFSZ      R12, 1, 1
	BRA         L_main136
	DECFSZ      R11, 1, 1
	BRA         L_main136
;SmarHomeProject.c,622 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,625 :: 		Lcd_Out(2, 1, "Corridor Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr104_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr104_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,626 :: 		Lcd_Out(2, 18, "ON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr105_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr105_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,627 :: 		UART1_Write_Text("Corridor Light ON\r\n ");
	MOVLW       ?lstr106_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr106_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,628 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main137:
	DECFSZ      R13, 1, 1
	BRA         L_main137
	DECFSZ      R12, 1, 1
	BRA         L_main137
	DECFSZ      R11, 1, 1
	BRA         L_main137
;SmarHomeProject.c,629 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,630 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,632 :: 		case 'K':
L_main138:
;SmarHomeProject.c,633 :: 		hexVal = hexVal ^ 0b00001000;
	MOVLW       8
	XORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,634 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,635 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main139:
	DECFSZ      R13, 1, 1
	BRA         L_main139
	DECFSZ      R12, 1, 1
	BRA         L_main139
	DECFSZ      R11, 1, 1
	BRA         L_main139
;SmarHomeProject.c,636 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,637 :: 		Lcd_Out(2, 1, "Corridor Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr107_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr107_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,638 :: 		Lcd_Out(2, 18, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr108_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr108_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,639 :: 		UART1_Write_Text("Corridor Light OFF\r\n ");
	MOVLW       ?lstr109_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr109_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,640 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main140:
	DECFSZ      R13, 1, 1
	BRA         L_main140
	DECFSZ      R12, 1, 1
	BRA         L_main140
	DECFSZ      R11, 1, 1
	BRA         L_main140
;SmarHomeProject.c,641 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,642 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,644 :: 		case 'n':
L_main141:
;SmarHomeProject.c,645 :: 		hexVal = hexVal | 0b00000100;
	MOVLW       4
	IORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,646 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,647 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main142:
	DECFSZ      R13, 1, 1
	BRA         L_main142
	DECFSZ      R12, 1, 1
	BRA         L_main142
	DECFSZ      R11, 1, 1
	BRA         L_main142
;SmarHomeProject.c,648 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,649 :: 		Lcd_Out(2, 1, "Children's Room ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr110_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr110_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,650 :: 		Lcd_Out(3, 1, "Light ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr111_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr111_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,651 :: 		Lcd_Out(2, 18, "ON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr112_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr112_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,652 :: 		UART1_Write_Text("Children's Light ON\r\n ");
	MOVLW       ?lstr113_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr113_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,653 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main143:
	DECFSZ      R13, 1, 1
	BRA         L_main143
	DECFSZ      R12, 1, 1
	BRA         L_main143
	DECFSZ      R11, 1, 1
	BRA         L_main143
;SmarHomeProject.c,654 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,655 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,657 :: 		case 'N':
L_main144:
;SmarHomeProject.c,658 :: 		hexVal = hexVal ^ 0b00000100;
	MOVLW       4
	XORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,659 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,660 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main145:
	DECFSZ      R13, 1, 1
	BRA         L_main145
	DECFSZ      R12, 1, 1
	BRA         L_main145
	DECFSZ      R11, 1, 1
	BRA         L_main145
;SmarHomeProject.c,661 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,662 :: 		Lcd_Out(2, 1, "Children's Room ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr114_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr114_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,663 :: 		Lcd_Out(3, 1, "Light ");
	MOVLW       3
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr115_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr115_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,664 :: 		Lcd_Out(2, 18, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr116_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr116_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,665 :: 		UART1_Write_Text("Children's Light OFF\r\n ");
	MOVLW       ?lstr117_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr117_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,666 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main146:
	DECFSZ      R13, 1, 1
	BRA         L_main146
	DECFSZ      R12, 1, 1
	BRA         L_main146
	DECFSZ      R11, 1, 1
	BRA         L_main146
;SmarHomeProject.c,667 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,668 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,670 :: 		case 'o':
L_main147:
;SmarHomeProject.c,671 :: 		hexVal = hexVal | 0b00000001;
	MOVLW       1
	IORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,672 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,673 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main148:
	DECFSZ      R13, 1, 1
	BRA         L_main148
	DECFSZ      R12, 1, 1
	BRA         L_main148
	DECFSZ      R11, 1, 1
	BRA         L_main148
;SmarHomeProject.c,674 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,675 :: 		Lcd_Out(2, 1, "Room Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr118_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr118_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,676 :: 		Lcd_Out(2, 18, "ON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr119_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr119_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,677 :: 		UART1_Write_Text("Oroom Light ON\r\n ");
	MOVLW       ?lstr120_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr120_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,678 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main149:
	DECFSZ      R13, 1, 1
	BRA         L_main149
	DECFSZ      R12, 1, 1
	BRA         L_main149
	DECFSZ      R11, 1, 1
	BRA         L_main149
;SmarHomeProject.c,679 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,680 :: 		break;
	GOTO        L_main81
;SmarHomeProject.c,681 :: 		case 'O':
L_main150:
;SmarHomeProject.c,682 :: 		hexVal = hexVal ^ 0b00000001;
	MOVLW       1
	XORWF       _hexVal+0, 0 
	MOVWF       R0 
	MOVF        _hexVal+1, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _hexVal+0 
	MOVF        R1, 0 
	MOVWF       _hexVal+1 
;SmarHomeProject.c,683 :: 		send_data(hexVal);
	MOVF        R0, 0 
	MOVWF       FARG_send_data_data_out+0 
	MOVF        R1, 0 
	MOVWF       FARG_send_data_data_out+1 
	CALL        _send_data+0, 0
;SmarHomeProject.c,684 :: 		delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main151:
	DECFSZ      R13, 1, 1
	BRA         L_main151
	DECFSZ      R12, 1, 1
	BRA         L_main151
	DECFSZ      R11, 1, 1
	BRA         L_main151
;SmarHomeProject.c,685 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,686 :: 		Lcd_Out(2, 1, "Room Light: ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr121_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr121_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,687 :: 		Lcd_Out(2, 18, "OFF");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr122_SmarHomeProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr122_SmarHomeProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;SmarHomeProject.c,688 :: 		UART1_Write_Text("Oroom Light OFF\r\n ");
	MOVLW       ?lstr123_SmarHomeProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr123_SmarHomeProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;SmarHomeProject.c,689 :: 		Delay_ms(200);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main152:
	DECFSZ      R13, 1, 1
	BRA         L_main152
	DECFSZ      R12, 1, 1
	BRA         L_main152
	DECFSZ      R11, 1, 1
	BRA         L_main152
;SmarHomeProject.c,690 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;SmarHomeProject.c,691 :: 		}
	GOTO        L_main81
L_main80:
	MOVF        _uart_rd+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_main82
	MOVF        _uart_rd+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_main83
	MOVF        _uart_rd+0, 0 
	XORLW       108
	BTFSC       STATUS+0, 2 
	GOTO        L_main85
	MOVF        _uart_rd+0, 0 
	XORLW       109
	BTFSC       STATUS+0, 2 
	GOTO        L_main86
	MOVF        _uart_rd+0, 0 
	XORLW       104
	BTFSC       STATUS+0, 2 
	GOTO        L_main87
	MOVF        _uart_rd+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main88
	MOVF        _uart_rd+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main89
	MOVF        _uart_rd+0, 0 
	XORLW       76
	BTFSC       STATUS+0, 2 
	GOTO        L_main90
	MOVF        _uart_rd+0, 0 
	XORLW       77
	BTFSC       STATUS+0, 2 
	GOTO        L_main91
	MOVF        _uart_rd+0, 0 
	XORLW       72
	BTFSC       STATUS+0, 2 
	GOTO        L_main92
	MOVF        _uart_rd+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_main93
	MOVF        _uart_rd+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_main94
	MOVF        _uart_rd+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_main95
	MOVF        _uart_rd+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_main96
	MOVF        _uart_rd+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_main97
	MOVF        _uart_rd+0, 0 
	XORLW       67
	BTFSC       STATUS+0, 2 
	GOTO        L_main98
	MOVF        _uart_rd+0, 0 
	XORLW       66
	BTFSC       STATUS+0, 2 
	GOTO        L_main99
	MOVF        _uart_rd+0, 0 
	XORLW       98
	BTFSC       STATUS+0, 2 
	GOTO        L_main101
	MOVF        _uart_rd+0, 0 
	XORLW       99
	BTFSC       STATUS+0, 2 
	GOTO        L_main103
	MOVF        _uart_rd+0, 0 
	XORLW       97
	BTFSC       STATUS+0, 2 
	GOTO        L_main105
	MOVF        _uart_rd+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_main108
	MOVF        _uart_rd+0, 0 
	XORLW       100
	BTFSC       STATUS+0, 2 
	GOTO        L_main111
	MOVF        _uart_rd+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L_main114
	MOVF        _uart_rd+0, 0 
	XORLW       101
	BTFSC       STATUS+0, 2 
	GOTO        L_main117
	MOVF        _uart_rd+0, 0 
	XORLW       69
	BTFSC       STATUS+0, 2 
	GOTO        L_main120
	MOVF        _uart_rd+0, 0 
	XORLW       103
	BTFSC       STATUS+0, 2 
	GOTO        L_main123
	MOVF        _uart_rd+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_main126
	MOVF        _uart_rd+0, 0 
	XORLW       105
	BTFSC       STATUS+0, 2 
	GOTO        L_main129
	MOVF        _uart_rd+0, 0 
	XORLW       73
	BTFSC       STATUS+0, 2 
	GOTO        L_main132
	MOVF        _uart_rd+0, 0 
	XORLW       107
	BTFSC       STATUS+0, 2 
	GOTO        L_main135
	MOVF        _uart_rd+0, 0 
	XORLW       75
	BTFSC       STATUS+0, 2 
	GOTO        L_main138
	MOVF        _uart_rd+0, 0 
	XORLW       110
	BTFSC       STATUS+0, 2 
	GOTO        L_main141
	MOVF        _uart_rd+0, 0 
	XORLW       78
	BTFSC       STATUS+0, 2 
	GOTO        L_main144
	MOVF        _uart_rd+0, 0 
	XORLW       111
	BTFSC       STATUS+0, 2 
	GOTO        L_main147
	MOVF        _uart_rd+0, 0 
	XORLW       79
	BTFSC       STATUS+0, 2 
	GOTO        L_main150
L_main81:
;SmarHomeProject.c,692 :: 		}
L_main79:
;SmarHomeProject.c,693 :: 		}
	GOTO        L_main45
;SmarHomeProject.c,694 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
