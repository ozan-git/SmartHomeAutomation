#include "digital_keypad.h"

static unsigned char once = 1;
static unsigned char pre_key;
static unsigned char longpress;

/* Set Keypad Port as input */
void init_digital_keypad(void) { TRISB = TRISB | 0b00111111; }

// return PORTB & 0x3F
unsigned char keypad_and_input() { return (PORTB & 0b00111111); }

int not_all_released() {
    if (PORTB != 0b00111111)
       return 1;
}

int all_released() { 
    if (PORTB == 0b00111111)
       return 1;
}

void not_all_released_and_once() { 
     once = 0;
     longpress = 0;
     pre_key = keypad_and_input();
}

unsigned char read_digital_keypad(unsigned char mode) {
    if (mode == LEVEL_DETECTION) {
        return keypad_and_input();
    } 
    else {
        if (not_all_released() && once) {
            not_all_released_and_once();
        } 
        else if ((pre_key == keypad_and_input()) && longpress < 20 && !once) {
            longpress++;
        } 
        else if (longpress == 20) {
            longpress++;
            return 0x80 | pre_key;
            
        } 
        else if(all_released() && !once) {
            once = 1;
            if(longpress < 20) {
                return pre_key;
            }
        }
    }
    return ALL_RELEASED;
}