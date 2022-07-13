#line 1 "G:/My Drive/6_Term/Microprocessors/MPPROJECT/180403064_SmartHome_Project/WashMachMC/isr.c"
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
#line 9 "G:/My Drive/6_Term/Microprocessors/MPPROJECT/180403064_SmartHome_Project/WashMachMC/isr.c"
extern unsigned char sec, min;
void interrupt () {

 static unsigned int count = 0;

 if (TMR2IF_bit == 1) {
 if (++count == 100) {
 count = 0;
 if(sec > 0) { sec--; }
 else if(sec == 0 && min > 0) {
 min--;
 sec = 59;
 }
 }
 TMR2IF_bit = 0;
 }
}
