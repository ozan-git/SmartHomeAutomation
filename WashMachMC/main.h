#ifndef MAIN_H
#define MAIN_H

#include "digital_keypad.h"
#include "timers.h"

#define WASHING_PROGRAM_DISPLAY         0x01
#define WATER_LEVEL                     0x02
#define START_STOP_SCREEN               0x03
#define START_PROGRAM                   0x04
#define PAUSE                           0x05

#define WASHING_PROGRAM_DISPLAY_RESET   0x10
#define WATER_LEVEL_RESET               0x11
#define START_PROGRAM_RESET             0x12
#define REST_NOTHING                    0x00

sbit FAN at RC2_bit;
sbit BUZZER at RC1_bit;
sbit BUZZER_DDR at TRISC1_bit;
sbit FAN_DDR at TRISC2_bit;

// LCD module connections
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
// End LCD module connections

#define ON                              1
#define OFF                             0
#define BLOCK                           0xFF

char byte_to_str(int input);
void power_on_screen(void);
void clear_screen(void);
void washing_program_display(unsigned char key);
void water_level_display(unsigned char key);
void set_time_for_program(void);
void run_program(unsigned char key);

#endif        /* MAIN_H */