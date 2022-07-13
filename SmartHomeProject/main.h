#ifndef MAIN_H
#define MAIN_H

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

#define GAS PORTC.RC0
#define PIR PORTA.RA2

sbit DATA_pin at  RA7_bit;
sbit LATCH_pin at PORTB.B7;
sbit CLOCK_pin at RA6_bit;

#endif        /* MAIN_H */