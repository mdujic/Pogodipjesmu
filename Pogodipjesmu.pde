import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;

PFont font, font2;

ArrayList<AudioPlayer> song;
AudioPlayer ponovljena_pjesma;
int[] indeksi;
int indeks;
int rand;
int rand_odgovor;

// Zastavice:
final int izbornik = 0; 
final int pocetak = 1;
final int pjesme = 2;
final int izvodaci = 3;
final int kraj = 4;
final int postavke = 5;
final int rezultati = 6;

int status;
String[] odgovori;
String[] tocni_odgovori;
String s;
int gotovo, gotovo1, gotovo2;
String[] ponudeni_odgovori;
int[] rand_indeks;
int izabrao_indekse;
int bodovi;
int ne_mijenjaj_indeks;
int m;
int pokreni_tajmer;
int cekaj;
int test;
int n; 

//dodano:
int menu_width, menu_height;
float fontSizeNormal, fontSizeSmall;

void setup(){
  
  //size(800, 600);
  pozadina_setup();
  postavke_setup();
  fullScreen();
  
  // font setup:
  fontSizeNormal = height/15;
  fontSizeSmall = height/20;
  font = createFont("FascinateInline-Regular.ttf", fontSizeNormal);
  font2 = createFont("BubblegumSans-Regular.ttf", fontSizeSmall); // za odgovore
  
  //veličine tipki:
  menu_height = height/8;
  menu_width = width/3;
   status = izbornik;
   minim = new Minim(this);
  igra_setup();
}

void draw(){  
  
  pozadina_draw();
  textFont(font);
  switch (status){
   
  case izbornik: //izbornik
    izbornik_draw();
    break;
    
  case pocetak: // igraj!
    kategorije_draw();
    break;
    
  case postavke:
    postavke_draw();
    break;
    
  case pjesme: 
    if(cekaj == 1){       
      custom_delay(1200);      
      cekaj = 0; 
    }
    generiraj_odgovore(0);
    song.get(indeks).play();
    break;
    
  case izvodaci:   
    if(cekaj == 1){ 
      custom_delay(1200); 
      cekaj = 0; 
    }
    generiraj_odgovore(1);    
    song.get(indeks).play();
    break;
    
  case kraj:
    custom_delay(1200);
    kraj_draw();
    break;
    
  case rezultati:
    //if(zvuk == 1) 
    //{ pozadinska_pjesma.rewind(); pozadinska_pjesma.play(); }
    rezultati_draw();
    break;
  }
  
  back_draw();
}

void mousePressed(){ 
  
  
  if(status == postavke)
    postavke_mousePressed();
    
    
  if(pokreni_tajmer == 1){   
    m = millis()-n;        //Treba ovako jer inače nakon odabira da se ponovno igra, nastavlja teći vrijeme od prve igre 
    pokreni_tajmer = 0;    //i onda iako igrač dobro pogodi neće dobiti bodove koje zaslužuje jer je isteklo više vremena
  }                         //nego što stvarno jest u njegovoj igri
  ne_mijenjaj_indeks = 0;
  
  pitanja_if();
  
  if(ne_mijenjaj_indeks == 0){
  for(int i=0; i<4; i++){
    rand_indeks[i] = -1;
  }
  
  izabrao_indekse=0;
  gotovo = 0;
  gotovo1 = 0;
  gotovo2 = 0; 
  }
  switch(status){
    case izbornik:
      if ( ( mouseX > width/2-menu_width/2 ) & ( mouseX < width/2-menu_width/2 + menu_width ) & ( mouseY > height/3-0.5*menu_height ) & ( mouseY < height/3-0.5*menu_height + menu_height ) ) // Kliknuto je "Igraj!"
        status = pocetak;
      else if( ( mouseX > width/2-menu_width/2 ) & ( mouseX < width/2-menu_width/2 + menu_width ) & ( mouseY > height/3-(0.5-1.2)*menu_height ) & ( mouseY < height/3-(0.5-1.2)*menu_height + menu_height ) ) // Kliknuto je "Postavke"
        status = postavke;
      else if( ( mouseX > width/2-menu_width/2 ) & ( mouseX < width/2-menu_width/2 + menu_width ) & ( mouseY > height/3-(0.5-2.4)*menu_height ) & ( mouseY < height/3-(0.5-2.4)*menu_height + menu_height ) ) // Kliknuto je "Rezultati"
        status = rezultati;
      break;
    case pocetak:
      if( ( mouseX > width/3-menu_width/2 ) & ( mouseX < width/3-menu_width/2 + menu_width ) & ( mouseY > height/2 ) & ( mouseY < height/2 + menu_height ) ){      
        status=pjesme;  
        if ( zvuk == 1 ) pozadinska_pjesma.pause();
      }      
      else if( ( mouseX > width/3-menu_width/2+1.1*menu_width ) & ( mouseX < width/3-menu_width/2+1.1*menu_width + menu_width ) & ( mouseY > height/2 ) & ( mouseY < height/2 + menu_height)){           
        status=izvodaci;      
        if ( zvuk == 1 ) pozadinska_pjesma.pause();
      }
      break;
      
    case pjesme:
      if(ne_mijenjaj_indeks == 0){ 
        song.get(indeks).close(); 
        if(ponovljena_pjesma != null) ponovljena_pjesma.close();
      }
      status=pjesme;
      if(ne_mijenjaj_indeks == 0){         
        indeks++;         
      }
      if(indeks == 5) { 
        status = kraj;
        if( zvuk == 1) pozadinska_pjesma.play(); }
      break;
      
    case izvodaci:
      if(ne_mijenjaj_indeks == 0){
        song.get(indeks).close();
        if(ponovljena_pjesma != null) ponovljena_pjesma.close();
      }
      status=izvodaci;
      if(ne_mijenjaj_indeks == 0){ 
        indeks++;         
      }     
      if(indeks == 5) { 
        status = kraj;
        if( zvuk == 1) pozadinska_pjesma.play(); }
      break;
      
    case kraj:
      if(mousePressed == true & mouseX > width/2-menu_width/2 & mouseX < width/2 + menu_width & mouseY > 0.65*height & mouseY < 0.65*height + menu_height) 
      {
        setup();
        status = pocetak;
      }
      break;
  }   
  
  
    back_mousePressed();

}

void custom_delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

void generiraj_odgovore(int i){
  pitanja_setup();
  pitanja_draw();
    
    if(ne_mijenjaj_indeks == 0){      
      ponudeni_odgovori[0] = tocni_odgovori[indeks];      
      int indeks_pamti = 0;
      int indeks_pamti1 = 0; 
      
      while(gotovo == 0){
       rand_odgovor = int(random(0, 22));
       if(tocni_odgovori[indeks] != odgovori[rand_odgovor]){
         ponudeni_odgovori[1] = odgovori[rand_odgovor];
         indeks_pamti = rand_odgovor;
         gotovo = 1;
       } 
      }
      
      while (gotovo1 == 0){
       rand_odgovor = int(random(0, 22));
       if(tocni_odgovori[indeks] != odgovori[rand_odgovor] & odgovori[indeks_pamti] != odgovori[rand_odgovor]){
         ponudeni_odgovori[2] = odgovori[rand_odgovor];
         indeks_pamti1 = rand_odgovor;
         gotovo1 = 1;          
       }        
      }
      
      while(gotovo2 == 0){
       rand_odgovor = int(random(0, 22));
       if(tocni_odgovori[indeks] != odgovori[rand_odgovor] & odgovori[indeks_pamti] != odgovori[rand_odgovor] & odgovori[indeks_pamti1] != odgovori[rand_odgovor]){
         ponudeni_odgovori[3] = odgovori[rand_odgovor];
         gotovo2 = 1;         
       } 
      }      
    
      if(izabrao_indekse == 0){
        rand_indeks[0] = int(random(1,5));
        while(rand_indeks[1] == -1){
         rand_indeks[1] = int(random(1,5));
         if(rand_indeks[1] == rand_indeks[0]){
           rand_indeks[1] = -1;
         }
        }
        while(rand_indeks[2] == -1){
         rand_indeks[2] = int(random(1,5));
         if(rand_indeks[2] == rand_indeks[0] || rand_indeks[2] == rand_indeks[1]){
           rand_indeks[2] = -1;
         }
        }
        while(rand_indeks[3] == -1){
         rand_indeks[3] = int(random(1,5));
         if(rand_indeks[3] == rand_indeks[0] || rand_indeks[3] == rand_indeks[1] || rand_indeks[3] == rand_indeks[2]){
           rand_indeks[3] = -1;
         }
        }
        izabrao_indekse=1;
      }
    }
    nacrtaj_odgovore(i);
}
