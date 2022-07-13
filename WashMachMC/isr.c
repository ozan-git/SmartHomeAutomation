#include "main.h"

/**
 * The timer overflows as a result of an internal interrupt from the timer module.
 * Thus, events can be scheduled to occur at regular intervals. When an interrupt 
 * occurs, the microprocessor leaves the main program execution stream and jumps 
 * to the interrupt service routine (ISR).
 */
extern unsigned char sec, min;
void interrupt () {

    static unsigned int count = 0;
    // interrupt handler
    if (TMR2IF_bit == 1) {
        if (++count == 100) {
            count = 0;
            if(sec > 0) { sec--; }
            else if(sec == 0 && min > 0) {
                min--;
                sec = 59;
            }
        }
        TMR2IF_bit = 0;    //reset the interrupt flag
    }
}