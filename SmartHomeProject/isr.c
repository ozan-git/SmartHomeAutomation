#include "main.h"

// INTERRUPT FUNCTION
void interrupt() {
    if (INT0F_bit == 1) {
        PORTB.RB1 = 0;    //ALL SYSTEM OFF WITH INTERRUPT
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
        PORTE.RE1 = 0;     // DOORS OPEN WITH INTERRUPT
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
