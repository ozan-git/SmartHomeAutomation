#line 1 "G:/My Drive/6_Term/Microprocessors/MPPROJECT/180403064_SmartHome_Project/WashMachMC/timers.c"
void init_timer2(void) {

 T2CKPS0_bit = 1;
 T2CKPS1_bit = 1;


 PR2 = 250;


 TMR2IE_bit = 1;


 TMR2ON_bit = 0;
}
