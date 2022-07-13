/*
 * File:   main.c
 * Author: orhan
 *
 * Created on May 1, 2022, 6:30 PM
 */
#include "main.h"

char str;
unsigned char key;
unsigned char operation_mode;
int wash_time, rinse_time, spin_time;
unsigned char reset_mode, program_no = 0, water_level_index = 0;
unsigned char i;

char washing_prog[12][16] = {"Quick", "Bulky", "Gentle", "Whites", "Permanent Press", "Cotton Cycle", "Wool Cycle", "Sport Cycle",
                        "Rinse and Spin", "Spin only", "Wash Only", "Aqua Store"};
char water_level_arr[5][7] = {"Auto", "Low", "Medium", "High", "Max"};

unsigned char sec = 0, min = 0;
static void init_config(void) {

    ANSELA = 0;
    ANSELB = 0;
    ANSELC = 0;
    ANSELD = 0;
    ANSELE = 0;
    
    /* Initialize LCD */
    lcd_init();

    /* Initialize Digital Keypad */
    init_digital_keypad();

    /* Initialize Timer2 */
    init_timer2();

    // Setting output Fan and Buzzer.
    FAN_DDR = 0;
    BUZZER_DDR = 0;


    PEIE_bit = 1;     // Enable peripheral interrupts.
    GIE_bit = 1;      // Enable global interrupt
}

void main(void) {
    init_config();
    
    key = 0x3F;
    operation_mode = WASHING_PROGRAM_DISPLAY;
    reset_mode = WASHING_PROGRAM_DISPLAY_RESET;

    Lcd_Cmd(_LCD_CLEAR);                  // Clear display
    Lcd_Cmd(_LCD_CURSOR_OFF);             // Cursor off
    
    Lcd_Out(1, 3, " Press START to");       // Write text in first row
    Lcd_Out(2, 3, " Starting the   ");
    Lcd_Out(3, 3, " Washing Machine");

    // SW5 -> 0x2F
    while (read_digital_keypad(STATE) != SW5) { Delay_us(300); }
    
    //clear screen
    clear_screen();

    // call power on screen
    power_on_screen();

    while (1) {
        // SW4
        key = read_digital_keypad(STATE);
        Delay_uS(10);

        if (key == LSW4 && operation_mode == WASHING_PROGRAM_DISPLAY) {
        
            //Display water level screen
            operation_mode = WATER_LEVEL;
            reset_mode = WATER_LEVEL_RESET;
        }
        else if (key == LSW4 && operation_mode == WATER_LEVEL) {
        
            //set timing for washing programs
            set_time_for_program();
            clear_screen();

            //display required message
            Lcd_Out(1, 4, " PLEASE PRESS");
            Lcd_Out(2, 4, " START BUTTON");
            Lcd_Out(3, 4, "      OR     ");
            Lcd_Out(4, 4, " BACK  BUTTON ");
            operation_mode = START_STOP_SCREEN;
        }
        else if (key == SW5 && operation_mode == PAUSE) {
            TMR2ON_bit = ON; //START TIMER
            FAN = ON;
            operation_mode = START_PROGRAM;
        }

        switch (operation_mode) {
            case WASHING_PROGRAM_DISPLAY:
                washing_program_display(key);
                break;

            case WATER_LEVEL:
                water_level_display(key);
                break;

            case START_STOP_SCREEN:
                if (key == SW5) {
                    operation_mode = START_PROGRAM;
                    reset_mode = START_PROGRAM_RESET;
                    continue;
                }
                else if (key == SW6) {
                    operation_mode = WASHING_PROGRAM_DISPLAY;
                    reset_mode = WASHING_PROGRAM_DISPLAY_RESET;
                    continue;
                }
                break;

            case START_PROGRAM:
                run_program(key);
                break;
        }
        reset_mode = REST_NOTHING;
    }
}

void clear_screen(void) {
    Lcd_Cmd(_LCD_CLEAR);                  // Clear display
    Delay_uS(100);
}

void power_on_screen(void) {
    // presenting "#" on LINE1
    for (i = 1; i < 20; i++) {
        Lcd_Out(1, i, "#");
    }

    Lcd_Out(2, 1, "    STARTING THE");
    Lcd_Out(3, 1, "  WASHING MACHINE");

    // presenting "#" on LINE4
    for (i = 1; i < 20; i++) {
        Lcd_Out(4, i, "#");
    }
}

void washing_program_display(unsigned char key) {
    if (reset_mode == WASHING_PROGRAM_DISPLAY_RESET) {
        clear_screen();
        program_no = 0;
    }
    if (key == SW4) {
        program_no++;
        if (program_no == 12)
            program_no = 0;
        clear_screen();
    }

    Lcd_Out(1, 1, " WASHING PROGRAM");
    Lcd_Out(2, 1, "->");

    if (program_no <= 9) {
        Lcd_Out(2, 4, washing_prog[program_no]);
        Lcd_Out(3, 4, washing_prog[program_no + 1]);
        Lcd_Out(4, 4, washing_prog[program_no + 2]);
    }
    else if (program_no == 10) {
        Lcd_Out(2, 4, washing_prog[program_no]);
        Lcd_Out(3, 4, washing_prog[program_no + 1]);
        Lcd_Out(4, 4, washing_prog[0]);
    }
    else if (program_no == 11) {
        Lcd_Out(2, 4, washing_prog[program_no]);
        Lcd_Out(3, 4, washing_prog[0]);
        Lcd_Out(4, 4, washing_prog[1]);
    }
}

void water_level_display(unsigned char key) {
    if (reset_mode == WATER_LEVEL_RESET) {
        water_level_index = 0;
        clear_screen();
    }
    if (key == SW4) {
        water_level_index++;

        if (water_level_index == 5) {
            water_level_index = 0;
        }
        clear_screen();
    }

    Lcd_Out(1, 1, " WATER LEVEL");
    Lcd_Out(2, 1, "->");

    if (water_level_index <= 2) {
        Lcd_Out(2, 4, water_level_arr[water_level_index]);
        Lcd_Out(3, 4, water_level_arr[water_level_index + 1]);
        Lcd_Out(4, 4, water_level_arr[water_level_index + 2]);
    }
    else if (water_level_index == 3) {
        Lcd_Out(2, 4, water_level_arr[water_level_index]);
        Lcd_Out(3, 4, water_level_arr[water_level_index + 1]);
        Lcd_Out(4, 4, water_level_arr[0]);
    }
    else if (water_level_index == 4) {
        Lcd_Out(2, 4, water_level_arr[water_level_index]);
        Lcd_Out(3, 4, water_level_arr[0]);
        Lcd_Out(4, 4, water_level_arr[1]);
    }
}

void set_time_for_program(void) {
    switch (program_no) {
        case 0: //Quick program
            switch (water_level_index) {
                case 1://low
                    sec = 33;  // 33
                    min = 0;
                    break;
                case 0:
                case 2:
                    sec = 41;     //41
                    min = 0;
                    break;
                case 3:
                case 4:
                    sec = 45;
                    min = 0;
            }
            break;
        case 1://Bulky
            switch (water_level_index) {

                case 1://LOW
                    sec = 43;
                    min = 0;
                case 0:
                case 2:
                    sec = 50;
                    min = 0;
                    break;
                case 3:
                case 4:
                    sec = 57;
                    min = 0;
            }
            break;
        case 2: //Gentle
            switch (water_level_index) {

                case 1://Low
                case 0:
                case 2:
                    sec = 26;
                    min = 0;
                    break;
                case 3:
                case 4:
                    sec = 31;
                    min = 0;
            }
            break;
        case 3: //whites
            sec = 16;
            min = 1;
            break;
        case 4: //Stain Wash 96sec
            sec = 36;
            min = 1;
        case 5: //Cotton Cycle
            sec = 28;
            min = 0;
            break;
        case 6: //Wool Cycle
            sec = 29;
            break;
        case 7: //Sport Cycle
            switch (water_level_index) {
                case 1: // low
                    sec = 46;
                    min = 0;
                case 0:
                case 2:
                    sec = 53;
                    min = 0;
                    break;
                case 3:
                case 4:
                    sec = 60;
                    min = 0;
            }
            break;
        case 8: //Rinse and Spin
            switch (water_level_index) {
                case 1: //low
                    sec = 18;
                    min = 0;
                case 0:
                case 2:
                case 3:
                case 4:
                    sec = 20;
                    min = 0;
            }
            break;
        case 9: //Spin only
            sec = 6;
            break;
        case 10: //Wash Only
        case 11: //Aqua store
            switch (water_level_index) {
                case 1: //low
                    sec = 16;
                    min = 0;
                case 0:
                case 2:
                    sec = 21;
                    min = 0;
                    break;
                case 3:
                case 4:
                    sec = 26;
                    min = 0;
            }
            break;
    }
}

void door_status_check(void) {
    //DOOR OPEN CONDITION
    if (RB0_bit == 0) {
        //TURN ON BUZZER
        BUZZER = ON;
        FAN = OFF;
        TMR2ON_bit = OFF;

        clear_screen();
        Lcd_Out(1, 1, " DOOR : OPEN");
        Lcd_Out(3, 1, " Please Close");

        // wait still door is closed
        while (RB0 == 0) { ; }
        
        clear_screen();
        //CONTINUE THE WORK
        FAN = ON;
        TMR2ON_bit = ON;

        BUZZER = OFF;
        Lcd_Out(1, 1, " Function -");
        Lcd_Out(2, 1, " TIME");
        Lcd_Out(4, 1, " 5-START  6-PAUSE");
    }
}

static int total_time, time;
void run_program(unsigned char key) {

    door_status_check();
    Lcd_Out(2, 9, " ");
    Lcd_Out(2, 13, " ");
    
    if (reset_mode == START_PROGRAM_RESET) {
        clear_screen();
        Lcd_Out(1, 1, " PROGRAM: ");
        Lcd_Chr(1, 7, washing_prog[program_no]);
        Lcd_Out(2, 1, " TIME:");

        Lcd_Out(2, 9, byte_to_str(min));
        Lcd_Out(2, 9, " ");
        Lcd_Chr(2, 12, ':');
        Lcd_Out(2, 13, byte_to_str(sec));
        Lcd_Out(2, 13, " ");
        Lcd_Out(3, 8, " (MM:SS)");

        Delay_mS(500);

        // display screen
        clear_screen();
        Lcd_Out(1, 1, " FUNCTION -");
        Lcd_Out(2, 1, " TIME");
        Lcd_Out(4, 1, " B4-START  B5-PAUSE");

        // sec = 60 , min =0
        time = total_time = (min * 60 + sec);
        wash_time = (int) total_time * (46 / 100);
        rinse_time = (int) total_time * (12 / 100);
        spin_time = total_time - wash_time - rinse_time;

        // start the timer
        TMR2ON_bit = 1;

        // start the fan
    }

    //PAUSE THE MACHINE
    if (key == SW6) {
        TMR2ON_bit = OFF; //TURN OFF TIMER
        FAN = OFF;
        operation_mode = PAUSE;
    }

    total_time = (min * 60 + sec);

    if (program_no <= 7) {
        if (total_time >= (time - wash_time)) { Lcd_Out(1, 12, " Wash"); }
        else if (total_time >= (time - wash_time - rinse_time)) { Lcd_Out(1, 12, " Rinse"); }
        else Lcd_Out(1, 12, " Spin");
    }
        //rinse+dry
    else if (program_no == 8) {
        if (total_time >= (time - (0.40 * time))) { Lcd_Out(1, 12, " Rinse"); }
        else { Lcd_Out(1, 12, " Spin "); }
    }
        //dry only
    else if (program_no == 9) { Lcd_Out(1, 12, " Rinse"); }//aqua store
    else { Lcd_Out(1, 12, " Wash"); }

    Lcd_Out(2, 9, byte_to_str(min));
    Lcd_Out(2, 9, " ");
    Lcd_Chr(2, 12, ':');
    Lcd_Out(2, 13, byte_to_str(sec));
    Lcd_Out(2, 13, " ");

    if (sec == 0 && min == 0) {
        
        //STOP THE TIMER
        TMR2ON_bit = OFF;
        //TURN OFF FAN
        FAN = OFF;
        //TURN ON BUZZER
        BUZZER = ON;

        clear_screen();

        Lcd_Out(1, 1, " Program Completed ");
        Lcd_Out(3, 1, " Cloths are Removed");
        Delay_mS(2000);
        BUZZER = OFF;
        operation_mode = WASHING_PROGRAM_DISPLAY;
        reset_mode = WASHING_PROGRAM_DISPLAY_RESET;
        clear_screen();
    }
}

char byte_to_str(int input) {
    ByteToStrWithZeros(input, str);
    return str;
}