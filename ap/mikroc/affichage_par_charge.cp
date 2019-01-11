#line 1 "C:/Users/mohamed/Desktop/ap/mikroc/affichage_par_charge.c"
int uni,dez,cent,mil,x;
char list[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
void init(){
TRISA=0;
TRISB=0;
}
void deco(){
 mil=x/1000;
 cent=(x%1000)/100 ;
 dez=(x%100)/10;
 uni=x%10;
}
void aff(){
portb=list[mil];porta.ra0=1;porta.RA0=0 ;
portb=list[cent];porta.ra1=1;porta.RA1=0 ;
portb=list[dez];porta.ra2=1;porta.RA2=0;
portb=list[uni];porta.ra3=1;porta.RA3=0 ;

}


void main() {
 portb=0;porta=0;
init();

 for (x=0;x<=5959;x++){

 deco();
 aff();
 if(x%100==59){x+=40;}
 delay_ms(1000);
 }
}
