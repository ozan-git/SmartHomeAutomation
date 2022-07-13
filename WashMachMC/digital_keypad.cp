#line 1 "G:/My Drive/6_Term/Microprocessors/MPPROJECT/180403064_SmartHome_Project/WashMachMC/digital_keypad.c"
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
#line 3 "G:/My Drive/6_Term/Microprocessors/MPPROJECT/180403064_SmartHome_Project/WashMachMC/digital_keypad.c"
static unsigned char once = 1;
static unsigned char pre_key;
static unsigned char longpress;


void init_digital_keypad(void) { TRISB = TRISB | 0b00111111; }


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
 if (mode ==  0 ) {
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
 return  0x3F ;
}
