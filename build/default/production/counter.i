# 1 "counter.s"
# 1 "<built-in>" 1
# 1 "counter.s" 2
# 45 "counter.s"
 PROCESSOR 16F628A
 RADIX DEC

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
# 48 "counter.s" 2
# 75 "counter.s"
   MESSG "Using default: 5 digits, new pin layout, common cathode LEDs"
# 176 "counter.s"
    CONFIG FOSC = HS






CONFIG WDTE = ON
CONFIG PWRTE = ON
CONFIG MCLRE = OFF
CONFIG BOREN = OFF
CONFIG LVP = OFF
CONFIG CPD = OFF
CONFIG CP = OFF
# 204 "counter.s"
PORT_A_IO equ 0b0000
PORT_B_IO equ 0b00000000

LEDS_PORT equ PORTB

ENABLE_PORT equ PORTA
# 226 "counter.s"
    CLOCK equ 20000000
# 243 "counter.s"
    TIME equ 20





CYCLES equ TIME*CLOCK/1000000

GATE_TIME_LOOPS equ CLOCK/CYCLES

LAMPTEST_LOOPS equ CLOCK/(2*CYCLES)

PROGMODE_LOOPS equ CLOCK/(10*CYCLES)





    PSAVE_DELAY_TIME equ 60

PSAVE_FLASHUP_TIME equ 14
PSAVE_MAX_DIFF equ 10





MI_QUIT equ 0
MI_PSAVE equ 1
MI_ADD equ 2
MI_SUB equ 3
MI_ZERO equ 4
MI_STD_IF equ 5
MI_INDEX_MAX equ 5
MI_IF_1 equ 6
MI_IF_2 equ 7
MI_IF_3 equ 8
MI_IF_4 equ 9
MI_IF_5 equ 0x0A
MI_IF_6 equ 0x0B
MI_IF_QT equ 0x0C
MI_IF_SUBMENU_MAX equ 0x0B
;MI_IF_5 equ 0x0A
;MI_IF_QT equ 0x0B
;MI_IF_SUBMENU_MAX equ 0x0A
# 312 "counter.s"
tens_index equ 0x27
divi equ 0x28
divi_hi equ 0x28
divi_mh equ 0x29
divi_ml equ 0x2A
divi_lo equ 0x2B

timer0_old equ 0x2C

gatecnt_hi equ 0x2D
gatecnt_lo equ 0x2E

bTemp equ 0x2F


freq equ 0x30
freq_hi equ 0x30
freq_mh equ 0x31
freq_ml equ 0x32
freq_lo equ 0x33

freq2 equ 0x34
freq2_hi equ 0x34
freq2_mh equ 0x35
freq2_ml equ 0x36
freq2_lo equ 0x37

foffs equ 0x38
foffs_hi equ 0x38
foffs_mh equ 0x39
foffs_ml equ 0x3A
foffs_lo equ 0x3B


menu_index equ 0x3C
menu_timer equ 0x3D

digits equ 0x40
digit_0 equ 0x40
digit_1 equ 0x41
digit_2 equ 0x42
digit_3 equ 0x43
digit_4 equ 0x44
digit_5 equ 0x45
digit_6 equ 0x46
digit_7 equ 0x47
digit_8 equ 0x48

display0 equ 0x49
display1 equ 0x4A
display2 equ 0x4B
display3 equ 0x4C
display4 equ 0x4D

disp_index equ 0x4E
disp_timer equ 0x4F

adjust_shifts equ 0x50

blinker equ 0x51

psave_timer equ 0x52
psave_freq_lo equ 0x53
psave_flags equ 0x54


options equ 0x55
# 387 "counter.s"
eep_dw MACRO value
    db (value>>24),(value>>16) and 0xFF,(value>>8) and 0xFF,value and 0xFF
        ENDM
# 406 "counter.s"
  PSECT edata


    eep_dw 0

    eep_dw 455000
    eep_dw 3999000
    eep_dw 4194304
    eep_dw 4433619
    eep_dw 10695000
    eep_dw 10700000

    db 0
# 427 "counter.s"
skpnc macro
 btfsc ((STATUS) and 07Fh), 0
      endm


skpc macro
 btfss ((STATUS) and 07Fh), 0
      endm


skpz macro
 btfss ((STATUS) and 07Fh), 2
      endm


skpnz macro
 btfsc ((STATUS) and 07Fh), 2
      endm


tstf macro addr
 movf addr
      endm


clrc macro
 bcf STATUS,STATUS_C_POSITION
      endm


bc macro addr
 btfsc STATUS,STATUS_C_POSITION
  goto addr
      endm


bnc macro addr
 btfss STATUS,STATUS_C_POSITION
 goto addr
      endm


bnz macro addr
 btfss STATUS,STATUS_Z_POSITION
 goto addr
      endm


setc macro
 bsf STATUS,STATUS_C_POSITION
      endm


bz macro addr
 btfsc STATUS,STATUS_Z_POSITION
 goto addr
      endm
# 499 "counter.s"
cquad macro value
          retlw value>>24
          retlw (value>>16) and 0xFF
          retlw (value>>8) and 0xFF
          retlw value and 0xFF
       endm

table macro label
 label addwf PCL,f
       endm







addcwf macro reg
     local add1,add2
     bnc add1
     addwf reg,f
     incf reg,f
     skpnz
     setc
     goto add2
     add1:
  addwf reg,f
     add2:
          endm
# 536 "counter.s"
subncwf macro reg

          local sub1,sub2

          bc sub1
          subwf reg,f
          skpnz
          clrc
          decf reg,f
          goto sub2
sub1:
   subwf reg,f
sub2:
          endm
# 558 "counter.s"
add32 macro op1,op2

          movf op2+3,w
          addwf op1+3,f

          movf op2+2,w
          addcwf op1+2

          movf op2+1,w
          addcwf op1+1

          movf op2+0,w
          addcwf op1+0

        endm
# 581 "counter.s"
sub32 macro op1,op2

          movf op2+3,w
          subwf op1+3,f

          movf op2+2,w
          subncwf op1+2

          movf op2+1,w
          subncwf op1+1

          movf op2+0,w
          subncwf op1+0

        endm






neg32 macro op
       local neg_done
           comf op, f
           comf op+1, f
           comf op+2, f
           comf op+3, f



           incfsz op+3, f
           goto neg_done
           incfsz op+2, f
           goto neg_done
           incfsz op+1, f
           goto neg_done
           incfsz op+0, f
           goto neg_done
neg_done:
       endm







    PSECT resetVec,class=CODE,delta=2


    resetVec:
 goto MainInit
# 649 "counter.s"
CHAR_A equ 10
CHAR_b equ 11
CHAR_c equ 12
CHAR_d equ 13
CHAR_E equ 14
CHAR_F equ 15
CHAR_G equ 16
CHAR_H equ 17
CHAR_i equ 18

BLANK equ 19
TEST equ 20

CHAR_P equ 21
CHAR_r equ 22
CHAR_o equ 23
CHAR_Q equ 24
CHAR_u equ 25
CHAR_t equ 26
CHAR_S equ 27
CHAR_Z equ 28
CHAR_I equ 29
CHAR_J equ 30
CHAR_k equ 31
CHAR_L equ 32
CHAR_N equ 33
CHAR_V equ 34
CHAR_EQ equ 35
# 692 "counter.s"
    DPPOINT_BIT equ 1
# 704 "counter.s"
BLANK_PATTERN equ 0b00000000
# 721 "counter.s"
Digit2SevenSeg:






    addwf PCL,F


   retlw (0x40 +0x80 +0x04 +0x01 +0x08 +0x10 )^0x00
          retlw ( 0x80 +0x04 )^0x00
          retlw (0x40 +0x80 +0x01 +0x08 +0x20)^0x00
          retlw (0x40 +0x80 +0x04 +0x01 +0x20)^0x00
          retlw ( 0x80 +0x04 +0x10 +0x20)^0x00
          retlw (0x40 +0x04 +0x01 +0x10 +0x20)^0x00
          retlw (0x40 +0x04 +0x01 +0x08 +0x10 +0x20)^0x00
          retlw (0x40 +0x80 +0x04 )^0x00
          retlw (0x40 +0x80 +0x04 +0x01 +0x08 +0x10 +0x20)^0x00
          retlw (0x40 +0x80 +0x04 +0x01 +0x10 +0x20)^0x00
          retlw (0x40 +0x80 +0x04 +0x08 +0x10 +0x20)^0x00
          retlw ( 0x04 +0x01 +0x08 +0x10 +0x20)^0x00
          retlw ( 0x01 +0x08 +0x20)^0x00
          retlw ( 0x80 +0x04 +0x01 +0x08 +0x20)^0x00
          retlw (0x40 +0x01 +0x08 +0x10 +0x20)^0x00
          retlw (0x40 +0x08 +0x10 +0x20)^0x00
          retlw (0x40 +0x04 +0x01 +0x08 +0x10 )^0x00
          retlw ( 0x80 +0x04 +0x08 +0x10 +0x20)^0x00
          retlw ( 0x08 )^0x00

          retlw (BLANK_PATTERN )^0x00
          retlw (0b11111111 )^0x00


          retlw (0x40 +0x80 +0x08 +0x10 +0x20)^0x00
          retlw ( 0x08 +0x20)^0x00
          retlw ( 0x04 +0x01 +0x08 +0x20)^0x00
          retlw (0x40 +0x80 +0x04 +0x10 +0x20)^0x00
          retlw ( 0x04 +0x01 +0x08 )^0x00
          retlw ( 0x01 +0x08 +0x10 +0x20)^0x00
          retlw (0x40 +0x04 +0x01 +0x10 +0x20)^0x00
          retlw (0x40 +0x80 +0x01 +0x08 +0x20)^0x00
          retlw ( 0x08 +0x10 )^0x00
          retlw ( 0x80 +0x04 +0x01 )^0x00
          retlw ( 0x01 +0x08 +0x10 +0x20)^0x00
          retlw ( 0x01 +0x08 +0x10 )^0x00
          retlw (0x40 +0x80 +0x04 +0x08 +0x10 )^0x00
          retlw ( 0x04 +0x01 +0x08 +0x10 )^0x00
          retlw ( 0x01 +0x20)^0x00
# 782 "counter.s"
Digit2MuxValue:
          addwf PCL,f
# 798 "counter.s"
          retlw 0b11110111
          retlw 0b11111011
          retlw 0b11111110
          retlw 0b11111101

            retlw 0b11111111
# 831 "counter.s"
TensTable:
 addwf PCL,f
 cquad 10000000
 cquad 1000000
 cquad 100000
 cquad 10000
 cquad 1000
 cquad 100
 cquad 10
 cquad 1
# 850 "counter.s"
PMDisplay:
          movf menu_index, w
          addwf PCL, f
          goto PmDisp_Quit
          goto PmDisp_PSave
          goto PmDisp_Add
          goto PmDisp_Sub
          goto PmDisp_Zero
          goto PmDisp_StIF
          goto PmDisp_IF_1
          goto PmDisp_IF_2
          goto PmDisp_IF_3
          goto PmDisp_IF_4
          goto PmDisp_IF_5
          goto PmDisp_IF_6
          goto PmDisp_Quit







PMExecute:

          movf menu_index, w
          addwf PCL, f
          goto PmExec_Quit
          goto PmExec_PSave
          goto PmExec_Add
          goto PmExec_Sub
          goto PmExec_Zero
          goto PmExec_StIF
          goto PmExec_SelIF
          goto PmExec_SelIF
          goto PmExec_SelIF
          goto PmExec_SelIF
          goto PmExec_SelIF
          goto PmExec_Quit
# 926 "counter.s"
PSC_DIV_BY_2 equ 0b00100000
PSC_DIV_BY_4 equ 0b00100001
PSC_DIV_BY_8 equ 0b00100010
PSC_DIV_BY_16 equ 0b00100011
PSC_DIV_BY_32 equ 0b00100100
PSC_DIV_BY_64 equ 0b00100101
PSC_DIV_BY_128 equ 0b00100110
PSC_DIV_BY_256 equ 0b00100111

SetPrescaler:

        clrwdt
        bsf STATUS, STATUS_RP0_POSITION

        movwf OPTION_REG
        bcf STATUS, STATUS_RP0_POSITION
        retlw 0


PrescalerOff:


        clrwdt
        clrf TMR0
        bsf STATUS, STATUS_RP0_POSITION

        movlw 0b00100111

        movwf OPTION_REG
        clrwdt
        movlw 0b00101111
        movwf OPTION_REG
        bcf STATUS, STATUS_RP0_POSITION
        retlw 0
# 969 "counter.s"
Sleep150ms:
# 998 "counter.s"
        movlw 0x00



        movwf LEDS_PORT



        clrf INTCON
        clrwdt
        clrf TMR0
        bsf STATUS, STATUS_RP0_POSITION

        movlw 0b00101011
        movwf OPTION_REG
        bcf STATUS, STATUS_RP0_POSITION
        sleep




        nop
        return






conv macro display
        movwf display
        andlw 7fh
        call Digit2SevenSeg
        btfsc display,7

        iorlw 1<<DPPOINT_BIT




        movwf display
     endm

conv_char0:

        conv display0
        retlw 0

conv_char1:

        conv display1
        retlw 0

conv_char2:

        conv display2
        retlw 0

conv_char3:

        conv display3
        retlw 0

conv_char4:

        conv display4
        retlw 0




ClearDisplay:
        movlw BLANK_PATTERN
        movwf display0
        movwf display1
        movwf display2
        movwf display3
        movwf display4
        retlw 0
# 1095 "counter.s"
SaveInEEPROM:

        bcf INTCON, INTCON_GIE_POSITION
        bsf STATUS, STATUS_RP0_POSITION
        movwf EEADR
        bcf STATUS, STATUS_RP0_POSITION
        movf INDF, w
        bsf STATUS, STATUS_RP0_POSITION
        movwf EEDATA
        bsf EECON1, EECON1_WREN_POSITION
        bcf INTCON, INTCON_GIE_POSITION
        movlw 055h
        movwf EECON2
        movlw 0AAh
        movwf EECON2
        bsf EECON1, EECON1_WR_POSITION


SaveEW:
 btfsc EECON1, EECON1_WR_POSITION
        goto SaveEW

        bcf EECON1, EECON1_WREN_POSITION
        bcf STATUS, STATUS_RP0_POSITION
        retlw 0
# 1134 "counter.s"
EEPROM_ReadByte:

        movwf bTemp
        bcf INTCON, INTCON_GIE_POSITION
        bsf STATUS, STATUS_RP0_POSITION
        movwf EEADR
        bsf EECON1, EECON1_RD_POSITION
        movf EEDATA, w
        bcf STATUS, STATUS_RP0_POSITION
        movwf INDF
        movf bTemp, W
        return


EEPROM_Read4Byte:





        call EEPROM_ReadByte
        addlw 1
        incf FSR , f
        call EEPROM_ReadByte
        addlw 1
        incf FSR , f
        call EEPROM_ReadByte
        addlw 1
        incf FSR , f
        goto EEPROM_ReadByte
# 1173 "counter.s"
count_pulses:
        clrf freq_hi
        clrf freq_mh
        clrf freq_ml
        clrf freq_lo

        clrf timer0_old
        clrf TMR0

        nop
        nop
# 1205 "counter.s"
count1:
 movf disp_index, w
        call Digit2MuxValue
        movwf bTemp
        movlw display0
        addwf disp_index,w
        movwf FSR
        movf INDF,w
        movwf LEDS_PORT
        movf bTemp,w
        movwf ENABLE_PORT

        incf disp_timer,f
        btfsc disp_timer,6
        incf disp_index,f
        bcf disp_timer,6
        movf disp_index,w
        sublw 4
        btfss STATUS,STATUS_C_POSITION
        clrf disp_index





        movf TMR0,w
        movwf freq_lo

        movlw 1
        btfss timer0_old,7
        clrw
        btfsc freq_lo,7
        clrw

        addwf freq_ml,f
        skpnc
        incf freq_mh,f




        btfsc freq_mh,7
        goto count3

        movf freq_lo,w
        movwf timer0_old

        tstf gatecnt_lo
        skpnz
        decf gatecnt_hi,f
        decf gatecnt_lo,f
# 1272 "counter.s"
        clrwdt
        movlw 12
WasteT1:
 addlw 0xFF
        btfss STATUS, STATUS_Z_POSITION
        goto WasteT1

        nop
        nop
        nop
        nop
        nop
        movf gatecnt_hi,w
        iorwf gatecnt_lo,w
        skpz
        goto count1




        movf TMR0,w
        movwf freq_lo

        movlw 1
        btfss timer0_old,7
        clrw
        btfsc freq_lo,7
        clrw

        addwf freq_ml,f
        skpnc
        incf freq_mh,f

count3:
 retlw 0
# 1315 "counter.s"
ShowInt32_FSR:

        movf INDF,w
        incf FSR,f
        movwf freq
        movf INDF,w
        incf FSR,f
        movwf freq+1
        movf INDF,w
        incf FSR,f
        movwf freq+2
        movf INDF,w
        incf FSR,f
        movwf freq+3






CvtAndDisplayFreq:

        clrf tens_index

        movlw digits
        movwf FSR

conv1:

        clrwdt
        movf tens_index,w
        call TensTable
        movwf divi+0
        incf tens_index,f

        movf tens_index,w
        call TensTable
        movwf divi+1
        incf tens_index,f

        movf tens_index,w
        call TensTable
        movwf divi+2
        incf tens_index,f

        movf tens_index,w
        call TensTable
        movwf divi+3
        incf tens_index,f


        clrf INDF

conv2:


        sub32 freq,divi
        bnc conv3
        incf INDF,f
        goto conv2

conv3:
 add32 freq,divi
        incf FSR,f
        movlw 8*4
        subwf tens_index,w
        bnz conv1





display_freq:
# 1406 "counter.s"
        movlw digits
        movwf FSR
        tstf INDF
        bnz displ_MHz
        incf FSR,f
        tstf INDF
        bnz displ_MHz
        incf FSR,f
        tstf INDF
        bnz displ_kHz
        incf FSR,f
        tstf INDF
        bnz displ_kHz
        incf FSR,f


displ_kHz:

        btfsc blinker, 0
        bsf digit_4, 7
        goto display

displ_MHz:

        bsf digit_1, 7

display:

        movf INDF,w
        call conv_char0
        incf FSR,f
        movf INDF,w
        call conv_char1
        incf FSR,f
        movf INDF,w
        call conv_char2
        incf FSR,f
        movf INDF,w
        call conv_char3
        incf FSR,f
        movf INDF,w
        goto conv_char4





PSECT code
MainInit:
# 1467 "counter.s"
 movlw PORT_A_IO
        bsf STATUS, STATUS_RP0_POSITION
        movwf PORTA
        bcf STATUS, STATUS_RP0_POSITION
        clrf PORTA

        movlw PORT_B_IO
        bsf STATUS, STATUS_RP0_POSITION
        movwf PORTB
        bcf STATUS, STATUS_RP0_POSITION
        clrf PORTB

        clrf disp_index
        clrf disp_timer

        movlw BLANK
        movwf digit_8

        movlw TEST
        call conv_char0
        movlw TEST
        call conv_char1
        movlw TEST
        call conv_char2
        movlw TEST
        call conv_char3
        movlw TEST
        call conv_char4

 movlw PSC_DIV_BY_256
        call SetPrescaler



        movlw (LAMPTEST_LOOPS)>>8
        movwf gatecnt_hi
        movlw (LAMPTEST_LOOPS)&0ffh
        movwf gatecnt_lo
        call count_pulses



MainRestart:

        clrf psave_timer
        clrf psave_flags
        movlw foffs
        movwf FSR
        movlw 0x00 +0
        call EEPROM_Read4Byte
        movlw options
        movwf FSR
        movlw 0x20
        call EEPROM_ReadByte





        call ClearDisplay





MainLoop:


        bsf STATUS, STATUS_RP0_POSITION
        movlw PORT_A_IO
        movwf PORTA
        movlw PORT_B_IO
        movwf PORTB
        bcf STATUS, STATUS_RP0_POSITION
        clrwdt
        movlw 0b100000

        bsf STATUS, STATUS_RP0_POSITION

        movwf OPTION_REG
        bcf STATUS, STATUS_RP0_POSITION
# 1559 "counter.s"
RANGE_DET_LOOPS equ CLOCK/(30*CYCLES)

        movlw (RANGE_DET_LOOPS)>>8
        movwf gatecnt_hi
        movlw (RANGE_DET_LOOPS)&0ffh
        movwf gatecnt_lo
        movlw PSC_DIV_BY_64
        call SetPrescaler

        call count_pulses
# 1585 "counter.s"
        movlw (GATE_TIME_LOOPS/4)>>8
        movwf gatecnt_hi
        movlw (GATE_TIME_LOOPS/4)&0ffh
        movwf gatecnt_lo




        incf blinker,f
        incf psave_timer,f
# 1650 "counter.s"
        movf freq_ml, w
        andlw 0b11000000
        btfss STATUS,STATUS_Z_POSITION
        goto Range7
        btfsc freq_ml,5
        goto Range6
        btfsc freq_ml,4
        goto Range5
        btfsc freq_ml,3
        goto Range4
        btfsc freq_ml,2
        goto Range3
        btfsc freq_ml,1
        goto Range3
        btfsc freq_ml,0
        goto Range3
        movf freq_lo,w
        sublw 52
        btfss STATUS,STATUS_C_POSITION
        goto Range3
# 1681 "counter.s"
Range1:

        call PrescalerOff
        incf psave_timer,f
        incf psave_timer,f
        incf psave_timer,f

        movlw (GATE_TIME_LOOPS)>>8
        movwf gatecnt_hi
        movlw (GATE_TIME_LOOPS)&0ffh
        movwf gatecnt_lo

        movlw 0
        goto GoMeasure

Range2:

        call PrescalerOff
        incf psave_timer,f

        movlw (GATE_TIME_LOOPS/2)>>8
        movwf gatecnt_hi
        movlw (GATE_TIME_LOOPS/2)&0ffh
        movwf gatecnt_lo

        movlw 1
        goto GoMeasure

Range3:

        call PrescalerOff
        movlw 2
        goto GoMeasure

Range4:

        movlw PSC_DIV_BY_2
        call SetPrescaler
        movlw 3
        goto GoMeasure

Range5:

        movlw PSC_DIV_BY_4
        call SetPrescaler
        movlw 4
        goto GoMeasure

Range6:

        movlw PSC_DIV_BY_8
        call SetPrescaler
        movlw 5
        goto GoMeasure

Range7:

        movlw PSC_DIV_BY_16
        call SetPrescaler
        movlw 6
        goto GoMeasure
# 1761 "counter.s"
GoMeasure:
 movwf adjust_shifts
        call count_pulses





        btfss options,0
        goto PsNotBlanked



        btfsc psave_flags,0
        call ClearDisplay







        movf freq_lo,w
        subwf psave_freq_lo,w

        movwf bTemp
        btfss bTemp,7
        goto PsDiffPos
        comf bTemp,f
        incf bTemp,f
PsDiffPos:



        movf bTemp,w
        sublw PSAVE_MAX_DIFF
        btfsc STATUS,STATUS_C_POSITION
        goto PsSmallDiff
PsLargeDiff:

          bcf psave_flags,0
          clrf psave_timer
          movf freq_lo,w
          movwf psave_freq_lo
          goto PsNotBlanked
PsSmallDiff:

        btfsc psave_flags,0
        goto PsActive

        movf psave_timer,w
        sublw PSAVE_DELAY_TIME
        btfsc STATUS,STATUS_C_POSITION
        goto PsNoTimeout

        movlw PSAVE_FLASHUP_TIME-1
        movwf psave_timer
        bsf psave_flags,0
        movf freq_lo,w
        movwf psave_freq_lo
        goto PsSleep

PsActive:



        movf psave_timer,w
        sublw PSAVE_FLASHUP_TIME
        btfsc STATUS,STATUS_C_POSITION
        goto PsSleep

PsFlashUp:
 clrf psave_timer
        movf freq_lo, w
        movwf psave_freq_lo
        clrf psave_timer
        goto PsNotBlanked

PsNoTimeout:


        btfss psave_flags,0
        goto PsNotBlanked




PsSleep:
 call Sleep150ms
        call Sleep150ms
        call Sleep150ms
        goto CheckProgMode

PsNotBlanked:







PrepDisp:




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



        movf freq_hi,w
        iorwf freq_mh,w
        iorwf freq_ml,w
        iorwf freq_lo,w
        bz freq_underflow

        btfsc freq_hi,7
        goto freq_overflow



        movf freq_hi,w
        movwf freq2_hi
        movf freq_mh,w
        movwf freq2_mh
        movf freq_ml,w
        movwf freq2_ml
        movf freq_lo,w
        movwf freq2_lo



        add32 freq, foffs

        btfss freq_hi, 7
        goto f_positive
        neg32 freq

f_positive:
        call CvtAndDisplayFreq

CheckProgMode:





        btfss PORTA,5
        goto EnterProgLoop



        goto MainLoop





freq_underflow:
        movlw BLANK
        call conv_char0
        movlw BLANK
        call conv_char1
        movlw BLANK
        call conv_char2
# 1948 "counter.s"
        movlw BLANK
        call conv_char3
        movlw 0
        call conv_char4


        goto CheckProgMode





freq_overflow:

        movlw CHAR_E
        call conv_char0
        movlw BLANK
        call conv_char1
        movlw BLANK
        call conv_char2
        movlw BLANK
        call conv_char3
        movlw BLANK
        call conv_char4

        goto MainLoop
# 1982 "counter.s"
ProgModeDisplay:

        movlw (PROGMODE_LOOPS)>>8
        movwf gatecnt_hi
        movlw (PROGMODE_LOOPS)&0ffh
        movwf gatecnt_lo
        goto count_pulses

PmDisp_Quit:

        movlw CHAR_Q
        call conv_char0
        movlw CHAR_u
        call conv_char1
        movlw CHAR_i
        call conv_char2
        movlw CHAR_t

PmDisp4:
 call conv_char3
        movlw BLANK

PmDisp5:
 call conv_char4
        goto ProgModeDisplay

PmDisp_PSave:

        btfss options,0
        goto PMD_NoPwSave
        movlw CHAR_P
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

        movlw CHAR_A
        call conv_char0
        movlw CHAR_d
        call conv_char1
        movlw CHAR_d
        call conv_char2
        movlw BLANK
        goto PmDisp4

PmDisp_Sub:
        movlw CHAR_S
        call conv_char0
        movlw CHAR_u
        call conv_char1
        movlw CHAR_b
        call conv_char2
        movlw BLANK
        goto PmDisp4

PmDisp_Zero:

        movlw CHAR_Z
        call conv_char0
        movlw CHAR_E
        call conv_char1
        movlw CHAR_r
        call conv_char2
        movlw CHAR_o
        goto PmDisp4

PmDisp_StIF:

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

        movlw 0x04 + 4*0
        goto PmLoadFreq2

PmDisp_IF_2:

        movlw 0x04 + 4*1
        goto PmLoadFreq2

PmDisp_IF_3:

        movlw 0x04 + 4*2
        goto PmLoadFreq2

PmDisp_IF_4:

        movlw 0x04 + 4*3
        goto PmLoadFreq2

PmDisp_IF_5:

        movlw 0x04 + 4*4
        goto PmLoadFreq2

PmDisp_IF_6:

        movlw 0x04 + 4*5
        goto PmLoadFreq2

PmLoadFreq2:

        movwf bTemp
        movlw freq2
        movwf FSR
        movf bTemp,w
        call EEPROM_Read4Byte
        movlw freq2
        movwf FSR
        call ShowInt32_FSR
        goto ProgModeDisplay



PmExec_Quit:

        goto MainRestart

PmExec_PSave:

        movlw 0x01
        xorwf options,f
        movlw options
        movwf FSR
        movlw 0x20
        call SaveInEEPROM
        goto ProgModeDisplay

PmExec_Add:




SaveFreq2:

        movlw freq2
        movwf FSR
        movlw 0x00
        call SaveInEEPROM
        incf FSR,f
        movlw 0x00 +1
        call SaveInEEPROM
        incf FSR,f
        movlw 0x00 +2
        call SaveInEEPROM
        incf FSR,f
        movlw 0x00 +3
        call SaveInEEPROM
        goto MainRestart

PmExec_Sub:



        neg32 freq2
        goto SaveFreq2

PmExec_Zero:

        clrf freq2_hi
        clrf freq2_mh
        clrf freq2_ml
        clrf freq2_lo
        goto SaveFreq2

PmExec_StIF:

        movlw MI_IF_1

PmExec_SetMI:
 movwf menu_index
        goto ProgLoop

PmExec_SelIF:




        movlw MI_ADD
        goto PmExec_SetMI

EnterProgLoop:

        clrf menu_index


        movlw CHAR_P
        call conv_char0
        movlw CHAR_r
        call conv_char1
        movlw CHAR_o
        call conv_char2
        movlw CHAR_G
        call conv_char3
        movlw BLANK
        call conv_char4


Enter2:
 call ProgModeDisplay
        btfss PORTA,5
        goto Enter2

ProgLoop:
        incf blinker, f

        call PMDisplay
        btfsc PORTA,5
        goto ProgLoop




        movlw 10
        movwf menu_timer

ChkKey:
 btfsc PORTA,5
        goto ShortPress
        call ProgModeDisplay
        decfsz menu_timer, f
        goto ChkKey





Release2:
 call ClearDisplay
        call ProgModeDisplay
        call PMDisplay
        btfss PORTA,5
        goto Release2
        goto PMExecute

ShortPress:

        movf menu_index,w
        sublw MI_INDEX_MAX
        btfsc STATUS,STATUS_Z_POSITION
        goto LastMainMenu
        btfss STATUS,STATUS_C_POSITION
        goto NotMainMenu
        incf menu_index, f
        goto ProgLoop

LastMainMenu:
        clrf menu_index
        goto ProgLoop

NotMainMenu:

        movf menu_index,w
        sublw MI_IF_SUBMENU_MAX
        btfsc STATUS,STATUS_Z_POSITION
        goto LastIfSubMenu
        btfss STATUS,STATUS_C_POSITION
        goto NotIfSubMenu
        incf menu_index, f
        goto ProgLoop

LastIfSubMenu:

        movlw MI_IF_1
        movwf menu_index
        goto ProgLoop

NotIfSubMenu:

        clrf menu_index
        goto ProgLoop

  END resetVec
