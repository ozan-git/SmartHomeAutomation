#line 1 "G:/My Drive/6_Term/Microprocessors/MPPROJECT/180403064_SmartHome_Project/SmartHomeProject/SmarHomeProject.c"
sbit LCD_EN at RA5_bit;
sbit LCD_RS at RA4_bit;
sbit LCD_D4 at RC3_bit;
sbit LCD_D5 at RC4_bit;
sbit LCD_D6 at RC5_bit;
sbit LCD_D7 at RA1_bit;

sbit LCD_EN_Direction at TRISA5_bit;
sbit LCD_RS_Direction at TRISA4_bit;
sbit LCD_D4_Direction at TRISC3_bit;
sbit LCD_D5_Direction at TRISC4_bit;
sbit LCD_D6_Direction at TRISC5_bit;
sbit LCD_D7_Direction at TRISA1_bit;




sbit DATA_pin at RA7_bit;
sbit LATCH_pin at PORTB.B7;
sbit CLOCK_pin at RA6_bit;

char keypadPort at PORTD;
int i, b, k;
char password[5];
unsigned char tempTxt[22] = "TEMP = ";
unsigned int hexVal;

char uart_rd;

unsigned int temperature = 0;
float mV;
unsigned char txt[15];

char dutycycle = 0;

char get_password() {
 line1:
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "ENTER PASSWORD");

 for (i = 0; i < 4; i++) {
 while (password[i] == 0) {
 password[i] = Keypad_Key_Click();
 }
 if (password[i] == 1) password[i] = '7';
 if (password[i] == 2) password[i] = '8';
 if (password[i] == 3) password[i] = '9';
 if (password[i] == 5) password[i] = '4';
 if (password[i] == 6) password[i] = '5';
 if (password[i] == 7) password[i] = '6';
 if (password[i] == 9) password[i] = '1';
 if (password[i] == 10) password[i] = '2';
 if (password[i] == 11) password[i] = '3';

 Lcd_Chr(2, i + 1, '*');
 }

 if (strcmp(password, "1925") == 0) {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 5, "WELCOME");
 Lcd_Out(2, 4, "SMART HOME");
 delay_ms(200);

 PORTA.RA3 = 1;
 PORTE.RE2 = 0;
 PORTE.RE0 = 1;
 delay_ms(1000);

 PORTA.RA3 = 0;
 PORTE.RE2 = 0;
 delay_ms(1000);

 PORTA.RA3 = 0;
 PORTE.RE2 = 1;
 delay_ms(1000);

 PORTE.RE2 = 0;
 PORTA.RA3 = 0;
 PORTE.RE0 = 0;

 } else {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "WRONG PASSWORD");
 password[0] = 0;
 password[1] = 0;
 password[2] = 0;
 password[3] = 0;
 password[4] = 0;
 PORTE.RE1 = 1;
 delay_ms(400);
 PORTE.RE1 = 0;
 b == 0;
 b++;
 if (b == 3) {
 goto here;
 }
 goto line1;

 here:
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "SYSTEM BLOCK");
 Lcd_Out(2, 1, "WAIT 10 SECOND ");
 PORTE.RE1 = 1;
 delay_ms(4000);
 PORTE.RE1 = 0;
 goto line1;
 }
}


void interrupt() {
 if (INT0F_bit == 1) {
 PORTB.RB1 = 0;
 PORTB.RB2 = 0;
 PORTB.RB3 = 0;
 PORTB.RB4 = 0;
 PORTB.RB5 = 0;
 PORTB.RB6 = 0;
 PORTB.RB7 = 0;

 PORTE.RE0 = 1;
 PORTA.RA3 = 1;
 PORTE.RE2 = 0;
 PORTE.RE1 = 1;
 delay_ms(200);
 PORTE.RE1 = 0;
 delay_ms(200);
 PORTE.RE1 = 1;
 delay_ms(500);
 PORTE.RE1 = 0;
 delay_ms(500);
 PORTE.RE1 = 0;
 PORTE.RE0 = 0;
 PORTA.RA3 = 0;
 PORTE.RE2 = 0;
 for (k = 0; k < 10; k++) {
 PORTE.RE1 = 1;
 Delay_ms(300);
 PORTE.RE1 = 0;
 Delay_ms(300);
 }
 PORTA.RA3 = 0;
 PORTE.RE2 = 1;
 delay_ms(1000);
 PORTA.RA3 = 0;
 PORTE.RE2 = 0;
 PORTE.RE0 = 0;
 }
 INT0F_bit = 0;
}



void clock_signal(void) {
 CLOCK_pin = 1;
 delay_us(500);
 CLOCK_pin = 0;
 delay_us(500);
}

void latch_enable(void) {
 LATCH_pin = 1;
 delay_us(500);
 LATCH_pin = 0;
}

void send_data(unsigned int data_out) {
 for (i = 0; i < 8; i++) {
 DATA_pin = (data_out >> i) & (0x01);
 clock_signal();
 }
 latch_enable();
}

void main() {
 ANSELA = 0;
 ANSELB = 0;
 ANSELC = 0;
 ANSELD = 0;
 ANSELE = 0;

 TRISA.RA0 = 1;
 TRISA.RA2 = 1;
 TRISA.RA3 = 0;
 TRISA.RA4 = 0;
 TRISC.RC0 = 1;
 TRISA.RA5 = 0;
 TRISA.RA6 = 0;
 TRISA.RA7 = 0;
 TRISC.RC2 = 0;


 TRISB.RB0 = 1;
 INTEDG0_bit = 0;
 INT0IF_bit = 0;
 INT0IE_bit = 1;
 GIE_bit = 1;

 PWM1_Init(1000);
 PWM1_Start();
 PWM1_Set_Duty(0);

 PWM2_Init(1000);
 PWM2_Start();
 PWM2_Set_Duty(0);

 ADC_Init();

 TRISB = 0x00;
 TRISE = 0x00;

 OSCCON = 0x76;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 get_password();

 Lcd_Out(1, 3, "Orhan YILDIZ");
 Lcd_Out(2, 4, "180403064 ");
 Delay_ms(1000);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 2, "SYSTEM READY..");
 Lcd_Out(2, 3, "PLEASE WAIT");
 Delay_ms(500);

 UART1_Init(9600);
 Delay_ms(100);


 UART1_Write_Text(" WELCOME HOME \r\n ");
 Delay_ms(200);
 UART1_Write_Text("SYSTEM READY...\r\n ");
 Delay_ms(400);

 UART1_Write_Text("PRESS 0; ALL SYSTEM OFF  \r\n ");
 UART1_Write_Text("PRESS 1; COOLER FAN MANUEL MODE ON \r\n ");
 UART1_Write_Text("PRESS 2; COOLER FAN MANUEL MODE OFF \r\n ");
 UART1_Write_Text("PRESS 3; HEATER FAN MANUEL MODE ON  \r\n ");
 UART1_Write_Text("PRESS 4; HEATER FAN MANUEL MODE OFF \r\n ");
 UART1_Write_Text("PRESS 5; TV ON \r\n ");
 UART1_Write_Text("PRESS 6; TV OFF \r\n ");
 UART1_Write_Text("PRESS 7; GARDEN BULBS ON \r\n ");
 UART1_Write_Text("PRESS 8; GARDEN BULBS OFF \r\n ");
 UART1_Write_Text("PRESS B; BLINDS ON \r\n ");
 UART1_Write_Text("PRESS b; BLINDS OFF \r\n ");
 UART1_Write_Text("PRESS C; FOR TEMPERATURE \r\n ");
 UART1_Write_Text("PRESS a; KITCHEN LIGHTS ON \r\n ");
 UART1_Write_Text("PRESS A; KITCHEN LIGHTS OFF \r\n ");

 UART1_Write_Text("PRESS d; DROOM LIGHTS ON \r\n ");
 UART1_Write_Text("PRESS D; DROOM LIGHTS OFF \r\n ");

 UART1_Write_Text("PRESS e; EROOM LIGHTS ON \r\n ");
 UART1_Write_Text("PRESS E; EROOM LIGHTS OFF \r\n ");

 UART1_Write_Text("PRESS g; BEDROOM LIGHTS ON \r\n ");
 UART1_Write_Text("PRESS G; BEDROOM LIGHTS OFF \r\n ");

 UART1_Write_Text("PRESS i; BATHROOM LIGHTS ON \r\n ");
 UART1_Write_Text("PRESS I; BATHROOM LIGHTS OFF \r\n ");

 UART1_Write_Text("PRESS k; CORRIDOR LIGHTS ON \r\n ");
 UART1_Write_Text("PRESS K; CORRIDOR LIGHTS OFF \r\n ");

 UART1_Write_Text("PRESS n; CHILDREN'S LIGHTS ON \r\n ");
 UART1_Write_Text("PRESS N; CHILDREN'S LIGHTS OFF \r\n ");

 UART1_Write_Text("PRESS o; OROOM LIGHTS ON \r\n ");
 UART1_Write_Text("PRESS O; OROOM LIGHTS OFF \r\n ");

 Lcd_Cmd(_LCD_CLEAR);

 while (1) {
 if ( PORTC.RC0  == 1) {
 Lcd_Out(1, 1, "GAS DETECTED      ");
 UART1_Write_Text(" GAS DETECTED ALARM ACTIVE \r\n ");
 PORTB.RB1 = 0;
 PORTB.RB2 = 0;
 PORTB.RB3 = 0;
 PORTB.RB4 = 0;
 PORTB.RB5 = 0;
 PORTB.RB6 = 0;
 PORTB.RB7 = 0;
 Delay_ms(500);
 } else {
 Lcd_Out(1, 1, "SYSTEM SAFE      ");
 }

 if ( PORTA.RA2  == 1) {
 Lcd_Out(1, 1, "MOTION DETECTED      ");
 UART1_Write_Text(" MOTION DETECTED ALARM ACTIVE \r\n ");
 PORTB.RB4 = 1;
 PORTA.RA3 = 0;
 PORTE.RE2 = 1;
 PORTB.RB5 = 1;
 PORTE.RE1 = 1;
 Delay_ms(1000);
 PORTA.RA3 = 0;
 PORTE.RE2 = 0;
 PORTB.RB5 = 0;
 Delay_ms(2000);
 PORTB.RB4 = 0;
 PORTE.RE1 = 0;
 } else {
 Lcd_Out(1, 1, "SYSTEM SAFE      ");
 }
 Lcd_Chr(2, 12, 223);
 Lcd_Chr(2, 13, 'C');

 temperature = ADC_Read(0);
 mV = temperature * 5000.0 / 1024.0;
 mV = mV / 10.0;
 FloatToStr(mV, txt);
 txt[4] = 0;
 Lcd_out(2, 1, tempTxt);
 Lcd_out(2, 8, txt);
 Delay_ms(200);



 if (mV > 25 && mV < 30) {
 PORTB.RB1 = 1;
 dutycycle = 63;
 PWM1_Set_Duty(dutycycle);
 }

 if (mV > 30 && mV < 35) {
 PORTB.RB1 = 1;
 dutycycle = 128;
 PWM1_Set_Duty(dutycycle);
 }

 if (mV > 35 && mV < 60) {
 PORTB.RB1 = 1;
 dutycycle = 255;
 PWM1_Set_Duty(dutycycle);
 }

 if (mV > 23 && mV < 25) {
 PORTB.RB1 = 0;
 }


 if (mV > 10 && mV < 15) {
 PORTB.RB2 = 1;
 dutycycle = 63;
 PWM2_Set_Duty(dutycycle);
 }

 if (mV > 5 && mV < 10) {
 PORTB.RB2 = 1;
 dutycycle = 128;
 PWM2_Set_Duty(dutycycle);
 }

 if (mV > 1 && mV < 5) {
 PORTB.RB2 = 1;
 dutycycle = 255;
 PWM2_Set_Duty(dutycycle);
 }

 if (mV > 15 && mV < 17) {
 PORTB.RB2 = 0;
 }


 if (UART1_Data_Ready()) {
 uart_rd = UART1_READ();
 switch (uart_rd) {
 case '0':
 PORTB.RB1 = 0;
 PORTB.RB2 = 0;
 PORTB.RB3 = 0;
 PORTB.RB4 = 0;
 PORTB.RB5 = 0;
 PORTB.RB6 = 0;
 PORTB.RB7 = 0;
 UART1_Write_Text(" ALL SYSTEM OFF \r\n ");
 break;

 case '1':
 Delay_ms(1500);
 UART1_Write_Text("**CHOOSE COOLER FAN SPEED** \r\n ");
 UART1_Write_Text("PRESS l; LOW SPEED  \r\n ");
 UART1_Write_Text("PRESS m; MEDIUM SPEED \r\n ");
 UART1_Write_Text("PRESS h; HIGH SPEED  \r\n ");
 break;

 case 'l':
 PORTB.RB1 = 1;
 dutycycle = 63;
 PWM1_Set_Duty(dutycycle);
 UART1_Write_Text("LOW SPEED ACTIVE \r\n ");
 break;

 case 'm':
 PORTB.RB1 = 1;
 dutycycle = 128;
 PWM1_Set_Duty(dutycycle);
 UART1_Write_Text("MEDIUM SPEED ACTIVE  \r\n ");
 break;

 case 'h':
 PORTB.RB1 = 1;
 dutycycle = 255;
 PWM1_Set_Duty(dutycycle);
 UART1_Write_Text("HIGH SPEED ACTIVE \r\n ");
 break;

 case '2':
 PORTB.RB1 = 0;
 UART1_Write_Text("COOLER FAN OFF \r\n ");
 break;

 case '3':
 UART1_Write_Text("**CHOOSE HEATER FAN SPEED** \r\n ");
 UART1_Write_Text("PRESS L; LOW SPEED  \r\n ");
 UART1_Write_Text("PRESS M; MEDIUM SPEED \r\n ");
 UART1_Write_Text("PRESS H; HIGH SPEED  \r\n ");
 break;

 case 'L':
 PORTB.RB2 = 1;
 dutycycle = 63;
 PWM2_Set_Duty(dutycycle);
 UART1_Write_Text("LOW SPEED ACTIVE \r\n ");
 break;

 case 'M':
 PORTB.RB2 = 1;
 dutycycle = 128;
 PWM2_Set_Duty(dutycycle);
 UART1_Write_Text("MEDIUM SPEED ACTIVE  \r\n ");
 break;

 case 'H':
 PORTB.RB2 = 1;
 dutycycle = 255;
 PWM2_Set_Duty(dutycycle);
 UART1_Write_Text("HIGH SPEED ACTIVE \r\n ");
 break;

 case '4':
 PORTB.RB2 = 0;
 UART1_Write_Text("HEATER FAN OFF \r\n ");
 break;

 case '5':
 PORTB.RB3 = 1;
 UART1_Write_Text(" TV ON \r\n ");
 break;

 case '6':
 PORTB.RB3 = 0;
 UART1_Write_Text("TV OFF \r\n ");
 break;

 case '7':
 PORTB.RB4 = 1;
 UART1_Write_Text("GARDEN BULBS ON \r\n ");
 break;

 case '8':
 PORTB.RB4 = 0;
 UART1_Write_Text("GARDEN BULBS OFF \r\n ");
 break;

 case 'C':
 UART1_Write_Text(" TEMPERATURE = ");
 UART1_Write_Text(txt);
 break;

 case 'B':
 PORTE.RE0 = 1;
 UART1_Write_Text("BLINDS ON\r\n ");
 Delay_ms(1000);
 PORTE.RE0 = 0;
 break;

 case 'b':
 PORTB.RB5 = 1;
 UART1_Write_Text("BLINDS OFF\r\n ");
 Delay_ms(1000);
 PORTB.RB5 = 0;
 break;

 case 'c':
 PORTB.RB6 = 1;
 UART1_Write_Text("COFFEE MACHINE ON\r\n ");
 Delay_ms(4000);
 PORTB.RB6 = 0;
 UART1_Write_Text("YOUR COFFEE IS READY ");
 break;

 case 'a':
 hexVal = hexVal | 0b00000010;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Kitchen Light: ");
 Lcd_Out(2, 18, "ON");
 UART1_Write_Text("Kitchen Light ON\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'A':
 hexVal = hexVal ^ 0b00000010;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Kitchen Light: ");
 Lcd_Out(2, 18, "OFF");
 UART1_Write_Text("Kitchen Light OFF\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'd':
 hexVal = hexVal | 0b00100000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Room Light: ");
 Lcd_Out(2, 18, "ON");
 UART1_Write_Text("DRoom Light ON\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'D':
 hexVal = hexVal ^ 0b00100000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Room Light: ");
 Lcd_Out(2, 18, "OFF");
 UART1_Write_Text("DRoom Light OFF\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'e':
 hexVal = hexVal | 0b00010000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Room Light: ");
 Lcd_Out(2, 18, "ON");
 UART1_Write_Text("ERoom Light ON\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'E':
 hexVal = hexVal ^ 0b00010000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Room Light: ");
 Lcd_Out(2, 18, "OFF");
 UART1_Write_Text("ERoom Light OFF\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'g':
 hexVal = hexVal | 0b10000000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Bedroom Light: ");
 Lcd_Out(2, 18, "ON");
 UART1_Write_Text("Bedroom Light ON\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'G':
 hexVal = hexVal ^ 0b10000000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Bedroom Light: ");
 Lcd_Out(2, 18, "OFF");
 UART1_Write_Text("Bedroom Light OFF\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'i':
 hexVal = hexVal | 0b01000000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Bathroom Light: ");
 Lcd_Out(2, 18, "ON");
 UART1_Write_Text("Bathroom Light ON\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'I':
 hexVal = hexVal ^ 0b01000000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Bathroom Light: ");
 Lcd_Out(2, 18, "OFF");
 UART1_Write_Text("Bathroom Light OFF\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'k':
 hexVal = hexVal | 0b00001000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);


 Lcd_Out(2, 1, "Corridor Light: ");
 Lcd_Out(2, 18, "ON");
 UART1_Write_Text("Corridor Light ON\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'K':
 hexVal = hexVal ^ 0b00001000;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Corridor Light: ");
 Lcd_Out(2, 18, "OFF");
 UART1_Write_Text("Corridor Light OFF\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'n':
 hexVal = hexVal | 0b00000100;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Children's Room ");
 Lcd_Out(3, 1, "Light ");
 Lcd_Out(2, 18, "ON");
 UART1_Write_Text("Children's Light ON\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'N':
 hexVal = hexVal ^ 0b00000100;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Children's Room ");
 Lcd_Out(3, 1, "Light ");
 Lcd_Out(2, 18, "OFF");
 UART1_Write_Text("Children's Light OFF\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;

 case 'o':
 hexVal = hexVal | 0b00000001;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Room Light: ");
 Lcd_Out(2, 18, "ON");
 UART1_Write_Text("Oroom Light ON\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 break;
 case 'O':
 hexVal = hexVal ^ 0b00000001;
 send_data(hexVal);
 delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Room Light: ");
 Lcd_Out(2, 18, "OFF");
 UART1_Write_Text("Oroom Light OFF\r\n ");
 Delay_ms(200);
 Lcd_Cmd(_LCD_CLEAR);
 }
 }
 }
}
