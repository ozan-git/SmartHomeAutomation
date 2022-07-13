void init_timer2(void) {
    /* Selecting the scale */
    T2CKPS0_bit = 1;
    T2CKPS1_bit = 1;

    /* Loading the Pre Load register with 250 */
    PR2 = 250;

    /* The timer interrupt is enabled */
    TMR2IE_bit = 1;

    /* Switching on the Timer2 */
    TMR2ON_bit = 0;
}