#line 1 "G:/My Drive/6_Term/Microprocessors/MPPROJECT/180403064_SmartHome_Project/WashMachMC/WashingMachineMC.c"
#line 1 "g:/my drive/6_term/microprocessors/mpproject/180403064_smarthome_project/washmachmc/main.h"
#line 1 "g:/my drive/6_term/microprocessors/mpproject/180403064_smarthome_project/washmachmc/digital_keypad.h"









sbit KEYPAD_PORT at PORTB;
sbit KEYPAD_PORT_DDR at TRISB;
#line 27 "g:/my drive/6_term/microprocessors/mpproject/180403064_smarthome_project/washmachmc/digital_keypad.h"
unsigned char keypad_state();
int not_all_released();
int all_released();
void not_all_released_and_once();
unsigned char read_digital_keypad(unsigned char mode);
void init_digital_keypad(void);
#line 1 "g:/my drive/6_term/microprocessors/mpproject/180403064_smarthome_project/washmachmc/timers.h"



void init_timer0(void);
void init_timer2(void);
#line 18 "g:/my drive/6_term/microprocessors/mpproject/180403064_smarthome_project/washmachmc/main.h"
sbit FAN at RC2_bit;
sbit BUZZER at RC1_bit;
sbit BUZZER_DDR at TRISC1_bit;
sbit FAN_DDR at TRISC2_bit;


sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;






char byte_to_str(int input);
void power_on_screen(void);
void clear_screen(void);
void washing_program_display(unsigned char key);
void water_level_display(unsigned char key);
void set_time_for_program(void);
void run_program(unsigned char key);
#line 9 "G:/My Drive/6_Term/Microprocessors/MPPROJECT/180403064_SmartHome_Project/WashMachMC/WashingMachineMC.c"
char str;
unsigned char key;
unsigned char operation_mode;
int wash_time, rinse_time, spin_time;
unsigned char reset_mode, program_no = 0, water_level_index = 0;
unsigned char i;

char washing_prog[12][16] = {"Quick", "Bulky", "Gentle", "Whites", "Permanent Press", "Cotton Cycle", "Wool Cycle", "Sport Cycle",
 "Rinse and Spin", "Spin only", "Wash Only", "Aqua Store"};
char water_level_arr[5][7] = {"Auto", "Low", "Medium", "High", "Max"};

unsigned char sec = 0, min = 0;
static void init_config(void) {

 ANSELA = 0;
 ANSELB = 0;
 ANSELC = 0;
 ANSELD = 0;
 ANSELE = 0;


 lcd_init();


 init_digital_keypad();


 init_timer2();


 FAN_DDR = 0;
 BUZZER_DDR = 0;


 PEIE_bit = 1;
 GIE_bit = 1;
}

void main(void) {
 init_config();

 key = 0x3F;
 operation_mode =  0x01 ;
 reset_mode =  0x10 ;

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 3, " Press START to");
 Lcd_Out(2, 3, " Starting the   ");
 Lcd_Out(3, 3, " Washing Machine");


 while (read_digital_keypad( 1 ) !=  0x2F ) { Delay_us(300); }


 clear_screen();


 power_on_screen();

 while (1) {

 key = read_digital_keypad( 1 );
 Delay_uS(10);

 if (key ==  0xB7  && operation_mode ==  0x01 ) {


 operation_mode =  0x02 ;
 reset_mode =  0x11 ;
 }
 else if (key ==  0xB7  && operation_mode ==  0x02 ) {


 set_time_for_program();
 clear_screen();


 Lcd_Out(1, 4, " PLEASE PRESS");
 Lcd_Out(2, 4, " START BUTTON");
 Lcd_Out(3, 4, "      OR     ");
 Lcd_Out(4, 4, " BACK  BUTTON ");
 operation_mode =  0x03 ;
 }
 else if (key ==  0x2F  && operation_mode ==  0x05 ) {
 TMR2ON_bit =  1 ;
 FAN =  1 ;
 operation_mode =  0x04 ;
 }

 switch (operation_mode) {
 case  0x01 :
 washing_program_display(key);
 break;

 case  0x02 :
 water_level_display(key);
 break;

 case  0x03 :
 if (key ==  0x2F ) {
 operation_mode =  0x04 ;
 reset_mode =  0x12 ;
 continue;
 }
 else if (key ==  0x1F ) {
 operation_mode =  0x01 ;
 reset_mode =  0x10 ;
 continue;
 }
 break;

 case  0x04 :
 run_program(key);
 break;
 }
 reset_mode =  0x00 ;
 }
}

void clear_screen(void) {
 Lcd_Cmd(_LCD_CLEAR);
 Delay_uS(100);
}

void power_on_screen(void) {

 for (i = 1; i < 20; i++) {
 Lcd_Out(1, i, "#");
 }

 Lcd_Out(2, 1, "    STARTING THE");
 Lcd_Out(3, 1, "  WASHING MACHINE");


 for (i = 1; i < 20; i++) {
 Lcd_Out(4, i, "#");
 }
}

void washing_program_display(unsigned char key) {
 if (reset_mode ==  0x10 ) {
 clear_screen();
 program_no = 0;
 }
 if (key ==  0x37 ) {
 program_no++;
 if (program_no == 12)
 program_no = 0;
 clear_screen();
 }

 Lcd_Out(1, 1, " WASHING PROGRAM");
 Lcd_Out(2, 1, "->");

 if (program_no <= 9) {
 Lcd_Out(2, 4, washing_prog[program_no]);
 Lcd_Out(3, 4, washing_prog[program_no + 1]);
 Lcd_Out(4, 4, washing_prog[program_no + 2]);
 }
 else if (program_no == 10) {
 Lcd_Out(2, 4, washing_prog[program_no]);
 Lcd_Out(3, 4, washing_prog[program_no + 1]);
 Lcd_Out(4, 4, washing_prog[0]);
 }
 else if (program_no == 11) {
 Lcd_Out(2, 4, washing_prog[program_no]);
 Lcd_Out(3, 4, washing_prog[0]);
 Lcd_Out(4, 4, washing_prog[1]);
 }
}

void water_level_display(unsigned char key) {
 if (reset_mode ==  0x11 ) {
 water_level_index = 0;
 clear_screen();
 }
 if (key ==  0x37 ) {
 water_level_index++;

 if (water_level_index == 5) {
 water_level_index = 0;
 }
 clear_screen();
 }

 Lcd_Out(1, 1, " WATER LEVEL");
 Lcd_Out(2, 1, "->");

 if (water_level_index <= 2) {
 Lcd_Out(2, 4, water_level_arr[water_level_index]);
 Lcd_Out(3, 4, water_level_arr[water_level_index + 1]);
 Lcd_Out(4, 4, water_level_arr[water_level_index + 2]);
 }
 else if (water_level_index == 3) {
 Lcd_Out(2, 4, water_level_arr[water_level_index]);
 Lcd_Out(3, 4, water_level_arr[water_level_index + 1]);
 Lcd_Out(4, 4, water_level_arr[0]);
 }
 else if (water_level_index == 4) {
 Lcd_Out(2, 4, water_level_arr[water_level_index]);
 Lcd_Out(3, 4, water_level_arr[0]);
 Lcd_Out(4, 4, water_level_arr[1]);
 }
}

void set_time_for_program(void) {
 switch (program_no) {
 case 0:
 switch (water_level_index) {
 case 1:
 sec = 33;
 min = 0;
 break;
 case 0:
 case 2:
 sec = 41;
 min = 0;
 break;
 case 3:
 case 4:
 sec = 45;
 min = 0;
 }
 break;
 case 1:
 switch (water_level_index) {

 case 1:
 sec = 43;
 min = 0;
 case 0:
 case 2:
 sec = 50;
 min = 0;
 break;
 case 3:
 case 4:
 sec = 57;
 min = 0;
 }
 break;
 case 2:
 switch (water_level_index) {

 case 1:
 case 0:
 case 2:
 sec = 26;
 min = 0;
 break;
 case 3:
 case 4:
 sec = 31;
 min = 0;
 }
 break;
 case 3:
 sec = 16;
 min = 1;
 break;
 case 4:
 sec = 36;
 min = 1;
 case 5:
 sec = 28;
 min = 0;
 break;
 case 6:
 sec = 29;
 break;
 case 7:
 switch (water_level_index) {
 case 1:
 sec = 46;
 min = 0;
 case 0:
 case 2:
 sec = 53;
 min = 0;
 break;
 case 3:
 case 4:
 sec = 60;
 min = 0;
 }
 break;
 case 8:
 switch (water_level_index) {
 case 1:
 sec = 18;
 min = 0;
 case 0:
 case 2:
 case 3:
 case 4:
 sec = 20;
 min = 0;
 }
 break;
 case 9:
 sec = 6;
 break;
 case 10:
 case 11:
 switch (water_level_index) {
 case 1:
 sec = 16;
 min = 0;
 case 0:
 case 2:
 sec = 21;
 min = 0;
 break;
 case 3:
 case 4:
 sec = 26;
 min = 0;
 }
 break;
 }
}

void door_status_check(void) {

 if (RB0_bit == 0) {

 BUZZER =  1 ;
 FAN =  0 ;
 TMR2ON_bit =  0 ;

 clear_screen();
 Lcd_Out(1, 1, " DOOR : OPEN");
 Lcd_Out(3, 1, " Please Close");


 while (RB0 == 0) { ; }

 clear_screen();

 FAN =  1 ;
 TMR2ON_bit =  1 ;

 BUZZER =  0 ;
 Lcd_Out(1, 1, " Function -");
 Lcd_Out(2, 1, " TIME");
 Lcd_Out(4, 1, " 5-START  6-PAUSE");
 }
}

static int total_time, time;
void run_program(unsigned char key) {

 door_status_check();
 Lcd_Out(2, 9, " ");
 Lcd_Out(2, 13, " ");

 if (reset_mode ==  0x12 ) {
 clear_screen();
 Lcd_Out(1, 1, " PROGRAM: ");
 Lcd_Chr(1, 7, washing_prog[program_no]);
 Lcd_Out(2, 1, " TIME:");

 Lcd_Out(2, 9, byte_to_str(min));
 Lcd_Out(2, 9, " ");
 Lcd_Chr(2, 12, ':');
 Lcd_Out(2, 13, byte_to_str(sec));
 Lcd_Out(2, 13, " ");
 Lcd_Out(3, 8, " (MM:SS)");

 Delay_mS(500);


 clear_screen();
 Lcd_Out(1, 1, " FUNCTION -");
 Lcd_Out(2, 1, " TIME");
 Lcd_Out(4, 1, " B4-START  B5-PAUSE");


 time = total_time = (min * 60 + sec);
 wash_time = (int) total_time * (46 / 100);
 rinse_time = (int) total_time * (12 / 100);
 spin_time = total_time - wash_time - rinse_time;


 TMR2ON_bit = 1;


 }


 if (key ==  0x1F ) {
 TMR2ON_bit =  0 ;
 FAN =  0 ;
 operation_mode =  0x05 ;
 }

 total_time = (min * 60 + sec);

 if (program_no <= 7) {
 if (total_time >= (time - wash_time)) { Lcd_Out(1, 12, " Wash"); }
 else if (total_time >= (time - wash_time - rinse_time)) { Lcd_Out(1, 12, " Rinse"); }
 else Lcd_Out(1, 12, " Spin");
 }

 else if (program_no == 8) {
 if (total_time >= (time - (0.40 * time))) { Lcd_Out(1, 12, " Rinse"); }
 else { Lcd_Out(1, 12, " Spin "); }
 }

 else if (program_no == 9) { Lcd_Out(1, 12, " Rinse"); }
 else { Lcd_Out(1, 12, " Wash"); }

 Lcd_Out(2, 9, byte_to_str(min));
 Lcd_Out(2, 9, " ");
 Lcd_Chr(2, 12, ':');
 Lcd_Out(2, 13, byte_to_str(sec));
 Lcd_Out(2, 13, " ");

 if (sec == 0 && min == 0) {


 TMR2ON_bit =  0 ;

 FAN =  0 ;

 BUZZER =  1 ;

 clear_screen();

 Lcd_Out(1, 1, " Program Completed ");
 Lcd_Out(3, 1, " Cloths are Removed");
 Delay_mS(2000);
 BUZZER =  0 ;
 operation_mode =  0x01 ;
 reset_mode =  0x10 ;
 clear_screen();
 }
}

char byte_to_str(int input) {
 ByteToStrWithZeros(input, str);
 return str;
}
