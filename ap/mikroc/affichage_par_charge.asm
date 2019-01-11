
_init:

;affichage_par_charge.c,3 :: 		void init(){
;affichage_par_charge.c,4 :: 		TRISA=0;
	CLRF       TRISA+0
;affichage_par_charge.c,5 :: 		TRISB=0;
	CLRF       TRISB+0
;affichage_par_charge.c,6 :: 		}
L_end_init:
	RETURN
; end of _init

_deco:

;affichage_par_charge.c,7 :: 		void deco(){
;affichage_par_charge.c,8 :: 		mil=x/1000;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _mil+0
	MOVF       R0+1, 0
	MOVWF      _mil+1
;affichage_par_charge.c,9 :: 		cent=(x%1000)/100 ;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _cent+0
	MOVF       R0+1, 0
	MOVWF      _cent+1
;affichage_par_charge.c,10 :: 		dez=(x%100)/10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _dez+0
	MOVF       R0+1, 0
	MOVWF      _dez+1
;affichage_par_charge.c,11 :: 		uni=x%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _uni+0
	MOVF       R0+1, 0
	MOVWF      _uni+1
;affichage_par_charge.c,12 :: 		}
L_end_deco:
	RETURN
; end of _deco

_aff:

;affichage_par_charge.c,13 :: 		void aff(){
;affichage_par_charge.c,14 :: 		portb=list[mil];porta.ra0=1;porta.RA0=0 ;
	MOVF       _mil+0, 0
	ADDLW      _list+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BSF        PORTA+0, 0
	BCF        PORTA+0, 0
;affichage_par_charge.c,15 :: 		portb=list[cent];porta.ra1=1;porta.RA1=0 ;
	MOVF       _cent+0, 0
	ADDLW      _list+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BSF        PORTA+0, 1
	BCF        PORTA+0, 1
;affichage_par_charge.c,16 :: 		portb=list[dez];porta.ra2=1;porta.RA2=0;
	MOVF       _dez+0, 0
	ADDLW      _list+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BSF        PORTA+0, 2
	BCF        PORTA+0, 2
;affichage_par_charge.c,17 :: 		portb=list[uni];porta.ra3=1;porta.RA3=0 ;
	MOVF       _uni+0, 0
	ADDLW      _list+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	BSF        PORTA+0, 3
	BCF        PORTA+0, 3
;affichage_par_charge.c,19 :: 		}
L_end_aff:
	RETURN
; end of _aff

_main:

;affichage_par_charge.c,22 :: 		void main() {
;affichage_par_charge.c,23 :: 		portb=0;porta=0;
	CLRF       PORTB+0
	CLRF       PORTA+0
;affichage_par_charge.c,24 :: 		init();
	CALL       _init+0
;affichage_par_charge.c,26 :: 		for (x=0;x<=5959;x++){
	CLRF       _x+0
	CLRF       _x+1
L_main0:
	MOVLW      128
	XORLW      23
	MOVWF      R0+0
	MOVLW      128
	XORWF      _x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       _x+0, 0
	SUBLW      71
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main1
;affichage_par_charge.c,28 :: 		deco();
	CALL       _deco+0
;affichage_par_charge.c,29 :: 		aff();
	CALL       _aff+0
;affichage_par_charge.c,30 :: 		if(x%100==59){x+=40;}
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _x+0, 0
	MOVWF      R0+0
	MOVF       _x+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      59
	XORWF      R0+0, 0
L__main10:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
	MOVLW      40
	ADDWF      _x+0, 1
	BTFSC      STATUS+0, 0
	INCF       _x+1, 1
L_main3:
;affichage_par_charge.c,31 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;affichage_par_charge.c,26 :: 		for (x=0;x<=5959;x++){
	INCF       _x+0, 1
	BTFSC      STATUS+0, 2
	INCF       _x+1, 1
;affichage_par_charge.c,32 :: 		}
	GOTO       L_main0
L_main1:
;affichage_par_charge.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
