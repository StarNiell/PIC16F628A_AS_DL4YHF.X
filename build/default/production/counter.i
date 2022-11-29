# 1 "counter.s"
# 1 "<built-in>" 1
# 1 "counter.s" 2
;**************************************************************************
; FILE: counter.s *
; CONTENTS: Simple low-cost digital frequency meter using a PIC 16F628A *
; AUTHOR: Wolfgang Buescher, DL4YHF *
; (based on a work by James Hutchby, MadLab, 1996) *
; ex MPLAB 8 project (MPASM Assembly compilator) *
; ported to MPLAB X v6 project (pic-as Assembly compiler) *
; by Aniello Di Nardo (StarNiell) (IU8NQI) *
; REVISIONS: (latest entry first) *
; 2022-11-27 - Aniello Di Nardo (IU8NQI): porting to MPLAB X 6 (pic-as) *
; remember to set "-Wl,-PresetVec=0x0" in pic-as global *
; options (Additional Options) of Project Properties *
; Added 10695000 into IF Table *
; 2021-02-23 - Ho-Ro: 1 Hz resolution up to 99999 Hz (range < 101760 Hz) *
; 2021-02-18 - Ho-Ro: display underflow as "    0" (DISPLAY_VARIANT_2/3) *
; 2020-08-25 - Ho-Ro: Modified for Linux gpsam (produces identical hex) *
; 2017-09-10 - Nigel Kendrick (nigel-dot-kendrickatgeemail.com *
; Added option to specify that you are using an external *
; crystal oscillator on OSC1, which frees OSC2/RA6/PB6 *
; as an output pin that can then be used to control display *
; digit 5 instead of the diode/transistor NAND gate. *
; 2006-05-31 - Added the 'power-save' option which temporarily puts the *
; PIC to sleep (with only the watchdog-oscillator running) *
; 2006-05-15 - New entry in the preconfigured frequency table for 4-MHz *
; IF filters (like "Miss Mosquita" [Moskita] by DK1HE) *
; 2005-08-24 - Cured a bug in the COMMON ANODE decimal point setting . *
; (the "^0xFF" for the AND-mask was missing in macro 'conv') *
; 2005-03-21 - Added a few conditionals to use the same sourcecode *
; to drive a COMMON ANODE display ( DISPLAY_VARIANT_3 ) *
; 2004-03-14 - Fixed a range-switching bug around 8 MHz . *
; - Support TWO different display variants now, *
; optimized for different board layouts, and different clock *
; frequencies (4 MHz for variant 1, 20 MHz for variant 2). *
; 2004-03-05 - Added the feature to add or subtract a frequency offset . *
; 2004-02-18 - Migration to a PIC16F628 with 4 MHz crystal (el Cheapo) *
; - Changed the LED patterns '6' and '9' because they looked *
; like '0b and 'q' in the old counter version .              *
; - Added the auto-ranging feature *
; - Stepped from 24-bit to 32-bit integer arithmetic, to be *
; able to count 50 MHz with 1-second gate time, *
; or (at least) adjust ANY github dl4yhfresult for the ANY *
; prescaler *
; division ratio, which may give pretty large numbers . *
; - A PIC16F628 worked up to 63 MHz with this firmware . *
;**************************************************************************

 PROCESSOR 16F628A
 RADIX DEC

 ; processor specific definitions

# 1 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\xc.inc" 1 3






# 1 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\pic.inc" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\pic_as_chip_select.inc" 1 3
# 2354 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\pic_as_chip_select.inc" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\proc\\pic16f628a.inc" 1 3
# 48 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\proc\\pic16f628a.inc" 3
INDF equ 0000h



TMR0 equ 0001h



PCL equ 0002h



STATUS equ 0003h

STATUS_C_POSN equ 0000h
STATUS_C_POSITION equ 0000h
STATUS_C_SIZE equ 0001h
STATUS_C_LENGTH equ 0001h
STATUS_C_MASK equ 0001h
STATUS_DC_POSN equ 0001h
STATUS_DC_POSITION equ 0001h
STATUS_DC_SIZE equ 0001h
STATUS_DC_LENGTH equ 0001h
STATUS_DC_MASK equ 0002h
STATUS_Z_POSN equ 0002h
STATUS_Z_POSITION equ 0002h
STATUS_Z_SIZE equ 0001h
STATUS_Z_LENGTH equ 0001h
STATUS_Z_MASK equ 0004h
STATUS_nPD_POSN equ 0003h
STATUS_nPD_POSITION equ 0003h
STATUS_nPD_SIZE equ 0001h
STATUS_nPD_LENGTH equ 0001h
STATUS_nPD_MASK equ 0008h
STATUS_nTO_POSN equ 0004h
STATUS_nTO_POSITION equ 0004h
STATUS_nTO_SIZE equ 0001h
STATUS_nTO_LENGTH equ 0001h
STATUS_nTO_MASK equ 0010h
STATUS_RP_POSN equ 0005h
STATUS_RP_POSITION equ 0005h
STATUS_RP_SIZE equ 0002h
STATUS_RP_LENGTH equ 0002h
STATUS_RP_MASK equ 0060h
STATUS_IRP_POSN equ 0007h
STATUS_IRP_POSITION equ 0007h
STATUS_IRP_SIZE equ 0001h
STATUS_IRP_LENGTH equ 0001h
STATUS_IRP_MASK equ 0080h
STATUS_RP0_POSN equ 0005h
STATUS_RP0_POSITION equ 0005h
STATUS_RP0_SIZE equ 0001h
STATUS_RP0_LENGTH equ 0001h
STATUS_RP0_MASK equ 0020h
STATUS_RP1_POSN equ 0006h
STATUS_RP1_POSITION equ 0006h
STATUS_RP1_SIZE equ 0001h
STATUS_RP1_LENGTH equ 0001h
STATUS_RP1_MASK equ 0040h
STATUS_CARRY_POSN equ 0000h
STATUS_CARRY_POSITION equ 0000h
STATUS_CARRY_SIZE equ 0001h
STATUS_CARRY_LENGTH equ 0001h
STATUS_CARRY_MASK equ 0001h
STATUS_ZERO_POSN equ 0002h
STATUS_ZERO_POSITION equ 0002h
STATUS_ZERO_SIZE equ 0001h
STATUS_ZERO_LENGTH equ 0001h
STATUS_ZERO_MASK equ 0004h



FSR equ 0004h



PORTA equ 0005h

PORTA_RA0_POSN equ 0000h
PORTA_RA0_POSITION equ 0000h
PORTA_RA0_SIZE equ 0001h
PORTA_RA0_LENGTH equ 0001h
PORTA_RA0_MASK equ 0001h
PORTA_RA1_POSN equ 0001h
PORTA_RA1_POSITION equ 0001h
PORTA_RA1_SIZE equ 0001h
PORTA_RA1_LENGTH equ 0001h
PORTA_RA1_MASK equ 0002h
PORTA_RA2_POSN equ 0002h
PORTA_RA2_POSITION equ 0002h
PORTA_RA2_SIZE equ 0001h
PORTA_RA2_LENGTH equ 0001h
PORTA_RA2_MASK equ 0004h
PORTA_RA3_POSN equ 0003h
PORTA_RA3_POSITION equ 0003h
PORTA_RA3_SIZE equ 0001h
PORTA_RA3_LENGTH equ 0001h
PORTA_RA3_MASK equ 0008h
PORTA_RA4_POSN equ 0004h
PORTA_RA4_POSITION equ 0004h
PORTA_RA4_SIZE equ 0001h
PORTA_RA4_LENGTH equ 0001h
PORTA_RA4_MASK equ 0010h
PORTA_RA5_POSN equ 0005h
PORTA_RA5_POSITION equ 0005h
PORTA_RA5_SIZE equ 0001h
PORTA_RA5_LENGTH equ 0001h
PORTA_RA5_MASK equ 0020h
PORTA_RA6_POSN equ 0006h
PORTA_RA6_POSITION equ 0006h
PORTA_RA6_SIZE equ 0001h
PORTA_RA6_LENGTH equ 0001h
PORTA_RA6_MASK equ 0040h
PORTA_RA7_POSN equ 0007h
PORTA_RA7_POSITION equ 0007h
PORTA_RA7_SIZE equ 0001h
PORTA_RA7_LENGTH equ 0001h
PORTA_RA7_MASK equ 0080h



PORTB equ 0006h

PORTB_RB0_POSN equ 0000h
PORTB_RB0_POSITION equ 0000h
PORTB_RB0_SIZE equ 0001h
PORTB_RB0_LENGTH equ 0001h
PORTB_RB0_MASK equ 0001h
PORTB_RB1_POSN equ 0001h
PORTB_RB1_POSITION equ 0001h
PORTB_RB1_SIZE equ 0001h
PORTB_RB1_LENGTH equ 0001h
PORTB_RB1_MASK equ 0002h
PORTB_RB2_POSN equ 0002h
PORTB_RB2_POSITION equ 0002h
PORTB_RB2_SIZE equ 0001h
PORTB_RB2_LENGTH equ 0001h
PORTB_RB2_MASK equ 0004h
PORTB_RB3_POSN equ 0003h
PORTB_RB3_POSITION equ 0003h
PORTB_RB3_SIZE equ 0001h
PORTB_RB3_LENGTH equ 0001h
PORTB_RB3_MASK equ 0008h
PORTB_RB4_POSN equ 0004h
PORTB_RB4_POSITION equ 0004h
PORTB_RB4_SIZE equ 0001h
PORTB_RB4_LENGTH equ 0001h
PORTB_RB4_MASK equ 0010h
PORTB_RB5_POSN equ 0005h
PORTB_RB5_POSITION equ 0005h
PORTB_RB5_SIZE equ 0001h
PORTB_RB5_LENGTH equ 0001h
PORTB_RB5_MASK equ 0020h
PORTB_RB6_POSN equ 0006h
PORTB_RB6_POSITION equ 0006h
PORTB_RB6_SIZE equ 0001h
PORTB_RB6_LENGTH equ 0001h
PORTB_RB6_MASK equ 0040h
PORTB_RB7_POSN equ 0007h
PORTB_RB7_POSITION equ 0007h
PORTB_RB7_SIZE equ 0001h
PORTB_RB7_LENGTH equ 0001h
PORTB_RB7_MASK equ 0080h



PCLATH equ 000Ah

PCLATH_PCLATH_POSN equ 0000h
PCLATH_PCLATH_POSITION equ 0000h
PCLATH_PCLATH_SIZE equ 0005h
PCLATH_PCLATH_LENGTH equ 0005h
PCLATH_PCLATH_MASK equ 001Fh



INTCON equ 000Bh

INTCON_RBIF_POSN equ 0000h
INTCON_RBIF_POSITION equ 0000h
INTCON_RBIF_SIZE equ 0001h
INTCON_RBIF_LENGTH equ 0001h
INTCON_RBIF_MASK equ 0001h
INTCON_INTF_POSN equ 0001h
INTCON_INTF_POSITION equ 0001h
INTCON_INTF_SIZE equ 0001h
INTCON_INTF_LENGTH equ 0001h
INTCON_INTF_MASK equ 0002h
INTCON_T0IF_POSN equ 0002h
INTCON_T0IF_POSITION equ 0002h
INTCON_T0IF_SIZE equ 0001h
INTCON_T0IF_LENGTH equ 0001h
INTCON_T0IF_MASK equ 0004h
INTCON_RBIE_POSN equ 0003h
INTCON_RBIE_POSITION equ 0003h
INTCON_RBIE_SIZE equ 0001h
INTCON_RBIE_LENGTH equ 0001h
INTCON_RBIE_MASK equ 0008h
INTCON_INTE_POSN equ 0004h
INTCON_INTE_POSITION equ 0004h
INTCON_INTE_SIZE equ 0001h
INTCON_INTE_LENGTH equ 0001h
INTCON_INTE_MASK equ 0010h
INTCON_T0IE_POSN equ 0005h
INTCON_T0IE_POSITION equ 0005h
INTCON_T0IE_SIZE equ 0001h
INTCON_T0IE_LENGTH equ 0001h
INTCON_T0IE_MASK equ 0020h
INTCON_PEIE_POSN equ 0006h
INTCON_PEIE_POSITION equ 0006h
INTCON_PEIE_SIZE equ 0001h
INTCON_PEIE_LENGTH equ 0001h
INTCON_PEIE_MASK equ 0040h
INTCON_GIE_POSN equ 0007h
INTCON_GIE_POSITION equ 0007h
INTCON_GIE_SIZE equ 0001h
INTCON_GIE_LENGTH equ 0001h
INTCON_GIE_MASK equ 0080h
INTCON_TMR0IF_POSN equ 0002h
INTCON_TMR0IF_POSITION equ 0002h
INTCON_TMR0IF_SIZE equ 0001h
INTCON_TMR0IF_LENGTH equ 0001h
INTCON_TMR0IF_MASK equ 0004h
INTCON_TMR0IE_POSN equ 0005h
INTCON_TMR0IE_POSITION equ 0005h
INTCON_TMR0IE_SIZE equ 0001h
INTCON_TMR0IE_LENGTH equ 0001h
INTCON_TMR0IE_MASK equ 0020h



PIR1 equ 000Ch

PIR1_TMR1IF_POSN equ 0000h
PIR1_TMR1IF_POSITION equ 0000h
PIR1_TMR1IF_SIZE equ 0001h
PIR1_TMR1IF_LENGTH equ 0001h
PIR1_TMR1IF_MASK equ 0001h
PIR1_TMR2IF_POSN equ 0001h
PIR1_TMR2IF_POSITION equ 0001h
PIR1_TMR2IF_SIZE equ 0001h
PIR1_TMR2IF_LENGTH equ 0001h
PIR1_TMR2IF_MASK equ 0002h
PIR1_CCP1IF_POSN equ 0002h
PIR1_CCP1IF_POSITION equ 0002h
PIR1_CCP1IF_SIZE equ 0001h
PIR1_CCP1IF_LENGTH equ 0001h
PIR1_CCP1IF_MASK equ 0004h
PIR1_TXIF_POSN equ 0004h
PIR1_TXIF_POSITION equ 0004h
PIR1_TXIF_SIZE equ 0001h
PIR1_TXIF_LENGTH equ 0001h
PIR1_TXIF_MASK equ 0010h
PIR1_RCIF_POSN equ 0005h
PIR1_RCIF_POSITION equ 0005h
PIR1_RCIF_SIZE equ 0001h
PIR1_RCIF_LENGTH equ 0001h
PIR1_RCIF_MASK equ 0020h
PIR1_CMIF_POSN equ 0006h
PIR1_CMIF_POSITION equ 0006h
PIR1_CMIF_SIZE equ 0001h
PIR1_CMIF_LENGTH equ 0001h
PIR1_CMIF_MASK equ 0040h
PIR1_EEIF_POSN equ 0007h
PIR1_EEIF_POSITION equ 0007h
PIR1_EEIF_SIZE equ 0001h
PIR1_EEIF_LENGTH equ 0001h
PIR1_EEIF_MASK equ 0080h



TMR1L equ 000Eh



TMR1H equ 000Fh



T1CON equ 0010h

T1CON_TMR1ON_POSN equ 0000h
T1CON_TMR1ON_POSITION equ 0000h
T1CON_TMR1ON_SIZE equ 0001h
T1CON_TMR1ON_LENGTH equ 0001h
T1CON_TMR1ON_MASK equ 0001h
T1CON_TMR1CS_POSN equ 0001h
T1CON_TMR1CS_POSITION equ 0001h
T1CON_TMR1CS_SIZE equ 0001h
T1CON_TMR1CS_LENGTH equ 0001h
T1CON_TMR1CS_MASK equ 0002h
T1CON_nT1SYNC_POSN equ 0002h
T1CON_nT1SYNC_POSITION equ 0002h
T1CON_nT1SYNC_SIZE equ 0001h
T1CON_nT1SYNC_LENGTH equ 0001h
T1CON_nT1SYNC_MASK equ 0004h
T1CON_T1OSCEN_POSN equ 0003h
T1CON_T1OSCEN_POSITION equ 0003h
T1CON_T1OSCEN_SIZE equ 0001h
T1CON_T1OSCEN_LENGTH equ 0001h
T1CON_T1OSCEN_MASK equ 0008h
T1CON_T1CKPS_POSN equ 0004h
T1CON_T1CKPS_POSITION equ 0004h
T1CON_T1CKPS_SIZE equ 0002h
T1CON_T1CKPS_LENGTH equ 0002h
T1CON_T1CKPS_MASK equ 0030h
T1CON_T1CKPS0_POSN equ 0004h
T1CON_T1CKPS0_POSITION equ 0004h
T1CON_T1CKPS0_SIZE equ 0001h
T1CON_T1CKPS0_LENGTH equ 0001h
T1CON_T1CKPS0_MASK equ 0010h
T1CON_T1CKPS1_POSN equ 0005h
T1CON_T1CKPS1_POSITION equ 0005h
T1CON_T1CKPS1_SIZE equ 0001h
T1CON_T1CKPS1_LENGTH equ 0001h
T1CON_T1CKPS1_MASK equ 0020h



TMR2 equ 0011h



T2CON equ 0012h

T2CON_T2CKPS_POSN equ 0000h
T2CON_T2CKPS_POSITION equ 0000h
T2CON_T2CKPS_SIZE equ 0002h
T2CON_T2CKPS_LENGTH equ 0002h
T2CON_T2CKPS_MASK equ 0003h
T2CON_TMR2ON_POSN equ 0002h
T2CON_TMR2ON_POSITION equ 0002h
T2CON_TMR2ON_SIZE equ 0001h
T2CON_TMR2ON_LENGTH equ 0001h
T2CON_TMR2ON_MASK equ 0004h
T2CON_TOUTPS_POSN equ 0003h
T2CON_TOUTPS_POSITION equ 0003h
T2CON_TOUTPS_SIZE equ 0004h
T2CON_TOUTPS_LENGTH equ 0004h
T2CON_TOUTPS_MASK equ 0078h
T2CON_T2CKPS0_POSN equ 0000h
T2CON_T2CKPS0_POSITION equ 0000h
T2CON_T2CKPS0_SIZE equ 0001h
T2CON_T2CKPS0_LENGTH equ 0001h
T2CON_T2CKPS0_MASK equ 0001h
T2CON_T2CKPS1_POSN equ 0001h
T2CON_T2CKPS1_POSITION equ 0001h
T2CON_T2CKPS1_SIZE equ 0001h
T2CON_T2CKPS1_LENGTH equ 0001h
T2CON_T2CKPS1_MASK equ 0002h
T2CON_TOUTPS0_POSN equ 0003h
T2CON_TOUTPS0_POSITION equ 0003h
T2CON_TOUTPS0_SIZE equ 0001h
T2CON_TOUTPS0_LENGTH equ 0001h
T2CON_TOUTPS0_MASK equ 0008h
T2CON_TOUTPS1_POSN equ 0004h
T2CON_TOUTPS1_POSITION equ 0004h
T2CON_TOUTPS1_SIZE equ 0001h
T2CON_TOUTPS1_LENGTH equ 0001h
T2CON_TOUTPS1_MASK equ 0010h
T2CON_TOUTPS2_POSN equ 0005h
T2CON_TOUTPS2_POSITION equ 0005h
T2CON_TOUTPS2_SIZE equ 0001h
T2CON_TOUTPS2_LENGTH equ 0001h
T2CON_TOUTPS2_MASK equ 0020h
T2CON_TOUTPS3_POSN equ 0006h
T2CON_TOUTPS3_POSITION equ 0006h
T2CON_TOUTPS3_SIZE equ 0001h
T2CON_TOUTPS3_LENGTH equ 0001h
T2CON_TOUTPS3_MASK equ 0040h



CCPR1L equ 0015h



CCPR1H equ 0016h



CCP1CON equ 0017h

CCP1CON_CCP1M_POSN equ 0000h
CCP1CON_CCP1M_POSITION equ 0000h
CCP1CON_CCP1M_SIZE equ 0004h
CCP1CON_CCP1M_LENGTH equ 0004h
CCP1CON_CCP1M_MASK equ 000Fh
CCP1CON_CCP1Y_POSN equ 0004h
CCP1CON_CCP1Y_POSITION equ 0004h
CCP1CON_CCP1Y_SIZE equ 0001h
CCP1CON_CCP1Y_LENGTH equ 0001h
CCP1CON_CCP1Y_MASK equ 0010h
CCP1CON_CCP1X_POSN equ 0005h
CCP1CON_CCP1X_POSITION equ 0005h
CCP1CON_CCP1X_SIZE equ 0001h
CCP1CON_CCP1X_LENGTH equ 0001h
CCP1CON_CCP1X_MASK equ 0020h
CCP1CON_CCP1M0_POSN equ 0000h
CCP1CON_CCP1M0_POSITION equ 0000h
CCP1CON_CCP1M0_SIZE equ 0001h
CCP1CON_CCP1M0_LENGTH equ 0001h
CCP1CON_CCP1M0_MASK equ 0001h
CCP1CON_CCP1M1_POSN equ 0001h
CCP1CON_CCP1M1_POSITION equ 0001h
CCP1CON_CCP1M1_SIZE equ 0001h
CCP1CON_CCP1M1_LENGTH equ 0001h
CCP1CON_CCP1M1_MASK equ 0002h
CCP1CON_CCP1M2_POSN equ 0002h
CCP1CON_CCP1M2_POSITION equ 0002h
CCP1CON_CCP1M2_SIZE equ 0001h
CCP1CON_CCP1M2_LENGTH equ 0001h
CCP1CON_CCP1M2_MASK equ 0004h
CCP1CON_CCP1M3_POSN equ 0003h
CCP1CON_CCP1M3_POSITION equ 0003h
CCP1CON_CCP1M3_SIZE equ 0001h
CCP1CON_CCP1M3_LENGTH equ 0001h
CCP1CON_CCP1M3_MASK equ 0008h



RCSTA equ 0018h

RCSTA_RX9D_POSN equ 0000h
RCSTA_RX9D_POSITION equ 0000h
RCSTA_RX9D_SIZE equ 0001h
RCSTA_RX9D_LENGTH equ 0001h
RCSTA_RX9D_MASK equ 0001h
RCSTA_OERR_POSN equ 0001h
RCSTA_OERR_POSITION equ 0001h
RCSTA_OERR_SIZE equ 0001h
RCSTA_OERR_LENGTH equ 0001h
RCSTA_OERR_MASK equ 0002h
RCSTA_FERR_POSN equ 0002h
RCSTA_FERR_POSITION equ 0002h
RCSTA_FERR_SIZE equ 0001h
RCSTA_FERR_LENGTH equ 0001h
RCSTA_FERR_MASK equ 0004h
RCSTA_ADEN_POSN equ 0003h
RCSTA_ADEN_POSITION equ 0003h
RCSTA_ADEN_SIZE equ 0001h
RCSTA_ADEN_LENGTH equ 0001h
RCSTA_ADEN_MASK equ 0008h
RCSTA_CREN_POSN equ 0004h
RCSTA_CREN_POSITION equ 0004h
RCSTA_CREN_SIZE equ 0001h
RCSTA_CREN_LENGTH equ 0001h
RCSTA_CREN_MASK equ 0010h
RCSTA_SREN_POSN equ 0005h
RCSTA_SREN_POSITION equ 0005h
RCSTA_SREN_SIZE equ 0001h
RCSTA_SREN_LENGTH equ 0001h
RCSTA_SREN_MASK equ 0020h
RCSTA_RX9_POSN equ 0006h
RCSTA_RX9_POSITION equ 0006h
RCSTA_RX9_SIZE equ 0001h
RCSTA_RX9_LENGTH equ 0001h
RCSTA_RX9_MASK equ 0040h
RCSTA_SPEN_POSN equ 0007h
RCSTA_SPEN_POSITION equ 0007h
RCSTA_SPEN_SIZE equ 0001h
RCSTA_SPEN_LENGTH equ 0001h
RCSTA_SPEN_MASK equ 0080h
RCSTA_ADDEN_POSN equ 0003h
RCSTA_ADDEN_POSITION equ 0003h
RCSTA_ADDEN_SIZE equ 0001h
RCSTA_ADDEN_LENGTH equ 0001h
RCSTA_ADDEN_MASK equ 0008h



TXREG equ 0019h



RCREG equ 001Ah



CMCON equ 001Fh

CMCON_CM_POSN equ 0000h
CMCON_CM_POSITION equ 0000h
CMCON_CM_SIZE equ 0003h
CMCON_CM_LENGTH equ 0003h
CMCON_CM_MASK equ 0007h
CMCON_CIS_POSN equ 0003h
CMCON_CIS_POSITION equ 0003h
CMCON_CIS_SIZE equ 0001h
CMCON_CIS_LENGTH equ 0001h
CMCON_CIS_MASK equ 0008h
CMCON_C1INV_POSN equ 0004h
CMCON_C1INV_POSITION equ 0004h
CMCON_C1INV_SIZE equ 0001h
CMCON_C1INV_LENGTH equ 0001h
CMCON_C1INV_MASK equ 0010h
CMCON_C2INV_POSN equ 0005h
CMCON_C2INV_POSITION equ 0005h
CMCON_C2INV_SIZE equ 0001h
CMCON_C2INV_LENGTH equ 0001h
CMCON_C2INV_MASK equ 0020h
CMCON_C1OUT_POSN equ 0006h
CMCON_C1OUT_POSITION equ 0006h
CMCON_C1OUT_SIZE equ 0001h
CMCON_C1OUT_LENGTH equ 0001h
CMCON_C1OUT_MASK equ 0040h
CMCON_C2OUT_POSN equ 0007h
CMCON_C2OUT_POSITION equ 0007h
CMCON_C2OUT_SIZE equ 0001h
CMCON_C2OUT_LENGTH equ 0001h
CMCON_C2OUT_MASK equ 0080h
CMCON_CM0_POSN equ 0000h
CMCON_CM0_POSITION equ 0000h
CMCON_CM0_SIZE equ 0001h
CMCON_CM0_LENGTH equ 0001h
CMCON_CM0_MASK equ 0001h
CMCON_CM1_POSN equ 0001h
CMCON_CM1_POSITION equ 0001h
CMCON_CM1_SIZE equ 0001h
CMCON_CM1_LENGTH equ 0001h
CMCON_CM1_MASK equ 0002h
CMCON_CM2_POSN equ 0002h
CMCON_CM2_POSITION equ 0002h
CMCON_CM2_SIZE equ 0001h
CMCON_CM2_LENGTH equ 0001h
CMCON_CM2_MASK equ 0004h



OPTION_REG equ 0081h

OPTION_REG_PS_POSN equ 0000h
OPTION_REG_PS_POSITION equ 0000h
OPTION_REG_PS_SIZE equ 0003h
OPTION_REG_PS_LENGTH equ 0003h
OPTION_REG_PS_MASK equ 0007h
OPTION_REG_PSA_POSN equ 0003h
OPTION_REG_PSA_POSITION equ 0003h
OPTION_REG_PSA_SIZE equ 0001h
OPTION_REG_PSA_LENGTH equ 0001h
OPTION_REG_PSA_MASK equ 0008h
OPTION_REG_T0SE_POSN equ 0004h
OPTION_REG_T0SE_POSITION equ 0004h
OPTION_REG_T0SE_SIZE equ 0001h
OPTION_REG_T0SE_LENGTH equ 0001h
OPTION_REG_T0SE_MASK equ 0010h
OPTION_REG_T0CS_POSN equ 0005h
OPTION_REG_T0CS_POSITION equ 0005h
OPTION_REG_T0CS_SIZE equ 0001h
OPTION_REG_T0CS_LENGTH equ 0001h
OPTION_REG_T0CS_MASK equ 0020h
OPTION_REG_INTEDG_POSN equ 0006h
OPTION_REG_INTEDG_POSITION equ 0006h
OPTION_REG_INTEDG_SIZE equ 0001h
OPTION_REG_INTEDG_LENGTH equ 0001h
OPTION_REG_INTEDG_MASK equ 0040h
OPTION_REG_nRBPU_POSN equ 0007h
OPTION_REG_nRBPU_POSITION equ 0007h
OPTION_REG_nRBPU_SIZE equ 0001h
OPTION_REG_nRBPU_LENGTH equ 0001h
OPTION_REG_nRBPU_MASK equ 0080h
OPTION_REG_PS0_POSN equ 0000h
OPTION_REG_PS0_POSITION equ 0000h
OPTION_REG_PS0_SIZE equ 0001h
OPTION_REG_PS0_LENGTH equ 0001h
OPTION_REG_PS0_MASK equ 0001h
OPTION_REG_PS1_POSN equ 0001h
OPTION_REG_PS1_POSITION equ 0001h
OPTION_REG_PS1_SIZE equ 0001h
OPTION_REG_PS1_LENGTH equ 0001h
OPTION_REG_PS1_MASK equ 0002h
OPTION_REG_PS2_POSN equ 0002h
OPTION_REG_PS2_POSITION equ 0002h
OPTION_REG_PS2_SIZE equ 0001h
OPTION_REG_PS2_LENGTH equ 0001h
OPTION_REG_PS2_MASK equ 0004h



TRISA equ 0085h

TRISA_TRISA0_POSN equ 0000h
TRISA_TRISA0_POSITION equ 0000h
TRISA_TRISA0_SIZE equ 0001h
TRISA_TRISA0_LENGTH equ 0001h
TRISA_TRISA0_MASK equ 0001h
TRISA_TRISA1_POSN equ 0001h
TRISA_TRISA1_POSITION equ 0001h
TRISA_TRISA1_SIZE equ 0001h
TRISA_TRISA1_LENGTH equ 0001h
TRISA_TRISA1_MASK equ 0002h
TRISA_TRISA2_POSN equ 0002h
TRISA_TRISA2_POSITION equ 0002h
TRISA_TRISA2_SIZE equ 0001h
TRISA_TRISA2_LENGTH equ 0001h
TRISA_TRISA2_MASK equ 0004h
TRISA_TRISA3_POSN equ 0003h
TRISA_TRISA3_POSITION equ 0003h
TRISA_TRISA3_SIZE equ 0001h
TRISA_TRISA3_LENGTH equ 0001h
TRISA_TRISA3_MASK equ 0008h
TRISA_TRISA4_POSN equ 0004h
TRISA_TRISA4_POSITION equ 0004h
TRISA_TRISA4_SIZE equ 0001h
TRISA_TRISA4_LENGTH equ 0001h
TRISA_TRISA4_MASK equ 0010h
TRISA_TRISA5_POSN equ 0005h
TRISA_TRISA5_POSITION equ 0005h
TRISA_TRISA5_SIZE equ 0001h
TRISA_TRISA5_LENGTH equ 0001h
TRISA_TRISA5_MASK equ 0020h
TRISA_TRISA6_POSN equ 0006h
TRISA_TRISA6_POSITION equ 0006h
TRISA_TRISA6_SIZE equ 0001h
TRISA_TRISA6_LENGTH equ 0001h
TRISA_TRISA6_MASK equ 0040h
TRISA_TRISA7_POSN equ 0007h
TRISA_TRISA7_POSITION equ 0007h
TRISA_TRISA7_SIZE equ 0001h
TRISA_TRISA7_LENGTH equ 0001h
TRISA_TRISA7_MASK equ 0080h



TRISB equ 0086h

TRISB_TRISB0_POSN equ 0000h
TRISB_TRISB0_POSITION equ 0000h
TRISB_TRISB0_SIZE equ 0001h
TRISB_TRISB0_LENGTH equ 0001h
TRISB_TRISB0_MASK equ 0001h
TRISB_TRISB1_POSN equ 0001h
TRISB_TRISB1_POSITION equ 0001h
TRISB_TRISB1_SIZE equ 0001h
TRISB_TRISB1_LENGTH equ 0001h
TRISB_TRISB1_MASK equ 0002h
TRISB_TRISB2_POSN equ 0002h
TRISB_TRISB2_POSITION equ 0002h
TRISB_TRISB2_SIZE equ 0001h
TRISB_TRISB2_LENGTH equ 0001h
TRISB_TRISB2_MASK equ 0004h
TRISB_TRISB3_POSN equ 0003h
TRISB_TRISB3_POSITION equ 0003h
TRISB_TRISB3_SIZE equ 0001h
TRISB_TRISB3_LENGTH equ 0001h
TRISB_TRISB3_MASK equ 0008h
TRISB_TRISB4_POSN equ 0004h
TRISB_TRISB4_POSITION equ 0004h
TRISB_TRISB4_SIZE equ 0001h
TRISB_TRISB4_LENGTH equ 0001h
TRISB_TRISB4_MASK equ 0010h
TRISB_TRISB5_POSN equ 0005h
TRISB_TRISB5_POSITION equ 0005h
TRISB_TRISB5_SIZE equ 0001h
TRISB_TRISB5_LENGTH equ 0001h
TRISB_TRISB5_MASK equ 0020h
TRISB_TRISB6_POSN equ 0006h
TRISB_TRISB6_POSITION equ 0006h
TRISB_TRISB6_SIZE equ 0001h
TRISB_TRISB6_LENGTH equ 0001h
TRISB_TRISB6_MASK equ 0040h
TRISB_TRISB7_POSN equ 0007h
TRISB_TRISB7_POSITION equ 0007h
TRISB_TRISB7_SIZE equ 0001h
TRISB_TRISB7_LENGTH equ 0001h
TRISB_TRISB7_MASK equ 0080h



PIE1 equ 008Ch

PIE1_TMR1IE_POSN equ 0000h
PIE1_TMR1IE_POSITION equ 0000h
PIE1_TMR1IE_SIZE equ 0001h
PIE1_TMR1IE_LENGTH equ 0001h
PIE1_TMR1IE_MASK equ 0001h
PIE1_TMR2IE_POSN equ 0001h
PIE1_TMR2IE_POSITION equ 0001h
PIE1_TMR2IE_SIZE equ 0001h
PIE1_TMR2IE_LENGTH equ 0001h
PIE1_TMR2IE_MASK equ 0002h
PIE1_CCP1IE_POSN equ 0002h
PIE1_CCP1IE_POSITION equ 0002h
PIE1_CCP1IE_SIZE equ 0001h
PIE1_CCP1IE_LENGTH equ 0001h
PIE1_CCP1IE_MASK equ 0004h
PIE1_TXIE_POSN equ 0004h
PIE1_TXIE_POSITION equ 0004h
PIE1_TXIE_SIZE equ 0001h
PIE1_TXIE_LENGTH equ 0001h
PIE1_TXIE_MASK equ 0010h
PIE1_RCIE_POSN equ 0005h
PIE1_RCIE_POSITION equ 0005h
PIE1_RCIE_SIZE equ 0001h
PIE1_RCIE_LENGTH equ 0001h
PIE1_RCIE_MASK equ 0020h
PIE1_CMIE_POSN equ 0006h
PIE1_CMIE_POSITION equ 0006h
PIE1_CMIE_SIZE equ 0001h
PIE1_CMIE_LENGTH equ 0001h
PIE1_CMIE_MASK equ 0040h
PIE1_EEIE_POSN equ 0007h
PIE1_EEIE_POSITION equ 0007h
PIE1_EEIE_SIZE equ 0001h
PIE1_EEIE_LENGTH equ 0001h
PIE1_EEIE_MASK equ 0080h



PCON equ 008Eh

PCON_nBOR_POSN equ 0000h
PCON_nBOR_POSITION equ 0000h
PCON_nBOR_SIZE equ 0001h
PCON_nBOR_LENGTH equ 0001h
PCON_nBOR_MASK equ 0001h
PCON_nPOR_POSN equ 0001h
PCON_nPOR_POSITION equ 0001h
PCON_nPOR_SIZE equ 0001h
PCON_nPOR_LENGTH equ 0001h
PCON_nPOR_MASK equ 0002h
PCON_OSCF_POSN equ 0003h
PCON_OSCF_POSITION equ 0003h
PCON_OSCF_SIZE equ 0001h
PCON_OSCF_LENGTH equ 0001h
PCON_OSCF_MASK equ 0008h
PCON_nBO_POSN equ 0000h
PCON_nBO_POSITION equ 0000h
PCON_nBO_SIZE equ 0001h
PCON_nBO_LENGTH equ 0001h
PCON_nBO_MASK equ 0001h
PCON_nBOD_POSN equ 0000h
PCON_nBOD_POSITION equ 0000h
PCON_nBOD_SIZE equ 0001h
PCON_nBOD_LENGTH equ 0001h
PCON_nBOD_MASK equ 0001h



PR2 equ 0092h



TXSTA equ 0098h

TXSTA_TX9D_POSN equ 0000h
TXSTA_TX9D_POSITION equ 0000h
TXSTA_TX9D_SIZE equ 0001h
TXSTA_TX9D_LENGTH equ 0001h
TXSTA_TX9D_MASK equ 0001h
TXSTA_TRMT_POSN equ 0001h
TXSTA_TRMT_POSITION equ 0001h
TXSTA_TRMT_SIZE equ 0001h
TXSTA_TRMT_LENGTH equ 0001h
TXSTA_TRMT_MASK equ 0002h
TXSTA_BRGH_POSN equ 0002h
TXSTA_BRGH_POSITION equ 0002h
TXSTA_BRGH_SIZE equ 0001h
TXSTA_BRGH_LENGTH equ 0001h
TXSTA_BRGH_MASK equ 0004h
TXSTA_SYNC_POSN equ 0004h
TXSTA_SYNC_POSITION equ 0004h
TXSTA_SYNC_SIZE equ 0001h
TXSTA_SYNC_LENGTH equ 0001h
TXSTA_SYNC_MASK equ 0010h
TXSTA_TXEN_POSN equ 0005h
TXSTA_TXEN_POSITION equ 0005h
TXSTA_TXEN_SIZE equ 0001h
TXSTA_TXEN_LENGTH equ 0001h
TXSTA_TXEN_MASK equ 0020h
TXSTA_TX9_POSN equ 0006h
TXSTA_TX9_POSITION equ 0006h
TXSTA_TX9_SIZE equ 0001h
TXSTA_TX9_LENGTH equ 0001h
TXSTA_TX9_MASK equ 0040h
TXSTA_CSRC_POSN equ 0007h
TXSTA_CSRC_POSITION equ 0007h
TXSTA_CSRC_SIZE equ 0001h
TXSTA_CSRC_LENGTH equ 0001h
TXSTA_CSRC_MASK equ 0080h



SPBRG equ 0099h



EEDATA equ 009Ah



EEADR equ 009Bh



EECON1 equ 009Ch

EECON1_RD_POSN equ 0000h
EECON1_RD_POSITION equ 0000h
EECON1_RD_SIZE equ 0001h
EECON1_RD_LENGTH equ 0001h
EECON1_RD_MASK equ 0001h
EECON1_WR_POSN equ 0001h
EECON1_WR_POSITION equ 0001h
EECON1_WR_SIZE equ 0001h
EECON1_WR_LENGTH equ 0001h
EECON1_WR_MASK equ 0002h
EECON1_WREN_POSN equ 0002h
EECON1_WREN_POSITION equ 0002h
EECON1_WREN_SIZE equ 0001h
EECON1_WREN_LENGTH equ 0001h
EECON1_WREN_MASK equ 0004h
EECON1_WRERR_POSN equ 0003h
EECON1_WRERR_POSITION equ 0003h
EECON1_WRERR_SIZE equ 0001h
EECON1_WRERR_LENGTH equ 0001h
EECON1_WRERR_MASK equ 0008h



EECON2 equ 009Dh



VRCON equ 009Fh

VRCON_VR_POSN equ 0000h
VRCON_VR_POSITION equ 0000h
VRCON_VR_SIZE equ 0004h
VRCON_VR_LENGTH equ 0004h
VRCON_VR_MASK equ 000Fh
VRCON_VRR_POSN equ 0005h
VRCON_VRR_POSITION equ 0005h
VRCON_VRR_SIZE equ 0001h
VRCON_VRR_LENGTH equ 0001h
VRCON_VRR_MASK equ 0020h
VRCON_VROE_POSN equ 0006h
VRCON_VROE_POSITION equ 0006h
VRCON_VROE_SIZE equ 0001h
VRCON_VROE_LENGTH equ 0001h
VRCON_VROE_MASK equ 0040h
VRCON_VREN_POSN equ 0007h
VRCON_VREN_POSITION equ 0007h
VRCON_VREN_SIZE equ 0001h
VRCON_VREN_LENGTH equ 0001h
VRCON_VREN_MASK equ 0080h
VRCON_VR0_POSN equ 0000h
VRCON_VR0_POSITION equ 0000h
VRCON_VR0_SIZE equ 0001h
VRCON_VR0_LENGTH equ 0001h
VRCON_VR0_MASK equ 0001h
VRCON_VR1_POSN equ 0001h
VRCON_VR1_POSITION equ 0001h
VRCON_VR1_SIZE equ 0001h
VRCON_VR1_LENGTH equ 0001h
VRCON_VR1_MASK equ 0002h
VRCON_VR2_POSN equ 0002h
VRCON_VR2_POSITION equ 0002h
VRCON_VR2_SIZE equ 0001h
VRCON_VR2_LENGTH equ 0001h
VRCON_VR2_MASK equ 0004h
VRCON_VR3_POSN equ 0003h
VRCON_VR3_POSITION equ 0003h
VRCON_VR3_SIZE equ 0001h
VRCON_VR3_LENGTH equ 0001h
VRCON_VR3_MASK equ 0008h
# 1067 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\proc\\pic16f628a.inc" 3
psect udata_shr,class=COMMON,space=1,noexec
psect udata,class=RAM,space=1,noexec
psect udata_bank0,class=BANK0,space=1,noexec
psect udata_bank1,class=BANK1,space=1,noexec
psect udata_bank2,class=BANK2,space=1,noexec
psect code,class=CODE,space=0,delta=2
psect data,class=STRCODE,space=0,delta=2,noexec
psect edata,class=EEDATA,space=3,delta=2,noexec
# 2354 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\pic_as_chip_select.inc" 2 3
# 4 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\pic.inc" 2 3




stk_offset SET 0
auto_size SET 0


; stack_auto defines a symbol /name/_offset which equates to the
; stack offset of the auto object in question

stack_auto MACRO name, size
name&_offset EQU stk_offset-size
stk_offset SET name&_offset
auto_size SET -stk_offset
ENDM


; stack_param defines a symbol /name/_offset which equates to the
; stack offset of the parameter object in question

stack_param MACRO name, size
name&_offset EQU stk_offset-size
stk_offset SET name&_offset
ENDM


; alloc_stack adjusts the SP to allocate space for auto objects
; it also links in to the btemp symbol so that can be used

alloc_stack MACRO
GLOBAL btemp
addfsr FSR1,auto_size
ENDM


; restore_stack adjusts the SP to remove all auto and parameter
; objects from the stack prior to returning from a function

restore_stack MACRO
addfsr FSR1,stk_offset
stk_offset SET 0
auto_size SET 0
ENDM
# 7 "C:\\Program Files\\Microchip\\xc8\\v2.40\\pic\\include\\xc.inc" 2 3
# 51 "counter.s" 2


 ; DEBUG=1 for simulation, DEBUG=0 for real hardware


; Selection of LED display control bits... since 2005, three different variants.
; Select ONE OF THESE in MPLAB under "Project".."Build Options".."Macro Definitions"!
; DISP_VARIANT=1 : first prototype, PIC on left side of display
; DISP_VARIANT=2 : second prototype, separated PIC and display board
; DISP_VARIANT=3 : similar as (2), but for COMMON CATHODE display
; Unfortunately it seems impossible to assign a NUMERIC VALUE to a macro
; in MPLAB (not in MPASM!) ....
# 75 "counter.s"
 ; added 2005-03-21 :






   ; default: 5 digits, new layout, COMMON CATHODE



   MESSG "Using default: 5 digits, new pin layout, common cathode LEDs"




;NK Define EXT_CLOCK to state that you are using an external oscillator on
;OSC1 pin (16F628 pin 16), so OSC2 pin (15) is not needed and can be used
;as ((PORTA) and 07Fh), 6 to control display digit 5 instead of the transistor/diode NAND gate.






;**************************************************************************
; *
; Summary *
; *
;**************************************************************************

; The software functions as a frequency meter with an input signal
; range of 1 Hz to ~ 50 MHz and with an accuracy of +/- 1Hz
; if the oscillator crystal is properly trimmed .

; Signal pulses are counted over a fixed time interval of 1/4 second to
; 1 second (gate time). High frequency pulses are counted over 1/4 s
; to make the meter more responsive with no loss of displayed accuracy.

; Pulses are counted using Timer 0 of the PIC,
; which is set to increment on rising edges on the TMR0 pin. The 8-bit
; hardware register is extended by software into a 32-bit pulse counter.
; If timer 0 rolls over (msb 1 -> 0) between successive polls then the
; high two bytes of the pulse counter are incremented.

; Timer 0 is unable to count more than one pulse per instruction cycle
; (per 4 clock cycles) so the prescaler is used at frequencies above
; 1MHz (4MHz clock / 4) and also to ensure that pulses are not lost
; between polls of timer 0 (which would happen if more than 128 pulses were
; received). Fortunately the prescaler is an asynchronous counter
; which works up to a few ten MHz (sometimes as far as 60 MHz) .

; Timing is based on a software loop of known execution period . The loop
; time is 50 or 20 us which gives integer counts to time 1 s and 1/4 s .
; During this timing loop, the multiplexed LED display is updated .

; The frequency in binary is converted to decimal using a powers-of-ten
; lookup table. The binary powers of ten are repeatedly subtracted from
; the frequency to determine the individual decimal digits. The decimal
; digits are stored at the 8 bytes at 'digits'. Leading zeroes are then
; suppressed and the 4 (or 5) significant digits are converted to LED data
; for the 7-segment displays using a lookup table.

; The signal frequency is displayed on four (or five) 7-segment displays.
; The displays are multiplexed which means that only one display is enabled
; at any one time. The variable 'disp_index' contains the index of the currently
; enabled display. Each display is enabled in turn at a sufficient frequency
; that no flicker is discernable. A prescaler ('disp_timer') is used
; to set the multiplexing frequency to a few hundred Hz.

; The display shows the signal frequency in KHz or MHz, according to the
; following table:

; --------------------------
; | Frequency | Display |
; --------------------------
; | < 1Hz | 0 |
; | 1Hz | 0.001[0] | Note: kHz-dot is flashing (blinking)
; | 10Hz | 0.010[0] |
; | 100Hz | 0.100[0] |
; | 1.000KHz | 1.000[0] |
; | 10.00KHz | 10.00[0] |
; | 100.0KHz | 100.0[0] |
; | 1.000MHz | 1.000[0] | Note: MHz-dot is steady (not blinking)
; | 10.00MHz | 10.00[0] |
; --------------------------

; If there is no signal at all, a single zero is displayed in the 4th(!) digit.
; Overflows are not displayed because they cannot be detected !

;**************************************************************************
; *
; PIC config definitions *
; *
;**************************************************************************

; CONFIG directive is used to embed configuration data within .s file.
; The lable following the directive is located in the xc.inc file.
; See respective data sheet for additional information on configuration word.
; Since 2006-05-28, the watchdog must be ENABLE in the config word
; because of its wakeup-from-sleep function (see 'Sleep100ms') .
; EX(16F84:)
; CONFIG FOSC = RC
; CONFIG WDTE = ON
; CONFIG PWRTE = ON
; CONFIG CP = OFF

;NK If using an external clock source, use the 0 definition.

  ; display variant 1 : clocked with 4 MHz (low power, "XT" )




    CONFIG FOSC = HS





; Other CONFIG directives valid for each display variants
CONFIG WDTE = ON
CONFIG PWRTE = ON
CONFIG MCLRE = OFF
CONFIG BOREN = OFF
CONFIG LVP = OFF
CONFIG CPD = OFF
CONFIG CP = OFF

; TODO: Eliminare *************************************************************
; '__IDLOCS' directive may be used to set the 4 * 4(?!?) ID Location Bits .
; These shall be placed in the HEX file at addresses 0x2000...0x2003 .
   ;__IDLOCS H'1234'
;CONFIG IDLOC0 = 0x15
; *************************************************************

;**************************************************************************
; *
; Port assignments *
; *
;**************************************************************************

PORT_A_IO equ 0b0000 ; port A I/O mode (all output)
PORT_B_IO equ 0b00000000 ; port B I/O mode (all output)

LEDS_PORT equ PORTB ; 7-segment LEDs port

ENABLE_PORT equ PORTA ; display enable port
  ; Bitmasks to control the digit outputs have been moved to enable_table .
  ; YHF: Note that 'display #0 is the MOST SIGNIFICANT digit !




;**************************************************************************
; *
; Constants and timings *
; *
;**************************************************************************

; processor clock frequency in Hz (4MHz)
; display variant 1 : clocked with 4 MHz (low power consumption)




    CLOCK equ 20000000


; microseconds per timing loop
; display variant 1 : clocked with 4 MHz
# 255 "counter.s"
  ; 20 microseconds is impossible with 4-MHz-Crystal, so use 50 us instead !
  ; Make sure all gate times can be divided by this interval without remainder :
  ; 1 second / 20 us = 50000 (ok)
  ; 1/4 second / 20 us = 12500 (ok)
  ; 1/8 second / 50 us = 6250 (ok)
    TIME equ 20
; variant 1 or 2+3 ?


; Clock cycles per timing loop. See subroutine count_pulses .
; Usually CYCLES=200 (for 4 MHz crystal, 50 usec - loop)
; or 400 (for 20 MHz crystal, 20 usec - loop)
CYCLES equ TIME*CLOCK/1000000

GATE_TIME_LOOPS equ CLOCK/CYCLES ; number of gate-time loops for ONE SECOND gate time

LAMPTEST_LOOPS equ CLOCK/(2*CYCLES) ; number of loops for a 0.5 SECOND lamp test after power-on

PROGMODE_LOOPS equ CLOCK/(10*CYCLES) ; number of delay loops for display in PROGRAMMING MODE (0.1 sec)

; Configuration of power-saving mode :



    PSAVE_DELAY_TIME equ 60 ; number of 0.25-sec-intervals before turning off (some dozen seconds)

PSAVE_FLASHUP_TIME equ 14 ; number of 0.7(!)-second-intervals between two flashes in power-saving mode
PSAVE_MAX_DIFF equ 10 ; maximum frequency difference (range-dependent, see below)
     ; Unit: N times "frequency-resolution", see frequency-range table .
     ; Example: PSAVE_MAX_DIFF=10 means 10*4Hz in Range 1 (1..3.4 MHz) .


; Menu Indices ... must match the jump table PMDisplay + PMExecute !
MI_QUIT equ 0 ; exit from menu
MI_PSAVE equ 1 ; turn "power save"-option on and off
MI_ADD equ 2 ; save frequency offset to ADD it from now on
MI_SUB equ 3 ; save frequency offset to SUBTRACT it from now on
MI_ZERO equ 4 ; set the frequency offset to ((STATUS) and 07Fh), 2 and leave menu
MI_STD_IF equ 5 ; jump into the STANDARD INTERMEDIATE FREQUENCY table..
MI_INDEX_MAX equ 5 ; normal menu indices up to MI_INDEX_MAX .
MI_IF_1 equ 6 ; show the 1st standard IF
MI_IF_2 equ 7 ; show the 2nd standard IF
MI_IF_3 equ 8 ; show the 3rd standard IF
MI_IF_4 equ 9 ; show the 4th standard IF
MI_IF_5 equ 0x0A ; show the 5th standard IF
MI_IF_6 equ 0x0B ; show the 6th standard IF
MI_IF_QT equ 0x0C ; exit standard IF menu without changing anything
MI_IF_SUBMENU_MAX equ 0x0B
;MI_IF_5 equ 0x0A ; show the 4th standard IF
;MI_IF_QT equ 0x0B ; exit standard IF menu without changing anything
;MI_IF_SUBMENU_MAX equ 0x0A



;**************************************************************************
; *
; File register usage *
; *
;**************************************************************************


; RAM memory (general purpose registers, unfortunately not the same for PIC16F84 & PIC16F628)
; in PIC16F628: RAM from 0x20..0x7F (96 bytes, 0x20.. only accessable in Bank0)
; 0xA0..0xEF (another 80 bytes in Bank1)
; 0x120..0x14F (another 48 bytes in Bank2)
; 0x0F0..0x0FF, 0x170..0x17F , 0x1F0..0x1FF are mapped to 0x70..0x7F (same in all banks)
; So use 0x70..0x7F for context saving in the PIC16F628 and forget 0x0F0.. 0xNNN !
;
; Note on the 32-bit integer arithmetics as used in this code:
; - They begin with MOST SIGNIFICANT BYTE in memory, but...
; - Every byte location has its own label here, which makes debugging
; with Microchip's simulator much easier (point the mouse on the name
; of a variable to see what I mean !)
;

tens_index equ 0x27 ; index into the powers-of-ten table
divi equ 0x28 ; power of ten (32 bits)
divi_hi equ 0x28 ; same as 'divi' : HIGH byte
divi_mh equ 0x29 ; MEDIUM HIGH byte
divi_ml equ 0x2A ; MEDIUM LOW byte
divi_lo equ 0x2B ; LOW byte

timer0_old equ 0x2C ; previous reading from timer0 register

gatecnt_hi equ 0x2D ; 16-bit counter (msb first)
gatecnt_lo equ 0x2E ; 16-bit counter (lsb last)

bTemp equ 0x2F ; temporary 8-bit register,
                              ; may be overwritten in ALL subroutines

freq equ 0x30 ; frequency in binary (32 bits)....
freq_hi equ 0x30 ; same location, begins with HIGH byte
freq_mh equ 0x31 ; ... medium high byte
freq_ml equ 0x32 ; ... medium low byte
freq_lo equ 0x33 ; ... low byte

freq2 equ 0x34 ; frequency too, copied for programming mode
freq2_hi equ 0x34 ; same location, begins with HIGH byte
freq2_mh equ 0x35 ; ... medium high byte
freq2_ml equ 0x36 ; ... medium low byte
freq2_lo equ 0x37 ; ... low byte

foffs equ 0x38 ; frequency too, copied for programming mode
foffs_hi equ 0x38 ; same location, begins with HIGH byte
foffs_mh equ 0x39 ; ... medium high byte
foffs_ml equ 0x3A ; ... medium low byte
foffs_lo equ 0x3B ; ... low byte


menu_index equ 0x3C ; menu item for programming mode
menu_timer equ 0x3D ; used to detect how long a key was pressed

digits equ 0x40 ; frequency as decimal digits (8 bytes)...
digit_0 equ 0x40 ; same location as MOST SIGNIFICANT digit, 10-MHz
digit_1 equ 0x41 ; usually the 1-MHz-digit
digit_2 equ 0x42 ; usually the 100-kHz-digit
digit_3 equ 0x43 ; usually the 10-kHz-digit
digit_4 equ 0x44 ; usually the 1-kHz-digit
digit_5 equ 0x45 ; usually the 100-Hz-digit
digit_6 equ 0x46 ; usually the 10-Hz-digit
digit_7 equ 0x47 ; usually the 1-Hz-digit
digit_8 equ 0x48 ; must contain a blank character (or trailing zero)

display0 equ 0x49 ; display #0 data
display1 equ 0x4A ; display #1 data
display2 equ 0x4B ; display #2 data
display3 equ 0x4C ; display #3 data
display4 equ 0x4D ; display #4 data

disp_index equ 0x4E ; index of the enabled display (0 to 4 for 5-digit display)
disp_timer equ 0x4F ; display multiplex timer (5 bits)

adjust_shifts equ 0x50 ; count of 'left shifts' to compensate prescaler+gate time

blinker equ 0x51 ; prescaler for the flashing 1-kHz-dot

psave_timer equ 0x52 ; timer for power-save mode (incremented every 0.25 seconds)
psave_freq_lo equ 0x53 ; low-byte of frequency to detect changes for power-save mode
psave_flags equ 0x54 ; power-saving flags with the following bits:

; clear:normal mode, set:power-saving in action (display blanked)


options equ 0x55 ; display options with the following flag-bits:
; clear:normal mode, set:power-saving mode enabled


;**************************************************************************
; *
; Macros (1) *
; *
;**************************************************************************

eep_dw MACRO value ; a DOUBLEWORD split into 4 bytes in the PIC's DATA EEPROM
    db (value>>24),(value>>16) and 0xFF,(value>>8) and 0xFF,value and 0xFF
        ENDM


;**************************************************************************
; *
; EEPROM memory definitions *
; *
;**************************************************************************

  ; for PIC16F84: 0x00..0x3F were valid EEPROM locations (64 byte)
  ; for PIC16F628: 0x00..0x7F are valid EEPROM locations (128 byte)
; EEPROM location for frequency offset

; EEPROM location for standard IF table (4*4 byte)

; EEPROM location for "options" (flags)


; Initial contents of DATA EEPROM:
; PSECT edata set the current position to first EEPROM byte position
  PSECT edata
; CALL eep_dw (32 bit write macro: 4 byte for each call)
; start from 0x00
    eep_dw 0 ; [00..03] initial frequency offset = ((STATUS) and 07Fh), 2
; start from 0x04
    eep_dw 455000 ; [04..07] frequently used in old AM radios
    eep_dw 3999000 ; [08..0B] used in "Miss Mosquita" (DK1HE / DL QRP AG)
    eep_dw 4194304 ; [0C..0F] used in other homebrew amateur radio receivers
    eep_dw 4433619 ; [10..13] sometimes used in homebrew amateur radio receivers
    eep_dw 10695000 ; [14..17] common CB Radio IF (Galaxy Pluto, President Jackson, ecc...)
    eep_dw 10700000 ; [18..1F] frequently used in old FM radios
; start from 0x20
    db 0 ; [20] "options" (flags), cleared by default


;**************************************************************************
; *
; Ex OPCODE MPLAB 8 Macros *
; *
;**************************************************************************
; skpnc
skpnc macro
 btfsc ((STATUS) and 07Fh), 0
      endm

; skpc
skpc macro
 btfss ((STATUS) and 07Fh), 0
      endm

; skpz
skpz macro
 btfss ((STATUS) and 07Fh), 2
      endm

; skpnz
skpnz macro
 btfsc ((STATUS) and 07Fh), 2
      endm

; tstf
tstf macro addr
 movf addr
      endm

; clrc
clrc macro
 bcf STATUS,STATUS_C_POSITION
      endm

; bc
bc macro addr
 btfsc STATUS,STATUS_C_POSITION
  goto addr
      endm

; bnc
bnc macro addr
 btfss STATUS,STATUS_C_POSITION
 goto addr
      endm

; bnz
bnz macro addr
 btfss STATUS,STATUS_Z_POSITION
 goto addr
      endm

; setc
setc macro
 bsf STATUS,STATUS_C_POSITION
      endm

; bz
bz macro addr
 btfsc STATUS,STATUS_Z_POSITION
 goto addr
      endm


 ;**************************************************************************
; *
; More Macros *
; *
;**************************************************************************

;--------------------------------------------------------------------------
; macros to implement lookup tables - these macros hide the PIC syntax
; used and make the source code more readable
; (YHF: CAUTION - BUT THESE MACROS HIDE SOME VERY NASTY PITFALLS .
; TABLE MUST NOT CROSS PAGE BORDER DUE TO 'ADDWF PCL, f' ! )
;--------------------------------------------------------------------------

cquad macro value
          retlw value>>24 ; high byte
          retlw (value>>16) and 0xFF ; middle-high byte
          retlw (value>>8) and 0xFF ; middle-low byte
          retlw value and 0xFF ; low byte
       endm

table macro label ; define lookup table
 label addwf PCL,f ; caution: this is 'PCL' only, cannot add to the full 'PC' in a PIC !
       endm


;--------------------------------------------------------------------------
; add with carry - adds the w register and the carry flag to the file
; register reg, returns the result in <reg> with the carry flag set if overflow
;--------------------------------------------------------------------------

addcwf macro reg
     local add1,add2
     bnc add1 ; branch if no carry set
     addwf reg,f ; add byte
     incf reg,f ; add carry
     skpnz
     setc
     goto add2
     add1:
  addwf reg,f ; add byte
     add2:
          endm


;--------------------------------------------------------------------------
; subtract with "no-carry" - subtracts the w register and the no-carry flag
; from the file register reg, returns the result in reg with the no carry flag
; set if underflow
;--------------------------------------------------------------------------

subncwf macro reg

          local sub1,sub2

          bc sub1 ; branch if carry set
          subwf reg,f ; subtract byte
          skpnz ; subtract no carry
          clrc
          decf reg,f
          goto sub2
sub1:
   subwf reg,f ; subtract byte
sub2:
          endm


;--------------------------------------------------------------------------
; MACRO to perform 32-bit addition - adds the four bytes at op2 to the
; three bytes at op1 (most significant bytes first), returns the result in
; op1 with op2 unchanged and the carry flag set if overflow
;--------------------------------------------------------------------------

add32 macro op1,op2 ; op1 := op1 + op2

          movf op2+3,w ; add low byte (bits 7...0)
          addwf op1+3,f

          movf op2+2,w ; add middle-low byte (bits 15..8)
          addcwf op1+2

          movf op2+1,w ; add middle-high byte (bits 23...16)
          addcwf op1+1

          movf op2+0,w ; add high byte (bits 31...24)
          addcwf op1+0

        endm


;--------------------------------------------------------------------------
; MACRO to perform 32-bit subtraction - subtracts the four bytes at op2
; from the four bytes at op1 (most significant bytes first), returns the
; result in op1 with op2 unchanged and the no carry flag set if underflow
;--------------------------------------------------------------------------

sub32 macro op1,op2 ; op1 := op1 - op2

          movf op2+3,w ; subtract low byte
          subwf op1+3,f

          movf op2+2,w ; subtract middle low byte
          subncwf op1+2

          movf op2+1,w ; subtract middle high byte
          subncwf op1+1

          movf op2+0,w ; subtract high byte
          subncwf op1+0

        endm


;--------------------------------------------------------------------------
; MACRO to negate a 32-bit value ( op := 0 - op ) .
;--------------------------------------------------------------------------

neg32 macro op ; op1 := 0 - op2
       local neg_done
           comf op, f ; invert all 8 bits in high byte
           comf op+1, f ; invert all 8 bits in middle high byte
           comf op+2, f ; invert all 8 bits in middle low byte
           comf op+3, f ; invert all 8 bits in low byte
           ; Note at this point 0x000000 would have turned into 0xFFFFFFF .
           ; Must add ONE to complete the TWO's COMPLIMENT calculation ( -0  = 0 ).
           ; Note that "incf" affects only the Z flag but not the C flag .
           incfsz op+3, f ; increment low byte (bits 7...0)
           goto neg_done ; if incremented result NOT zero, we're through !
           incfsz op+2, f ; increment middle low byte (bits 15...8)
           goto neg_done ; if incremented result NOT zero, ...
           incfsz op+1, f ; increment middle high byte (bits 23...16)
           goto neg_done ; if ...
           incfsz op+0, f ; increment high byte (bits 31...24)
           goto neg_done ;
neg_done:
       endm



;**********************************************************************
    ; Start Program (entry point) resetVec (reset vector) in 0x00
    ; ex ORG 0x00
    ; Remember to set "-Wl,-PresetVec=0x0" in the pic-as global options
    ; (Additional Options) of Project Properties
    PSECT resetVec,class=CODE,delta=2

    ; resetVec label
    resetVec:
 goto MainInit ; go to beginning of program
; (begin of ROM is too precious to waste for ordinary code, see below...)



;**************************************************************************
; *
; Lookup tables *
; Must be at the start of the code memory to avoid crossing pages !! *
; *
;**************************************************************************

;--------------------------------------------------------------------------
; 7-segment LED data table
;--------------------------------------------------------------------------

    ; Index 0..9 used for decimal numbers, all other indices defined below :
CHAR_A equ 10 ; Letters A..F = HEX digits, index 10..15
CHAR_b equ 11 ;
CHAR_c equ 12 ;
CHAR_d equ 13 ;
CHAR_E equ 14 ;
CHAR_F equ 15 ;
CHAR_G equ 16 ; Other letters used in "programming" mode
CHAR_H equ 17 ;
CHAR_i equ 18 ;

BLANK equ 19 ; blank display
TEST equ 20 ; power-on display test

CHAR_P equ 21 ; A few other letters for programming mode...
CHAR_r equ 22 ;
CHAR_o equ 23 ; "Prog"
CHAR_Q equ 24 ; "Quit"
CHAR_u equ 25 ;
CHAR_t equ 26 ;
CHAR_S equ 27 ; "Sub"
CHAR_Z equ 28 ; "ZEro"
CHAR_I equ 29 ; large "I" (left aligned!) for "IF"
CHAR_J equ 30 ;
CHAR_k equ 31 ;
CHAR_L equ 32 ;
CHAR_N equ 33 ;
CHAR_V equ 34 ;
CHAR_EQ equ 35 ; "="
# 718 "counter.s"
    DPPOINT_BIT equ 1 ; decimal point bit (same for all digits)
    ; bitmask for segment A , etc ..
# 728 "counter.s"
; DISPLAY VARIANT #2 + #3



BLANK_PATTERN equ 0b00000000 ; blank display pattern (7-segment code)


;-----------------------------------------------------------------------------
; Table to convert a decimal digit or a special character into 7-segment-code
; Note: In DL4YHF's PIC counter, all digits have the same segment connections,
; so we do not need individual conversion tables for all segments.
;
; AAAA
; F B
; F B
; GGGG
; E C
; E C
; DDDD DP
;
;-----------------------------------------------------------------------------
Digit2SevenSeg:




    ; for COMMON CATHODE: No bitwise EXOR to the pattern



    addwf PCL,F ; caution: this is 'PCL' only, not 'PC'. Beware of page borders.
          ; A = 0, B = 1, C = 5, D = 3, E = 2, F = 6, G = 7, DP = 4

   retlw (0x40 +0x80 +0x04 +0x01 +0x08 +0x10 )^0x00 ; ABCDEF. = '0' ( # 0 )
          retlw ( 0x80 +0x04 )^0x00 ; .BC.... = '1' ( # 1 )
          retlw (0x40 +0x80 +0x01 +0x08 +0x20)^0x00 ; AB.DE.G = '2' ( # 2 )
          retlw (0x40 +0x80 +0x04 +0x01 +0x20)^0x00 ; ABCD..G = '3' ( # 3 )
          retlw ( 0x80 +0x04 +0x10 +0x20)^0x00 ; .BC..FG = '4' ( # 4 )
          retlw (0x40 +0x04 +0x01 +0x10 +0x20)^0x00 ; A.CD.FG = '5' ( # 5 )
          retlw (0x40 +0x04 +0x01 +0x08 +0x10 +0x20)^0x00 ; A.CDEFG = '6' ( # 6 )
          retlw (0x40 +0x80 +0x04 )^0x00 ; ABC.... = '7' ( # 7 )
          retlw (0x40 +0x80 +0x04 +0x01 +0x08 +0x10 +0x20)^0x00 ; ABCDEFG = '8' ( # 8 )
          retlw (0x40 +0x80 +0x04 +0x01 +0x10 +0x20)^0x00 ; ABCD.FG = '9' ( # 9 )
          retlw (0x40 +0x80 +0x04 +0x08 +0x10 +0x20)^0x00 ; ABC.EFG = 'A' ( # 10 )
          retlw ( 0x04 +0x01 +0x08 +0x10 +0x20)^0x00 ; ..CDEFG = '0b    ( # 11 )
          retlw ( 0x01 +0x08 +0x20)^0x00 ; ...DE.G = 'c' ( # 12 )
          retlw ( 0x80 +0x04 +0x01 +0x08 +0x20)^0x00 ; .BCDE.G = 'd' ( # 13 )
          retlw (0x40 +0x01 +0x08 +0x10 +0x20)^0x00 ; A..DEFG = 'E' ( # 14 )
          retlw (0x40 +0x08 +0x10 +0x20)^0x00 ; A...EFG = 'F' ( # 15 )
          retlw (0x40 +0x04 +0x01 +0x08 +0x10 )^0x00 ; A.CDEF. = 'G' ( # 16 )
          retlw ( 0x80 +0x04 +0x08 +0x10 +0x20)^0x00 ; .BC.EFG = 'H' ( # 17 )
          retlw ( 0x08 )^0x00 ; ....E.. = 'i' ( # 18 )

          retlw (BLANK_PATTERN )^0x00 ; ....... = ' ' ( # 19 )
          retlw (0b11111111 )^0x00 ; all segments on ( # 20 )

          ; A few more letters for programming mode :
          retlw (0x40 +0x80 +0x08 +0x10 +0x20)^0x00 ; AB..EFG = 'P' ( # 21 )
          retlw ( 0x08 +0x20)^0x00 ; ....E.G = 'r' ( # 22 )
          retlw ( 0x04 +0x01 +0x08 +0x20)^0x00 ; ..CDE.G = 'o' ( # 23 )
          retlw (0x40 +0x80 +0x04 +0x10 +0x20)^0x00 ; ABC..FG = 'Q' ( # 24 )
          retlw ( 0x04 +0x01 +0x08 )^0x00 ; ..CDE.. = 'u' ( # 25 )
          retlw ( 0x01 +0x08 +0x10 +0x20)^0x00 ; ...DEFG = 't' ( # 26 )
          retlw (0x40 +0x04 +0x01 +0x10 +0x20)^0x00 ; A.CD.FG = 'S' ( # 27 )
          retlw (0x40 +0x80 +0x01 +0x08 +0x20)^0x00 ; AB.DE.G = 'Z' ( # 28 )
          retlw ( 0x08 +0x10 )^0x00 ; ....EF. = 'I' ( # 29 )
          retlw ( 0x80 +0x04 +0x01 )^0x00 ; .BCD.. = 'J' ( # 30 )
          retlw ( 0x01 +0x08 +0x10 +0x20)^0x00 ; ...DEFG = 'k' ( # 31 )
          retlw ( 0x01 +0x08 +0x10 )^0x00 ; ...DEF. = 'L' ( # 32 )
          retlw (0x40 +0x80 +0x04 +0x08 +0x10 )^0x00 ; ABC.EF. = 'N' ( # 33 )
          retlw ( 0x04 +0x01 +0x08 +0x10 )^0x00 ; ..CDEF. = 'V' ( # 34 )
          retlw ( 0x01 +0x20)^0x00 ; ...D..G = '=' ( # 35 )



;--------------------------------------------------------------------------
; Table to control which 7-segment display is enabled. Displays are usually
; COMMON CATHODE (variants 1+2) so pulled low to enable.
; For 2=3 (COMMON ANODE), the digit-driving pattern is inverted.
; Input: W = 0 means the MOST SIGNIFICANT DIGIT (the leftmost one), etc.
; Result: VALUE to be written to ENABLE_PORT to activate the digit
;
; NK Modified to use PA6 (((PORTA) and 07Fh), 6) if an external clock module is being used.
;--------------------------------------------------------------------------
Digit2MuxValue:
          addwf PCL,f ; caution: this is 'PCL' only, not 'PC'
          ; Note: If the program counter is affected, a command requires to instruction cycles (=8 osc cycles)
; muliplexer values for DISPLAY VARIANT #1 :
# 829 "counter.s"
; muliplexer values for DISPLAY VARIANT #2 (5 digits, COMMON CATHODE) :

          retlw 0b11110111 ; most significant digit is on PA3 (!)
          retlw 0b11111011 ; next less significant dig. on PA2 (!!)
          retlw 0b11111110 ; next less significant dig. on PA0 (!!)
          retlw 0b11111101 ; 4th (sometimes the last) digit PA1 (!)

            retlw 0b11111111 ; 5th (OPTIONAL) least significant digit = NOT (PA3+PA2+PA1+PA0)
   ; We're using an external oscillator so PA6 is used to drive 5th digit



; DISPLAY VARIANT #2


; muliplexer values for DISPLAY VARIANT #3 (5 digits, COMMON ANODE) :
# 864 "counter.s"
;--------------------------------------------------------------------------
; Powers-of-ten table (32 bits, most significant byte first)
; Based on an idea by James Hutchby (MadLab, 1996) .
; Modified for 32-bit arithmetic by Wolfgang Buescher (2004).
;--------------------------------------------------------------------------
TensTable:
 addwf PCL,f
 cquad 10000000 ; 10 million is sufficient for the counter itself
 cquad 1000000
 cquad 100000
 cquad 10000
 cquad 1000
 cquad 100
 cquad 10
 cquad 1


;--------------------------------------------------------------------------
; DISPLAY jump table for programming mode .
; Loads the display-strings like "quit" etc into the display latches.
; Input parameter: menu_index (0 .. MI_INDEX_MAX)
; Output placed in display0..display3
;
;--------------------------------------------------------------------------
PMDisplay:
          movf menu_index, w ; load menu index into W register
          addwf PCL, f ; add W to lower part of program counter (computed jump)
          goto PmDisp_Quit ; show "quit" (quit programming mode)
          goto PmDisp_PSave ; show "PSave"(power-saving mode on/off)
          goto PmDisp_Add ; show "add " (add frequency offset)
          goto PmDisp_Sub ; show "sub " (subtract frequency offset)
          goto PmDisp_Zero ; show "Zero" (set frequency offset to zero)
          goto PmDisp_StIF ; show "StdIF" (select standard IF from table)
          goto PmDisp_IF_1 ; show 1st standard IF from table
          goto PmDisp_IF_2 ; show 2nd standard IF from table
          goto PmDisp_IF_3 ; show 3rd standard IF from table
          goto PmDisp_IF_4 ; show 4th standard IF from table
          goto PmDisp_IF_5 ; show 5th standard IF from table
          goto PmDisp_IF_6 ; show 6th standard IF from table
          goto PmDisp_Quit ; show "quit" (quit STANDARD IF menu)
          ; Add more display strings here if needed !

;--------------------------------------------------------------------------
; EXECUTION jump table for programming mode .
; Executes the commands "quit", "psave", "add", "sub", "zero", etc.
; Input parameter: menu_index (0 .. MI_INDEX_MAX)
;--------------------------------------------------------------------------
PMExecute:
   ; Execute the function belonging to menu_index
          movf menu_index, w ; load menu index into W register
          addwf PCL, f ; add W to lower part of program counter (computed jump)
          goto PmExec_Quit ; quit programming mode
          goto PmExec_PSave ; turn power-saving mode on/off
          goto PmExec_Add ; add frequency offset from now on
          goto PmExec_Sub ; subtract frequency offset from now on
          goto PmExec_Zero ; set frequency offset to zero
          goto PmExec_StIF ; switch to "Standard IF selection mode"
          goto PmExec_SelIF ; select 1st standard IF from table
          goto PmExec_SelIF ; select 2nd standard IF from table
          goto PmExec_SelIF ; select 3rd standard IF from table
          goto PmExec_SelIF ; select 4th standard IF from table
          goto PmExec_SelIF ; select 5th standard IF from table
          goto PmExec_Quit ; quit STANDARD IF menu
          ; Add more jumps here if needed !



;**************************************************************************
; *
; Procedures *
; *
;**************************************************************************


;--------------------------------------------------------------------------
; Configure the prescaler for TIMER 0 in the PIC's OPTION register .
;--------------------------------------------------------------------------

; Description of the OPTION register, from the PIC16F628 data sheet:
; bit 7: RBPU: PORTB Pull-up Enable bit
; 1 = PORTB pull-ups are disabled
; 0 = PORTB pull-ups are enabled by individual port latch values
; bit 6: ((OPTION_REG) and 07Fh), 6: Interrupt Edge Select bit
; 1 = Interrupt on rising edge of ((PORTB) and 07Fh), 0/INT pin
; 0 = Interrupt on falling edge of ((PORTB) and 07Fh), 0/INT pin
; bit 5: ((OPTION_REG) and 07Fh), 5: TMR0 Clock Source Select bit
; 1 = Transition on ((PORTA) and 07Fh), 4/T0CKI pin
; 0 = Internal instruction cycle clock (CLKOUT)
; bit 4: ((OPTION_REG) and 07Fh), 4: TMR0 Source Edge Select bit
; 1 = Increment on high-to-low transition on ((PORTA) and 07Fh), 4/T0CKI pin
; 0 = Increment on low-to-high transition on ((PORTA) and 07Fh), 4/T0CKI pin
; bit 3: ((OPTION_REG) and 07Fh), 3: Prescaler Assignment bit
; 1 = Prescaler is assigned to the WDT
; 0 = Prescaler is assigned to the Timer0 module
; bit 2-0: ((OPTION_REG) and 07Fh), 2:((OPTION_REG) and 07Fh), 0: Prescaler Rate Select bits, here shown for TMR0 :
; 000 = 1 : 2
; ... 111 = 1 : 256
; Note: to count EVERY pulse (1 : 1) with TMR0, the prescaler
; must be assigned to the WATCHDOG TIMER (WDT) !
; Some examples (for the OPTION register, parameter in W for SetPrescaler):
PSC_DIV_BY_2 equ 0b00100000 ; let prescaler divide TMR0 by two
PSC_DIV_BY_4 equ 0b00100001 ; let prescaler divide TMR0 by 4
PSC_DIV_BY_8 equ 0b00100010 ; let prescaler divide TMR0 by 8
PSC_DIV_BY_16 equ 0b00100011 ; let prescaler divide TMR0 by 16
PSC_DIV_BY_32 equ 0b00100100 ; let prescaler divide TMR0 by 32
PSC_DIV_BY_64 equ 0b00100101 ; let prescaler divide TMR0 by 64
PSC_DIV_BY_128 equ 0b00100110 ; let prescaler divide TMR0 by 128
PSC_DIV_BY_256 equ 0b00100111 ; let prescaler divide TMR0 by 256

SetPrescaler:
 ; copy W into OPTION register, avoid watchdog trouble
        clrwdt ; recommended by Microchip ("switching prescaler assignment")
        bsf STATUS, STATUS_RP0_POSITION ;! setting STATUS_RP0_POSITION enables access to OPTION reg
               ; option register is in bank1. i know. thanks for the warning.
        movwf OPTION_REG ;! ex: "option" command (yucc)
        bcf STATUS, STATUS_RP0_POSITION ;! clearing STATUS_RP0_POSITION for normal register access
        retlw 0


PrescalerOff:
 ; turn the prescaler for TMR0 "off"
        ; (actually done by assigning the prescaler to the watchdog timer)
        clrwdt ; clear watchdog timer
        clrf TMR0 ; clear timer 0 AND PRESCALER(!)
        bsf STATUS, STATUS_RP0_POSITION ;! setting STATUS_RP0_POSITION enables access to OPTION reg
        ; option register is in bank1. i know. thanks for the warning.
        movlw 0b00100111 ;! recommended by Microchip when
       ;! changing prescaler assignment from TMR0 to WDT
        movwf OPTION_REG ;! ex: "option" command (yucc)
        clrwdt ;! clear watchdog again
        movlw 0b00101111 ;! bit 3 set means PS assigned to WDT now
        movwf OPTION_REG ;! ex: "option" command (yucc)
        bcf STATUS, STATUS_RP0_POSITION ;! clearing STATUS_RP0_POSITION for normal register access
        retlw 0

;--------------------------------------------------------------------------
; Power-saving subroutine: Puts the PIC to sleep for ROUGHLY 100 milliseconds .
; - crystal oscillator turned OFF during this phase
; - only the internal RC-oscillator for the watchdog keeps running
; - expiration of watchdog during sleep does NOT reset the PIC,
; only wakes it up again so normal operation may resume
; - LED display will be off during this time
;--------------------------------------------------------------------------
Sleep150ms:
   ; go to sleep for approx. 150 milliseconds, and then RETURN (no reset)
   ; Details on the PIC's watchdog timer (from PIC16F628 datasheet) :
   ; > The WDT has a nominal timeout period of 18 ms (with
   ; > no prescaler). The timeout periods vary with temperature,
   ; > VDD and process variations from part to part (see
   ; > ((STATUS) and 07Fh), 1 specs).
   ; > The Watchdog Timer is a free running on-chip RC oscillator which does
   ; > not require any external components. This RC oscillator is separate
   ; > from the ER oscillator of the CLKIN pin. That means that the WDT will run,
   ; > even if the clock on the OSC1 and OSC2 pins of the device has been stopped,
   ; > for example, by execution of a SLEEP instruction.
   ; > During normal operation, a WDT timeout generates a device RESET.
   ; > If the device is in SLEEP mode, a WDT timeout causes the device to wake-up
   ; > and continue with normal operation.
   ; > The WDT can be permanently disabled by programming the configuration bit
   ; > WDTE as clear .
   ; In other words, to use the watchdog-timer for "temporary sleep" here ,
   ; it must be ENABLED in the configuration word when programming the PIC.
   ; (because its not possible to turn it on via software if it's not on).
   ; But once the watchdog timer is ON, it must be FED periodically otherwise
   ; it will reset the PIC during normal operation !
   ; Here (in the frequency counter), the prescaler remains assigned to timer0
   ; so the watchdog interval is ~ 18 milliseconds (+/-, RC-oscillator) .
   ; > The CLRWDT and SLEEP instructions clear the WDT and the postscaler,
   ; > if assigned to the WDT, and prevent it from timing out and generating
   ; > a device RESET. The TO bit in the STATUS register will be cleared upon
   ; > a Watchdog Timer timeout.
; display with COMMON CATHODE :

        movlw 0x00 ; segment drivers LOW to turn off
; not COMMON CATHODE but COMMON ANODE:



        movwf LEDS_PORT ; turn LED segments off
        ; Note: The global interrupt-enable flag (((INTCON) and 07Fh), 7) is off in this application !
        ; To avoid unintended wake-up on 'interrupt' (port level change),
        ; disable all interrupt-SOURCES: Clear ((INTCON) and 07Fh), 5,((INTCON) and 07Fh), 4,((INTCON) and 07Fh), 3,((INTCON) and 07Fh), 6 too :
        clrf INTCON ; disable all interrupts during SLEEP mode
        clrwdt ; clear watchdog timer
        clrf TMR0 ; clear timer 0 AND PRESCALER(!)
        bsf STATUS, STATUS_RP0_POSITION ;! setting STATUS_RP0_POSITION enables access to OPTION reg
        ; option register is in bank1. i know. thanks for the warning.
        movlw 0b00101011 ;! assign PS to WDT; divide by 8 FOR WDT(!)
        movwf OPTION_REG ;! ex: "option" command (yucc)
        bcf STATUS, STATUS_RP0_POSITION ;! clearing STATUS_RP0_POSITION for normal register access
        sleep ; sleep for approx 18 ms (one watchdog interval)
        ; The SLEEP command clears the Watchdog Timer and stops the main oscillator.
        ; Only the internal watchdog timer keeps running.
        ; The WDT is is also cleared when the device wakes-up from SLEEP,
        ; regardless of the source of wake-up, so no need for 'clrwdt' here !
        nop ; arrived here, slept for ~ 8 times 18 milliseconds
        return ; end Sleep150ms

;--------------------------------------------------------------------------
; Convert a character into LEDs data for the 7-segment displays, fed with
; the character in w. Bit 7 set means 'decimal point AFTER this digit' .
;--------------------------------------------------------------------------

conv macro display ; macro for duplicate code
        movwf display ; save decimal point bit (msb)
        andlw 7fh ; mask bit
        call Digit2SevenSeg ; convert digit into 7-segment-code via table
        btfsc display,7 ; check bit 7 = decimal point ?

        iorlw 1<<DPPOINT_BIT ; include decimal point if bit 7 set (bitwise OR)
; not COMMON CATHODE but COMMON ANODE: decimal point must be 'AND'ed to pattern:



        movwf display ; set display data register
     endm

conv_char0:
 ; display digit #0 (leftmost, or MOST SIGNIFICANT digit)
        conv display0
        retlw 0

conv_char1:
 ; display #1
        conv display1
        retlw 0

conv_char2:
 ; display #2
        conv display2
        retlw 0

conv_char3:
 ; display #3
        conv display3
        retlw 0

conv_char4:
 ; display #4 (rightmost, or LEAST SIGNIFICANT digit, "ones")
        conv display4
        retlw 0

;--------------------------------------------------------------------------
; Fill the 5-digit display latch with blank characters
;--------------------------------------------------------------------------
ClearDisplay:
        movlw BLANK_PATTERN
        movwf display0
        movwf display1
        movwf display2
        movwf display3
        movwf display4
        retlw 0



;--------------------------------------------------------------------------
; Save a single Byte in the PIC's Data-EEPROM.
; Input parameters:
; INDF = *FSR contains byte to be written (was once EEDATA)
; w contains EEPROM address offset (i.e. "destination index")
;
;--------------------------------------------------------------------------
        ; write to EEPROM data memory as explained in the 16F628 data sheet.
        ; EEDATA and EEADR must have been set before calling this subroutine
        ; (optimized for the keyer-state-machine).
        ; CAUTION : What the lousy datasheet DS40300B wont tell you:
        ; The example given there for the 16F628 is WRONG !
        ; All EEPROM regs are in BANK1 for the 16F628.
        ; In the PIC16F84, some were in BANK0 others in BANK1..
        ; In the PIC16F628, things are much different... all EEPROM regs are in BANK1 !
SaveInEEPROM:
 ; save "INDF" = *FSR in EEPROM[<w>]
        bcf INTCON, INTCON_GIE_POSITION ; disable INTs
        bsf STATUS, STATUS_RP0_POSITION ;!; Bank1 for "EEADR" access, PIC16F628 ONLY (not F84)
        movwf EEADR ;!; write into EEPROM address register (BANK1 !!)
        bcf STATUS, STATUS_RP0_POSITION ;!; Bank0 to read "bStorageData"
        movf INDF, w ; ; w := *FSR (read source data from BANK 0)
        bsf STATUS, STATUS_RP0_POSITION ;!; Bank1 for "EEDATA" access, PIC16F628 ONLY (not F84)
        movwf EEDATA ;!; EEDATA(in BANK1) := w (BANK1; F628 only, NOT F84 !!!)
        bsf EECON1, EECON1_WREN_POSITION ;!; set WRite ENable
        bcf INTCON, INTCON_GIE_POSITION ;!; Is this REALLY required as in DS40300B Example 13-2 ?
        movlw 055h ;!;
        movwf EECON2 ;!; write 55h
        movlw 0AAh ;!;
        movwf EECON2 ;!; write AAh
        bsf EECON1, EECON1_WR_POSITION ;!; set ((EECON1) and 07Fh), 1 bit, begin write
        ; wait until write access to the EEPROM is complete.

SaveEW:
 btfsc EECON1, EECON1_WR_POSITION ;!; ((EECON1) and 07Fh), 1 is cleared after completion of write
        goto SaveEW ;!; ((EECON1) and 07Fh), 1=1, write access not finished yet
        ; Arrived here: the EEPROM write is ready
        bcf EECON1, EECON1_WREN_POSITION ;!; disable further WRites
        bcf STATUS, STATUS_RP0_POSITION ;!; Bank0 for normal access
        retlw 0 ; end SaveInEEPROM

;--------------------------------------------------------------------------
; Read a single Byte from the PIC's Data-EEPROM.
; Input parameters:
; w contains EEPROM address offset (i.e. "source index")
; will *NOT* be modified to simplify block-read .
; FSR points to the memory location where the byte shall be placed.
;
; Result:
; INDF = *FSR returns the read byte
;--------------------------------------------------------------------------
        ; Caution: EEDATA and EEADR have been moved from Bank0(16F84) to Bank1(16F628)
        ; and the example from the datasheet telling you to switch to
        ; bank0 to access EEDATA is rubbish (DS40300B page 93 example 13-1).
EEPROM_ReadByte:
 ; read ONE byte from the PIC's data EEPROM
        movwf bTemp ; save W
        bcf INTCON, INTCON_GIE_POSITION ; disable INTs
        bsf STATUS, STATUS_RP0_POSITION ; Bank1 for ***ALL*** EEPROM registers in 16F628 (!)
        movwf EEADR ;! write into EEPROM address register
        bsf EECON1, EECON1_RD_POSITION ;! set "Read"-Flag for EEPROM
        movf EEDATA, w ;! read byte from EEPROM latch
        bcf STATUS, STATUS_RP0_POSITION ;! normal access to Bank0
        movwf INDF ; place result in *FSR
        movf bTemp, W ; restore W
        return ; back to caller
 ; end EEPROM_ReadByte

EEPROM_Read4Byte:
 ; read FOUR bytes from the PIC's data EEPROM.
        ; Input parameters:
        ; w contains EEPROM address offset (i.e. "source index")
        ; will *NOT* be modified to simplify block-read .
        ; FSR points to the memory location where the byte shall be placed.
        call EEPROM_ReadByte ; *FSR = EEPROM[w] (usually bits 31..24)
        addlw 1 ; next source address
        incf FSR , f ; next destination address
        call EEPROM_ReadByte ; *FSR = EEPROM[w] (usually bits 23..16)
        addlw 1 ; next source address
        incf FSR , f ; next destination address
        call EEPROM_ReadByte ; *FSR = EEPROM[w] (usually bits 15..8)
        addlw 1 ; next source address
        incf FSR , f ; next destination address
        goto EEPROM_ReadByte ; *FSR = EEPROM[w] (usually bits 7..0)
 ; end EEPROM_Read4Byte

;--------------------------------------------------------------------------
; Count pulses, fed with the number of loop iterations for the gate time .
; WHILE counting, the multiplexed LED display is updated .
; Watchdog is fed in this loop !
; Input: Count of gate-time-loops in 'gatecnt_hi'+'gatecnt_lo' (16 bit).
; Returns: The number of pulses in 'freq' (clock cycles in [])
;--------------------------------------------------------------------------
count_pulses:
        clrf freq_hi ; clear pulse counter (bits 31..24)
        clrf freq_mh ; bits 23..16
        clrf freq_ml ; bits 16..8
        clrf freq_lo ; bits 7..0

        clrf timer0_old ; 'old' value of timer0 to detect toggling MSB
        clrf TMR0 ; timer register (PIC's hardware timer, 8 bit)

        nop ; 2 instruction cycle delay
        nop ; after writing to TMR0 (MPLAB-SIM: set breakpoint + clear stopwatch here)

; --------------- start of critial timing loop >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

; The following timing loop must take a well-defined time in total per
; iteration, usually 50 (or 20) microseconds, which can be precisely achieved
; with a 4-MHz-crystal (or 20 MHz for variant 2+3) .
; This gives a basic delay for the frequency counter's gate time .
; The frequency at the input of TIMER 0 (not the prescaler)
; can not exceed f_crystal / 4,
; and every HIGH->LOW transition of bit7 in TIMER0 must be polled here.
; This is safe because ..
; Variant 1: With a 4-MHz-crystal, Timer0 can count up to 1 MHz input,
; MSB toggles every (128/1MHz) = 128 us, polled every 50us -> ok.
; Variant 2: With a 20-MHz-crystal, Timer0 can count up to 4 (not 5?!) MHz input,
; MSB toggles every (128/4MHz) = 32 us, polled every 20us -> ok.

; The numbers in square brackets below are the INSTRUCTION NUMBER within the loop.
; (not the count of oscillator cycles for a single command, which is always 4).
; These values can be checked with the "Stopwatch" function in MPLAB-SIM.
; The goal is to let this loop take EXACTLY <TIME> microseconds (50us or 20us).

count1:
 movf disp_index, w ; [1] get the current digit number (disp_index = 0..4)
        call Digit2MuxValue ; [2,3,4,5,6,7] display (6 commands including call+retlw)
        movwf bTemp ; [8] save the bit pattern for the multiplexer port
        movlw display0 ; [9] get the LED display data for the current digit...
        addwf disp_index,w ; [10] add current digit number to address of LED data
        movwf FSR ; [11] move address into the PIC's poor 'data pointer'
        movf INDF,w ; [12] w := *(FSR) use indirection register to read from table
        movwf LEDS_PORT ; [13] set the LED segments
        movf bTemp,w ; [14] get the mupliplexer pattern (hurry, hurry !)
        movwf ENABLE_PORT ; [15] set the LED multiplexer

        incf disp_timer,f ; [16] increment display-multiplex timer
        btfsc disp_timer,6 ; [17] (6-bit prescaler)
        incf disp_index,f ; [18] next display if rolled over
        bcf disp_timer,6 ; [19] limit disp_timer to 6 bits (!)
        movf disp_index,w ; [20] limit display index to 0...4
        sublw 4 ; [21] subtract #4 - W register -> C=0(!) if result negative (W>4)
        btfss STATUS,STATUS_C_POSITION ; [22] skip next instruction if C=1 (#4-W >= 0)
        clrf disp_index ; [23] if C=0 (disp_index>4) then disp_index=0

; the following fragments of code always take the same number of clock
; cycles to execute, irrespective of whether the skips take place or not .
; Here still in 'count_pulses'.

        movf TMR0,w ; [24] read least significant byte of
        movwf freq_lo ; [25] pulse counter (bits 7..0)

        movlw 1 ; [26] determine if timer 0 has rolled
        btfss timer0_old,7 ; [27] over (rolled over if msb was
        clrw ; [28] previously set and now isn't)
        btfsc freq_lo,7 ; [29]
        clrw ; [30]

        addwf freq_ml,f ; [31] increment high bytes of pulse counter
        skpnc ; [32] if low byte rolled over
        incf freq_mh,f ; [33] (mh = "medium high byte" of counter)
                                      ; NOTE: we are not modifying freq_hi here !
                                      ; Bits 31..24 may be used later when multiplying with some factor
                                      ; (2^n) to compensate for the ASYNCHRON PRESCALER !

        btfsc freq_mh,7 ; [34] overflow (freq > 7fffffh) ?
        goto count3 ; [35] branch if yes

        movf freq_lo,w ; [36] save previous value from timer 0
        movwf timer0_old ; [37]

        tstf gatecnt_lo ; [38] check inner gate-time counter, LOW byte
        skpnz ; [39] only decrement h-byte if l-byte zero
        decf gatecnt_hi,f ; [40] decrement gate-time counter, HIGH byte
        decf gatecnt_lo,f ; [41] always decrement gate-time counter, LOW byte
; only 50 instruction cycles per loop in DISPLAY VARIANT 1 (f_xtal=4 MHz, t_loop=50us)
# 1310 "counter.s"
        ; (f_xtal=20 MHz, t_loop=20us, t_instr=4/20MHz=0.2us)
        ; Some time may be used for a nice software-based PULSE WIDTH MODULATION
        ; of the display intensity ... or other goodies/gimmicks one fine day !
        clrwdt ; [42] (ex: nop, but since 2006-05-28 the dog must be fed !)
        movlw 12 ; [43] load additional delay loops (X=12, see below) into W
WasteT1:
 addlw 0xFF ; [44, 48, .. ]
        btfss STATUS, STATUS_Z_POSITION ; [45, 49, .. ] eats 4(!) INSTRUCTION CYCLES per loop
        goto WasteT1 ; [46+47,50+51, .. ]
        ; Check this with MPLAB-SIM: here, after loop: [43 + 4*X], with X=12: [91]
        nop ; [91]
        nop ; [92]
        nop ; [93]
        nop ; [94]
        nop ; [95]
        movf gatecnt_hi,w ; [96] counter = 0 ?
        iorwf gatecnt_lo,w ; [97]
        skpz ; [98]
        goto count1 ; [99,50] goto always takes TWO instruction cycles
; variant 1 or variant 2/3 ?


; <<<<<<<<<<<<<<<<<<<<<<<< end of timing loop -----------------------------

        movf TMR0,w ; get final value from timer 0
        movwf freq_lo

        movlw 1 ; determine if timer 0 has rolled
        btfss timer0_old,7 ; over (rolled over if msb was
        clrw ; previously set and now isn't)
        btfsc freq_lo,7
        clrw

        addwf freq_ml,f ; increment high bytes of pulse
        skpnc ; counter if low byte rolled
        incf freq_mh,f ; over

count3:
 retlw 0

; end of routine 'count_pulses'. Result now in freq_lo..freq_hi.

;--------------------------------------------------------------------------
; Convert *FSR (32 bit) into BCD and show it on the display .
; Input : INDF = *FSR, 32-bit integer.
; Bad side effect : CONTENTS OF <freq> will be lost !!
;--------------------------------------------------------------------------
ShowInt32_FSR:
 ; Convert <*FSR> (32 bit integer) to 8 BCD-digits ...
        movf INDF,w ; W := *FSR , load LOW byte
        incf FSR,f ; FSR := FSR + 1
        movwf freq ; freq.hi := W
        movf INDF,w ; W := *FSR , load MIDDLE LOW byte
        incf FSR,f ; FSR := FSR + 1
        movwf freq+1 ; freq.mh := W
        movf INDF,w ; W := *FSR , load MIDDLE HIGH byte
        incf FSR,f ; FSR := FSR + 1
        movwf freq+2 ; freq.ml := W
        movf INDF,w ; W := *FSR , load HIGH byte
        incf FSR,f ; FSR := FSR + 1
        movwf freq+3 ; freq.lo := W
        ; continue with CvtAndDisplayFreq !

;--------------------------------------------------------------------------
; Convert <freq> into BCD and show it on the display .
; Input : freq, 32-bit integer. CONTENTS OF <freq> will be lost !!
;--------------------------------------------------------------------------
CvtAndDisplayFreq:
 ; Convert <freq>(32 bit integer) to 8 BCD-digits ...
        clrf tens_index ; initialise the table index

        movlw digits ; initialise the indirection register
        movwf FSR ; ( FSR="pointer"; *FSR=INDF)

conv1:
 ; Loop for ALL POWERS OF TEN in the lookup table..
        clrwdt ; feed the watchdog (may stay a bit longer)
        movf tens_index,w ; fetch the next power of ten
        call TensTable ; (32 bits) from the lookup table
        movwf divi+0 ; and store in divi
        incf tens_index,f ; this was the HIGH byte

        movf tens_index,w
        call TensTable
        movwf divi+1
        incf tens_index,f ; this was the MIDDLE-HIGH byte

        movf tens_index,w
        call TensTable
        movwf divi+2
        incf tens_index,f ; this was the MIDDLE-LOW byte

        movf tens_index,w
        call TensTable
        movwf divi+3
        incf tens_index,f ; and this was the LOW-byte of a power of ten

        ; ex: clrf 0 ; clear the decimal digit .. but address ((STATUS) and 07Fh), 2 is called 'INDF' these days !
        clrf INDF ; *FSR = 0

conv2:
 ; Loop to repeatedly subtract divi from freq (32-bit subtract)
        ; until underflow while incrementing the decimal digit.
        sub32 freq,divi ; freq := freq - divi (with divi = 10 power N)
        bnc conv3 ;
        incf INDF,f ; The RESULT will be written back to freq,
        goto conv2 ; in other words 'freq' will be lost !

conv3:
 add32 freq,divi ; freq := freq+divi; ready for next digit
        incf FSR,f ; step to next decimal digit
        movlw 8*4 ; 8 x 4-byte entries in TensTable
        subwf tens_index,w
        bnz conv1 ; loop until end of table

;--------------------------------------------------------------------------
; displays the frequency in decimal
;--------------------------------------------------------------------------

display_freq:
; Display the decimal digits according to the following rules
; 000000A => "0.00A"
; 00000AB => "0.0AB"
; 0000ABC => "0.ABC"
; 000ABCD => "A.BCD"
; 00ABCDE => "AB.CD"
; 0ABCDEF => "ABC.D"
; ABCDEFG => "ABCD."
; Modified a lot by WoBu to display kHz as well as MHz :
; If the decimal point means kHz, it flashes.
; If it means MHz, it is on permanently.
; 24 bit unsigned integer could count up to 16777216 (16 mio, slightly over 7 digits)
; which was not enough for a 50 MHz counter, so switched to 32-bit arithmetic .
;

    ; Display routine for frequencies up to "99.99 MHz" (theoretical):
        ; (do NOT insert the decimal point yet,
        ; it would disturb the blanking of LEADING zeroes )
        movlw digits ; find the first significant digit..
        movwf FSR ; .. by stepping over leading zeroes
        tstf INDF ; INDF = *(FSR) in "C" syntax, FSR points to 'digits'
        bnz displ_MHz ; 10-MHz-digit non-zero, show frequency in MHz
        incf FSR,f ; otherwise skip 1st digit (the 10-MHz place)
        tstf INDF
        bnz displ_MHz ; 1-MHz-digit non-zero, show frequency in MHz
        incf FSR,f ; otherwise skip 2nd digit (the 1-MHz place)
        tstf INDF
        bnz displ_kHz ; 100-kHz-digit non-zero, show frequency in kHz (XXX.X)
        incf FSR,f ; otherwise skip 3rd digit (the 100-kHz place)
        tstf INDF
        bnz displ_kHz ; 10-kHz-digit non-zero, show frequency in kHz (XX.XX)
        incf FSR,f ; Otherwise show digits 5,6,7,8 (there are EIGHT digits)
                                      ; show all these frequencies with flashing kHz-point (X.XXX)

displ_kHz:
 ; insert a BLINKING POINT to indicate the kilohertz-digit
        btfsc blinker, 0 ; check the blink flag (bit 0) for the kHz-point
        bsf digit_4, 7 ; set the decimal point indicating the frequency in kHz .
        goto display

displ_MHz:
 ; insert a STEADY POINT to indicate the megahertz-digit
        bsf digit_1, 7 ; set the decimal point indicating the frequency in MHz .

display:
 ; Show the FIVE digits beginning at INDF = *(FSR) on the LED display...
        movf INDF,w ; convert the four digits to
        call conv_char0 ; LED display data
        incf FSR,f ; increment pointer to next digit
        movf INDF,w ; w = *(FSR)
        call conv_char1 ; second visible digit
        incf FSR,f
        movf INDF,w
        call conv_char2 ; third visible digit
        incf FSR,f
        movf INDF,w
        call conv_char3 ; fourth visible digit
        incf FSR,f
        movf INDF,w
        goto conv_char4 ; convert fifth visible digit AND RETURN
; end of routine "CvtAndDisplayFreq"

;--------------------------------------------------------------------------
; main entry point
;--------------------------------------------------------------------------
PSECT code
MainInit:

; Test !
# 1511 "counter.s"
 movlw PORT_A_IO ; initialise port A
        bsf STATUS, STATUS_RP0_POSITION ;! setting STATUS_RP0_POSITION enables access to TRIS regs
        movwf PORTA ;! looks like PORTA but is in fact TRISA
        bcf STATUS, STATUS_RP0_POSITION ;! clearing STATUS_RP0_POSITION enables access to PORTs
        clrf PORTA

        movlw PORT_B_IO ; initialise port B
        bsf STATUS, STATUS_RP0_POSITION ;! setting STATUS_RP0_POSITION enables access to TRIS regs
        movwf PORTB ;! looks like PORTB but is in fact TRISB
        bcf STATUS, STATUS_RP0_POSITION ;! clearing STATUS_RP0_POSITION enables access to PORTs
        clrf PORTB

        clrf disp_index ; initialise display index and
        clrf disp_timer ; display multiplex timer

        movlw BLANK ; blank character as dummy ...
        movwf digit_8 ; for the lowest frequency display range

        movlw TEST ; test all LED segments
        call conv_char0
        movlw TEST
        call conv_char1
        movlw TEST
        call conv_char2
        movlw TEST
        call conv_char3
        movlw TEST
        call conv_char4

 movlw PSC_DIV_BY_256 ; let the prescaler divide by 256 while testing..
        call SetPrescaler ; safely write <W> into option register


          ; Do a LAMP TEST for half a second, including all decimal points :
        movlw (LAMPTEST_LOOPS)>>8 ; high byte for 0.5 second lamp test
        movwf gatecnt_hi
        movlw (LAMPTEST_LOOPS)&0ffh ; low byte for 0.5 second lamp test
        movwf gatecnt_lo
        call count_pulses ; some delay to show the test pattern
; not 0



MainRestart:
 ; Here we "restart" the counter after exiting from programming mode :
        clrf psave_timer ; clear timer for power-save mode (no immediate power-down)
        clrf psave_flags ; clear all power-saving flags (psave_flags,0, etc)
        movlw foffs ; load destination address for reading from EEPROM...
        movwf FSR ; ..into the PIC's pointer register
        movlw 0x00 +0 ; load the EEPROM-internal address offset (=source index)
        call EEPROM_Read4Byte ; read from EEPROM: foffs..foffs+4 := EEPROM[W]
        movlw options ; another destination address for reading from EEPROM..
        movwf FSR ;
        movlw 0x20 ; load EEPROM-internal offset of "options"-byte
        call EEPROM_ReadByte ; read single byte from EEPROM: options := EEEPROM[W]





        ; Blank the display until 1st measurement is available :
        call ClearDisplay

;--------------------------------------------------------------------------
; main loop : Preparation, auto ranging, measurement, conversion, display
;--------------------------------------------------------------------------

MainLoop:
        ; re-initialise ports
        ; ex: tris PORTA; tris PORTB
        bsf STATUS, STATUS_RP0_POSITION ;! setting STATUS_RP0_POSITION enables access to TRIS regs
        movlw PORT_A_IO ;!
        movwf PORTA ;! looks like PORTA but is in fact TRISA
        movlw PORT_B_IO ;!
        movwf PORTB ;! looks like PORTB but is in fact TRISB
        bcf STATUS, STATUS_RP0_POSITION ;! clearing STATUS_RP0_POSITION enables access to PORTs
        clrwdt ; configure TMR0... but clear watchdog timer first
        movlw 0b100000 ; value for OPTION reg: edge - low-to-high transition,
                                      ; + prescaler assigned to Timer 0, 1:2
        bsf STATUS, STATUS_RP0_POSITION ;! setting STATUS_RP0_POSITION enables access to OPTION reg
        ; option register is in bank1. i know. thanks for the warning.
        movwf OPTION_REG ;! ex: "option" command (yucc)
        bcf STATUS, STATUS_RP0_POSITION ;! clearing STATUS_RP0_POSITION for normal register access

 ; First do a 'range-detection measurement' to find
        ; a suitable prescaler ratio. Worst-case-estimation:
        ; 50 MHz at the input of the async TIMER 0 prescaler
        ; requires a prescaler ratio of 64 because
        ; the synchron counter in TIMER 0 accepts a maximum
        ; frequency of f_osc / 4, here: max. 1 MHz.
        ; The theoretic maximum frequency is 64 MHz then, which
        ; was almost reached when tested with a PIC 16F628 .
        ; The range-detection interval is somewhere near 1/30 seconds (see RANGE_DET_LOOPS),
        ; so frequencies below 30*64 = 1920 Hz are not detectable at this step.
RANGE_DET_LOOPS equ CLOCK/(30*CYCLES) ; number of gate-time loops to detect the MEASURING RANGE
                                       ; (which is required to find a good prescaler value)
        movlw (RANGE_DET_LOOPS)>>8 ; high byte for RANGE DETECTION loop counter
        movwf gatecnt_hi
        movlw (RANGE_DET_LOOPS)&0ffh ; low byte for RANGE DETECTION loop counter
        movwf gatecnt_lo
        movlw PSC_DIV_BY_64 ; let the prescaler divide by 64 while testing..
        call SetPrescaler ; safely write <W> into option register

        call count_pulses ; count pulses for the range detection interval (1/16 sec)
        ; The result will be placed in freq_lo,freq_ml,freq_mh,freq_hi (32 bit)
        ; but the max count at 64 MHz input, 1/30 sec gate time, and prescaler=64 will be :
        ; 64MHz / (30 * 64) = 33333 pulses, so only 16 bits in the counter
        ; are required here (call them "testcount", f_in = testcount * 30*64) .
        ; The frequency resolution of this coarse measurement is 64*16 Hz = roughly 1 kHz.
        ; (for that reason it's not suited for "wake-up from power-save on frequency-change")

; TEST auto ranging
# 1631 "counter.s"
        ; Load the default (soft-)counters for the GATE TIME.
        ; Most measuring ranges use a 1/4 second gate time !
        movlw (GATE_TIME_LOOPS/4)>>8 ; high byte of gate time
        movwf gatecnt_hi
        movlw (GATE_TIME_LOOPS/4)&0ffh ; low byte of gate time
        movwf gatecnt_lo


        ; Increment the "blinker" once every 0.25 seconds.
        ; (if the gate time is longer, flashing will be slower, that's acceptable)
        incf blinker,f
        incf psave_timer,f ; increment the power-save timer every 0.25 seconds too (checked somewhere else)

        ; Look at the range-detection count ("testcount")
        ; and decide which measuring range to use, beginning with the highest frequency range
# 1688 "counter.s"
           ; 2021-02-23 (Ho-Ro):
           ; Ranges FOR VARIANT 2+3, 20 MHz CRYSTAL (draws more power, but gives better resolution at HF )
           ; Even if PIC clocked with 20MHz, keep the input of TIMER0 below 4(!) MHz .
           ; Rng testcount f_in prescaler gate_time display, resolution
           ; (1) 0..6 0.. 11.5 kHz 1 1 second X.XXXkHz, 0.001kHz (4 digits only)
           ; (2) 7..52 ..101.8 kHz 1 1 second XX.XXXkHz, 0.001kHz (last digit steps by 1)
           ; (3) 53..2047 .. 3.9 MHz 1 1/4 second X.XXXXMHz, 4 Hz (last digit steps by 1)
           ; (4) 2048..4095 .. 7.9 MHz 2 1/4 second X.XXXXMHz, 8 Hz (last digit steps by 1)
           ; (5) 4096..8191 ... 15.7 MHz 4 1/4 second X.XXXXMHz, 16 Hz (last digit steps by 1)
           ; (6) 8192..16383 ... 31.4 MHz 8 1/4 second X.XXXXMHz, 32 Hz (last digit steps by 1 or 2)
           ; (7) 16384..33330 ... 63.9 MHz 16 1/4 second XX.XXXMHz, 64 Hz (last digit steps by 1)
        movf freq_ml, w ; first look at bits 15..8 of the 'test count' result
        andlw 0b11000000 ; any of bits 15..14 set (>=16384) -> no Z flag -> range 7
        btfss STATUS,STATUS_Z_POSITION ; skip next instruction if ((STATUS) and 07Fh), 2 -flag set (!)
        goto Range7 ; far jump to range 7
        btfsc freq_ml,5 ; bit 13 set (>=8192) -> range 6
        goto Range6
        btfsc freq_ml,4 ; bit 12 set (>=4096) -> range 5
        goto Range5
        btfsc freq_ml,3 ; bit 11 set (>=2048) -> range 4
        goto Range4
        btfsc freq_ml,2 ; bit 10 set (>=1024) -> range 3
        goto Range3
        btfsc freq_ml,1 ; bit 9 set (>=512) -> range 3
        goto Range3
        btfsc freq_ml,0 ; bit 8 set (>=256) -> no Z flag -> range 3
        goto Range3
        movf freq_lo,w ; now look at bits 7..0 only ..
        sublw 52 ; subtract #52 - W register -> C=0 if result negative
        btfss STATUS,STATUS_C_POSITION ; skip next instruction if C=1 (#52-W >= 0)
        goto Range3 ; freq > 100kHz -> also range 3
        ; -----------
        ; 2021-02-23 (Ho-Ro): Disable the next instructions
        ; to always use 1Hz resolution in the range up to 101800 Hz
        ;movfw freq_lo ; look at bits 7..0 again ..
        ;sublw .5 ; subtract #5 - W register -> C=0 if result negative
        ;btfss STATUS,STATUS_C_POSITION ; skip next instruction if C=1
        ;goto Range2 ; freq > 10kHz -> range 2
        ;goto Range1 ; otherwise range 1 (lowest frequencies)
 ; end of specific range-switching for DISPLAY VARIANT #2


Range1:
 ; Range 1: async prescaler off, 1 second gate time for very low frequencies :
        call PrescalerOff ; turn hardware prescaler off
        incf psave_timer,f ; increment power-save timer three more times
        incf psave_timer,f ; (1 sec-gate instead of 0.25)
        incf psave_timer,f
        ; Load the GATE TIMER (as count of loops) for this measuring range.
        movlw (GATE_TIME_LOOPS)>>8 ; high byte for 1 second gate time
        movwf gatecnt_hi
        movlw (GATE_TIME_LOOPS)&0ffh ; low byte for 1 second gate time
        movwf gatecnt_lo
        ; Load the count of "left shifts" to compensate gate time + prescaler :
        movlw 0 ; no need to multiply with prescaler 1:1 and 1-sec gate time
        goto GoMeasure

Range2:
 ; Range 2: async prescaler off, 1/2 second gate time for quite low frequencies :
        call PrescalerOff ; turn hardware prescaler off
        incf psave_timer,f ; increment power-save timer one more time (0.5 sec-gate instead of 0.25)
        ; Load the GATE TIMER (as count of loops) for this measuring range.
        movlw (GATE_TIME_LOOPS/2)>>8 ; high byte for 1/2 second gate time
        movwf gatecnt_hi
        movlw (GATE_TIME_LOOPS/2)&0ffh ; low byte for 1/2 second gate time
        movwf gatecnt_lo
        ; Load the count of "left shifts" to compensate gate time + prescaler :
        movlw 1 ; multiply by 2 (=2^1) later to compensate gate time (1/2 s)
        goto GoMeasure

Range3:
 ; Range 3: async prescaler off, gate time = default (1/4 sec) :
        call PrescalerOff ; turn hardware prescaler off
        movlw 2 ; multiply by 4 (=2^2) later to compensate gate time (1/4 s)
        goto GoMeasure

Range4:
 ; Range 4: prescaler divide by 2 , gate time = default (1/4 sec) :
        movlw PSC_DIV_BY_2 ; let the prescaler divide by 2 while MEASURING...
        call SetPrescaler ; safely write <W> into option register
        movlw 3 ; multiply by 8 (=2^3) later to compensate prescaling (1:2) * gate time (1/4 s)
        goto GoMeasure

Range5:
 ; Range 5: prescaler divide by 4 , gate time = default (1/4 sec) :
        movlw PSC_DIV_BY_4 ; let the prescaler divide by 2 while MEASURING...
        call SetPrescaler ; safely write <W> into option register
        movlw 4 ; multiply by 16 (=2^4) later to compensate prescaling (1:4) * gate time (1/4 s)
        goto GoMeasure

Range6:
 ; Range 6: prescaler divide by 8 , gate time = default (1/4 sec) :
        movlw PSC_DIV_BY_8 ; let the prescaler divide by 2 while MEASURING...
        call SetPrescaler ; safely write <W> into option register
        movlw 5 ; multiply by 32 (=2^5) later to compensate prescaling (1:8) * gate time (1/4 s)
        goto GoMeasure

Range7:
 ; Range 7: prescaler divide by 16 , gate time = default (1/4 sec) :
        movlw PSC_DIV_BY_16 ; let the prescaler divide by 2 while MEASURING...
        call SetPrescaler ; safely write <W> into option register
        movlw 6 ; multiply by 64 (=2^6) later to compensate prescaling (1:16) * gate time (1/4 s)
        goto GoMeasure
# 1810 "counter.s"
GoMeasure:
 movwf adjust_shifts ; save the number of "arithmetic left shifts" for later
        call count_pulses ; count pulses for 1, 1/2, or 1/8 s .
        ; Result in freq_lo,freq_ml,freq_mh,freq_hi (32 bit) now,
        ; NOT adjusted for the gate-time or prescaler division ratio yet.

        ;----------------- Power-saving mode ------------------------------------
        ; Power-saving mode enabled or about to be activated ?
        btfss options,0 ; Power-save mode enabled (from config) ?
        goto PsNotBlanked
        ; Arrived here: power-saving is ENABLED through the config,
        ; but not necessarily ACTIVE at the moment .
        ; If power-save is already active, clear the display (may have 'flashed up')
        btfsc psave_flags,0 ; if power-save already 'ACTIVE'..
        call ClearDisplay ; then clear the display (latch)
        ; Next: Check if the frequency has changed significantly
        ; since the last 'reload' of the power-save timer.
        ; To keep things simple, only look at the LOW BYTES of the
        ; 'current' and the 'old' frequency reading at this stage
        ; (BEFORE multiplying the result with two power adjust_shifts) .
        ; 'psave_freq_lo' is an "old" reading; 'freq_lo' the current frequency.
        ; Both are UNSIGNED 8-bit values !
        movf freq_lo,w ; get low-byte of current frequency
        subwf psave_freq_lo,w ; W := freq_lo - psave_freq_lo
        ; Make the difference (new minus old frequency in W) positive :
        movwf bTemp ; bTemp := (freq_lo - psave_freq_lo)
        btfss bTemp,7 ; check the sign-bit (=MSB)
        goto PsDiffPos ; difference already posivite, else :
        comf bTemp,f ; bTemp := ~bTemp (for example, 0xFF -> 0x00)
        incf bTemp,f ; add one for two's complement
PsDiffPos:
 ; Arrived here: difference made positive, i.e. bTemp = abs(freq_lo - psave_freq_lo) .
        ; If the frequency-difference is 'quite high',
        ; turn off the flag psave_flags,0 and clear the power-save-timer:
        movf bTemp,w ; W := abs(freq_lo - psave_freq_lo)
        sublw PSAVE_MAX_DIFF ; W := PSAVE_MAX_DIFF - W ; C=0 if result negative (=large f-diff)
        btfsc STATUS,STATUS_C_POSITION ; skip next instruction if large frequency difference
        goto PsSmallDiff ;
PsLargeDiff:
   ; Arrived here: there's a LARGE difference between 'current' and 'old' frequency
          bcf psave_flags,0 ; Back to normal display mode
          clrf psave_timer ; restart 'power-save' activation timer (with display ON)
          movf freq_lo,w ; set 'current' frequency as new 'old' frequency...
          movwf psave_freq_lo ; for the next XX-second interval !
          goto PsNotBlanked
PsSmallDiff:
   ; Arrived here: there's only a SMALL difference between 'current' and 'old' frequency .
        btfsc psave_flags,0 ; power-save already 'ACTIVE' ?
        goto PsActive ; yes, already active -> check for flash-up
        ; Check the power-save timer; it may be time to turn the display OFF now :
        movf psave_timer,w ; if(psave_timer > PSAVE_DELAY_TIME ) ...
        sublw PSAVE_DELAY_TIME ; subtract #PSAVE_DELAY_TIME - W -> C=0 if result negative
        btfsc STATUS,STATUS_C_POSITION ; skip next instruction if carry=0 (PSAVE_DELAY_TIME-W < 0)
        goto PsNoTimeout ; psave_timer still low, no 'timeout' yet !
        ; Arrived here: Display was on, but almost no change in frequency -> enter power-saving mode
        movlw PSAVE_FLASHUP_TIME-1 ; let display flash up once before turning off
        movwf psave_timer ; ... to avoid overflow when incrementing it later
        bsf psave_flags,0 ; set the flag 'power-save ACTIVE' to blank the display
        movf freq_lo,w ; save low-byte of frequency when ENTERING power-save mode
        movwf psave_freq_lo
        goto PsSleep ; sleep for the first 600-millisecond-interval now

PsActive:
 ; Here if power-saving mode already active .
        ; Check it it's time to let the display flash up for a short time
        ; to show the operator we're still alive !
        movf psave_timer,w ; if(psave_timer > PSAVE_DELAY_TIME ) ...
        sublw PSAVE_FLASHUP_TIME ; subtract #PSAVE_FLASHUP_TIME - W -> C=0 if result negative
        btfsc STATUS,STATUS_C_POSITION ; skip next instruction if (PSAVE_FLASHUP_TIME-psave_timer) < 0
        goto PsSleep ; psave_timer still low, don't 'flash up' yet !

PsFlashUp:
 clrf psave_timer ; prepare timer for next period of darkness
        movf freq_lo, w ; avoid turning the display on ..
        movwf psave_freq_lo ; .. if the VFO is only "slowly creeping"
        clrf psave_timer ; restart 'power-save' activation timer (with display OFF)
        goto PsNotBlanked ; and let the display flash up for one gate interval

PsNoTimeout:
 ; small frequency difference, AND psave_timer still low..
        ; Already in "power-save"-mode or normal display ?
        btfss psave_flags,0 ; check the flag 'power-save ACTIVE'
        goto PsNotBlanked ; not set -> normal display (not blanked)
        ; Arrived here: 'Saving power', which means the display
        ; is blanked MOST of the time (but it may flash up every XX seconds
        ; to show the operator we're still alive) .

PsSleep:
 call Sleep150ms ; put CPU to sleep for ~500 milliseconds..
        call Sleep150ms
        call Sleep150ms
        goto CheckProgMode ; skip integer->BCD conversion (save power)

PsNotBlanked:
 ; Display is not blanked for power-saving mode at the moment.
        ; If this 'absolute difference' is quite large,
        ; clear the power-save timer to prevent turning off the display
        ; within the next XX seconds :
        ; Reload the power-save-timer if there was a significant change
        ; since the last comparison.

PrepDisp:
 ; Prepare the frequency (32-bit 'unadjusted' integer) for display:
        ; Multiply freq by 2^adjust_shifts to adjust for the prescaling
        ; and the timing period . The result will be a frequency in HERTZ, 32-bit integer.
        ; Note: the adjustment factor may be ONE which means no shift at all.
        tstf adjust_shifts
        bz NoAdjust

Adjust:
 clrc
        rlf freq_lo,f
        rlf freq_ml,f
        rlf freq_mh,f
        rlf freq_hi,f
        decfsz adjust_shifts,f
        goto Adjust

NoAdjust:
 ; Check the result against under- and overflow.
        ; (There should be none if the frequency didn't change too rapidly
        ; between the range-detection and the actual measurement )
        movf freq_hi,w ; underflow (freq = 0) ?
        iorwf freq_mh,w
        iorwf freq_ml,w
        iorwf freq_lo,w
        bz freq_underflow ; branch if yes

        btfsc freq_hi,7 ; overflow (freq > 7FFfffffh) ?
        goto freq_overflow ; branch if yes

        ; Save the frequency value without offset for programming mode in 'freq2',
        ; because 'freq' will be lost when splitting it into digits.
        movf freq_hi,w
        movwf freq2_hi
        movf freq_mh,w
        movwf freq2_mh
        movf freq_ml,w
        movwf freq2_ml
        movf freq_lo,w
        movwf freq2_lo

        ; Add the programmable frequency offset
        ; (often used to add or subtract the intermediate frequency in superhet receivers)
        add32 freq, foffs ; freq := freq+foffs; 32-bit
        ; If the result is negative, make it posisive
        btfss freq_hi, 7 ; bit 7 of the most significant byte is the SIGN
        goto f_positive ; skip the following MACRO if positive..
        neg32 freq ; freq := -freq (32-bit)

f_positive:
        call CvtAndDisplayFreq ; Convert <freq> into BCD and show it on the display

CheckProgMode:
        ; Arrived here, the frequency is still valid in 'freq2'
        ; but not in 'freq'. Poll the programming key,
        ; maybe the user wants to save this value as the new
        ; FREQUENCY OFFSET .

        btfss PORTA,5 ; digital input signal, LOW enters programming mode ; Button "program mode" pressed ?
        goto EnterProgLoop ; Yes, enter programming mode !
 ; not 0


        goto MainLoop ; end of main loop

;--------------------------------------------------------------------------
; frequency underflow (frequency < 1Hz)
;--------------------------------------------------------------------------

freq_underflow:
        movlw BLANK ; display underflow as "    0"
        call conv_char0
        movlw BLANK
        call conv_char1
        movlw BLANK
        call conv_char2
        ; 2021-02-23 (Ho-Ro): modified to use the 5th digit for display
        ; variants #2 #3. For variant #1 the code is like it was
# 1997 "counter.s"
        movlw BLANK ;
        call conv_char3
        movlw 0
        call conv_char4 ; use the 5th digit because its there !
; 2 #2 + #3

        goto CheckProgMode

;--------------------------------------------------------------------------
; frequency overflow (frequency > 50MHz)
;--------------------------------------------------------------------------

freq_overflow:
        ; 2021-02-23 (Ho-Ro): modified to display overflow as "E    "
        movlw CHAR_E
        call conv_char0
        movlw BLANK
        call conv_char1
        movlw BLANK
        call conv_char2
        movlw BLANK
        call conv_char3
        movlw BLANK
        call conv_char4 ; Note that the 5th digit is OPTIONAL !

        goto MainLoop ; end of main loop

;--------------------------------------------------------------------------
; program loop :
; - show a simple menu to select ADD or SUBTRACT offset,
; - save the frequency offset value permanently in DATA EEPROM,
; - return to the main loop when done .
;--------------------------------------------------------------------------

ProgModeDisplay:
 ; Subroutine to update the LED display in programming mode + delay
        movlw (PROGMODE_LOOPS)>>8 ; high byte for delay loops (usually 0.1 second)
        movwf gatecnt_hi
        movlw (PROGMODE_LOOPS)&0ffh ; low byte for delay loops
        movwf gatecnt_lo
        goto count_pulses ; update mux display + some delay + return

PmDisp_Quit:
 ; show "quit" on first 4 digits (quit programming mode)
        movlw CHAR_Q
        call conv_char0
        movlw CHAR_u
        call conv_char1
        movlw CHAR_i
        call conv_char2
        movlw CHAR_t

PmDisp4:
 call conv_char3 ; for menu items with 4 characters
        movlw BLANK

PmDisp5:
 call conv_char4
        goto ProgModeDisplay

PmDisp_PSave:
 ; show "PSave" or "Pnorm", depending on power-save flag
        btfss options,0 ; Power-save mode active ?
        goto PMD_NoPwSave
        movlw CHAR_P ; if so, print "PSAVE"..
        call conv_char0
        movlw CHAR_S
        call conv_char1
        movlw CHAR_A
        call conv_char2
        movlw CHAR_V
        call conv_char3
        movlw CHAR_E
        goto PmDisp5

PMD_NoPwSave:
 ; else print "NoPSV"
        movlw CHAR_N
        call conv_char0
        movlw CHAR_o
        call conv_char1
        movlw CHAR_P
        call conv_char2
        movlw CHAR_S
        call conv_char3
        movlw CHAR_V
        goto PmDisp5

PmDisp_Add:
 ; show "Add " on first 4 digits (add frequency offset)
        movlw CHAR_A
        call conv_char0
        movlw CHAR_d
        call conv_char1
        movlw CHAR_d
        call conv_char2
        movlw BLANK
        goto PmDisp4

PmDisp_Sub: ; show "Sub " on first 4 digits (subtract frequency offset)
        movlw CHAR_S
        call conv_char0
        movlw CHAR_u
        call conv_char1
        movlw CHAR_b
        call conv_char2
        movlw BLANK
        goto PmDisp4

PmDisp_Zero:
 ; show "Zero" on first 4 digits (set frequency offset to zero)
        movlw CHAR_Z
        call conv_char0
        movlw CHAR_E
        call conv_char1
        movlw CHAR_r
        call conv_char2
        movlw CHAR_o
        goto PmDisp4

PmDisp_StIF:
 ; show "taBLE" on first 4 digits (select standard IF)
        movlw CHAR_t
        call conv_char0
        movlw CHAR_A
        call conv_char1
        movlw CHAR_b
        call conv_char2
        movlw CHAR_L
        call conv_char3
        movlw CHAR_E
        call conv_char4
        goto ProgModeDisplay

PmDisp_IF_1:
 ; show 1st standard IF from table
        movlw 0x04 + 4*0
        goto PmLoadFreq2

PmDisp_IF_2:
 ; show 2nd standard IF from table
        movlw 0x04 + 4*1
        goto PmLoadFreq2

PmDisp_IF_3:
 ; show 3rd standard IF from table
        movlw 0x04 + 4*2
        goto PmLoadFreq2

PmDisp_IF_4:
 ; show 4th standard IF from table
        movlw 0x04 + 4*3
        goto PmLoadFreq2

PmDisp_IF_5:
 ; show 5th standard IF from table
        movlw 0x04 + 4*4
        goto PmLoadFreq2

PmDisp_IF_6:
 ; show 6th standard IF from table
        movlw 0x04 + 4*5
        goto PmLoadFreq2

PmLoadFreq2:
 ; Load <freq2> from EEPROM[w] and show it on the display
        movwf bTemp
        movlw freq2 ; load the ADDRESS of 'freq2' ...
        movwf FSR ; ... into the PIC's "pointer" register
        movf bTemp,w ; and the EEPROM-internal offset into W
        call EEPROM_Read4Byte ; read <freq2> from EEPROM : *FSR = EEPROM[W]
        movlw freq2 ; load the ADDRESS of 'freq2' again ...
        movwf FSR ; ... into the PIC's "pointer" register
        call ShowInt32_FSR ; Splitt <*FSR> (32 bit integer) to 8 BCD-digits...
        goto ProgModeDisplay ; and show it for 0.1 seconds, maybe more


; "Execution" of the selectable menu items. Invoked after long key press.
PmExec_Quit:
 ; quit programming mode (without changing anything)
        goto MainRestart

PmExec_PSave:
 ; turn power-saving mode on/off
        movlw 0x01 ; bit0 = power-save
        xorwf options,f ; toggle Power-save flag in sofware-"options" register
        movlw options ; load the ADDRESS of 'options' ...
        movwf FSR ; ... into the PIC's "pointer" register
        movlw 0x20 ; load the EEPROM-internal address offset (=destination)
        call SaveInEEPROM ; write *FSR into EEPROM[w] (bits 31..24)
        goto ProgModeDisplay

PmExec_Add:
 ; add frequency offset from now on .
        ; This is achieved by saving the currently measured frequency
        ; in EEPROM memory and restarting the counter.

SaveFreq2:
 ; save <freq2> (4 bytes) in the PIC's EEPROM memory :
        movlw freq2 ; load the ADDRESS of 'freq2' ...
        movwf FSR ; ... into the PIC's "pointer" register
        movlw 0x00 ; load the EEPROM-internal address offset (=destination)
        call SaveInEEPROM ; write *FSR into EEPROM[w] (bits 31..24)
        incf FSR,f ; next source address please
        movlw 0x00 +1 ; next destination address
        call SaveInEEPROM ; write *FSR into EEPROM[w] (bits 23..16)
        incf FSR,f ; next source address please
        movlw 0x00 +2 ; next destination address
        call SaveInEEPROM ; write *FSR into EEPROM[w] (bits 15..8)
        incf FSR,f ; next source address please
        movlw 0x00 +3 ; next destination address
        call SaveInEEPROM ; write *FSR into EEPROM[w] (bits 7..0)
        goto MainRestart ; restart with new frequency offset

PmExec_Sub:
 ; subtract frequency offset from now on
        ; This is achieved by making 'freq2' negative (two's complement)
        ; and then saving it in EEPROM.
        neg32 freq2 ; freq2 := -freq2 (32 bit)
        goto SaveFreq2 ; save freq2 in EEPROM and restart

PmExec_Zero:
 ; set frequency offset to zero
        clrf freq2_hi ; freq2 := 0 (32 bit)
        clrf freq2_mh ; ... medium high byte
        clrf freq2_ml ; ... medium low byte
        clrf freq2_lo ; ... low byte
        goto SaveFreq2 ; save freq2 in EEPROM and restart

PmExec_StIF:
 ; switch to "Standard IF selection mode"
        movlw MI_IF_1

PmExec_SetMI:
 movwf menu_index
        goto ProgLoop ;

PmExec_SelIF:
 ; Finished selecting a "standard IF" from table.
        ; Switch back to the main menu, and let
        ; the user decide if the offset is positive (add)
        ; or negative (sub).
        movlw MI_ADD ; Suggestion: ADD the offset
        goto PmExec_SetMI

EnterProgLoop:
        ; Prepare 'program mode' :
        clrf menu_index

        ; Show "Prog" on the display
        movlw CHAR_P
        call conv_char0
        movlw CHAR_r
        call conv_char1 ; show "Prog" on the display..
        movlw CHAR_o
        call conv_char2
        movlw CHAR_G
        call conv_char3
        movlw BLANK ; Note that the 5th digit is OPTIONAL so we don't use it here
        call conv_char4
        ; wait until the operator releases the "Prog" key, while display runs

Enter2:
 call ProgModeDisplay ; update mux display + provide some delay
        btfss PORTA,5 ; digital input signal, LOW enters programming mode ; Button "program mode" still pressed ?
        goto Enter2 ; yes, continue loop while displaying "Prog"

ProgLoop:
        incf blinker, f ; Toggle the blink flag (for flashing for kHz-point)
        ; Show "quit", "add", "sub", "zero", ... on the display depending on menu_index (0..3)
        call PMDisplay ; show string[menu_index] on LED display (from table)
        btfsc PORTA,5 ; digital input signal, LOW enters programming mode ; "program key" pressed now ? (low means pressed)
        goto ProgLoop ; no, wait until user presses it
        ; Arrived here, the key is PRESSED. The question is how long...
        ; A short press means "advance to the next menu index" ,
        ; a longer press means "execute the selected function" .
        ; Everything under 1 second is considered a "short press".
        movlw 10 ; 10 * 0.1 sec
        movwf menu_timer

ChkKey:
 btfsc PORTA,5 ; digital input signal, LOW enters programming mode ; "program key" still pressed ? (low means pressed)
        goto ShortPress ; no, key released, it was a SHORT press (less than 0.5 seconds)
        call ProgModeDisplay ; wait another 100 milliseconds
        decfsz menu_timer, f ; decrement timer and skip next instruction if NOT zero
        goto ChkKey ;
        ; Arrived here, it's a LONG key press, but the key is still down..
        ; Wait until the operator releases the "Prog" key
        ; Show a BLINKING display while the button is pressed,
        ; as an indicator for the user to release the button now.

Release2:
 call ClearDisplay ; fill display latch with blanking pattern
        call ProgModeDisplay ; show blank display for 0.1 seconds
        call PMDisplay ; show string[menu_index] for 0.1 seconds
        btfss PORTA,5 ; digital input signal, LOW enters programming mode ; Button "program mode" still pressed ?
        goto Release2 ; yes, wait for button release, otherwise..
        goto PMExecute ; Execute the function belonging to menu_index

ShortPress:
 ; advance to the next menu index, but don't execute the associated function
        movf menu_index,w
        sublw MI_INDEX_MAX ; subtract #MI_INDEX_MAX - W register -> C=0 if result negative ("W too large")
        btfsc STATUS,STATUS_Z_POSITION ; skip next instruction if Z=0
        goto LastMainMenu ; Z=1 means "this is the last item in the main menu"
        btfss STATUS,STATUS_C_POSITION ; skip next instruction if C=1
        goto NotMainMenu ; C=0 means "this is not the main menu"
        incf menu_index, f ; menu_index := menu_index+1
        goto ProgLoop ; end of programming loop

LastMainMenu:
        clrf menu_index ; wrap to 1st menu index
        goto ProgLoop

NotMainMenu:
 ; not main menu, but sub-menu ..
        movf menu_index,w
        sublw MI_IF_SUBMENU_MAX ; subtract #MI_.. - W register -> C=0 if result negative ("W too large")
        btfsc STATUS,STATUS_Z_POSITION ; skip next instruction if Z=0
        goto LastIfSubMenu ; Z=1 means "this is the last item in the main menu"
        btfss STATUS,STATUS_C_POSITION ; skip next instruction if C=1
        goto NotIfSubMenu ; C=0 means "this is not the main menu"
        incf menu_index, f ; menu_index := menu_index+1 (in submenu)
        goto ProgLoop ;

LastIfSubMenu:
 ; was in the last "standard IF submenu"..
        movlw MI_IF_1 ; back to the 1st standard IF submenu
        movwf menu_index
        goto ProgLoop

NotIfSubMenu:
 ; was not in the "standard IF submenu"..
        clrf menu_index ; must be an error; back to main menu
        goto ProgLoop

  END resetVec ; directive 'end of program'
