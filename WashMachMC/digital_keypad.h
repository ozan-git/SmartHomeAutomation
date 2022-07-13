#ifndef DIGITAL_KEYPAD_H
#define DIGITAL_KEYPAD_H

#define LEVEL_DETECTION        0
#define LEVEL                  0

#define STATE_DETECTION         1
#define STATE                   1

sbit KEYPAD_PORT at PORTB;
sbit KEYPAD_PORT_DDR at TRISB;

#define INPUT_LINES             0x3F  // 00111111 once state = 1 and first state

#define SW1                     0x3E  // 00111110 once state = 1 and RB0
#define SW2                     0x3D  // 00111101 once state = 1 and RB1
#define SW3                     0x3B  // 00111011 once state = 1 and RB2
#define SW4                     0x37  // 00110111 once state = 1 and RB3
#define SW5                     0x2F  // 00101111 once state = 1 and RB4
#define SW6                     0x1F  // 00011111 once state = 1 and RB5

#define LSW4                    0xB7  // 10110111 once state = 0 and RB3
#define LSW5                    0xAF  // 10101111 once state = 0 and RB4

#define ALL_RELEASED            INPUT_LINES

unsigned char keypad_state();
int not_all_released();
int all_released();
void not_all_released_and_once();
unsigned char read_digital_keypad(unsigned char mode);
void init_digital_keypad(void);

#endif        /* DIGITAL_KEYPAD_H */