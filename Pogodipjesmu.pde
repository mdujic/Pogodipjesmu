import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import gifAnimation.*;

Minim minim;
Gif vatromet;

PFont font, font2;

ArrayList<AudioPlayer> song;
AudioPlayer ponovljena_pjesma;
AudioPlayer tocno;
AudioPlayer netocno;
int[] indeksi;
int indeks;
int rand;
int rand_odgovor;

// Zastavice:
final int unos_imena = -1;
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
int broj_tocnih;
int ukupno = 5;
int ne_mijenjaj_indeks;
int m;
int pokreni_tajmer;
int cekaj;
int test;
int n; 
String ime;
boolean cestitam;
boolean crtaj_vatromet;

//dodano:
int menu_width, menu_height;
float fontSizeNormal, fontSizeSmall;

void setup(){
  
    //size(800, 600);
    unos_imena_setup();
    pozadina_setup();
    postavke_setup();
    efekti_setup();
    fullScreen();
    
    // font setup:
    fontSizeNormal = height/15;
    fontSizeSmall = height/20;
    font = createFont("FascinateInline-Regular.ttf", fontSizeNormal);
    font2 = createFont("BubblegumSans-Regular.ttf", fontSizeSmall); // za odgovore
    
    //veličine tipki:
    menu_height = height/8;
    menu_width = width/3;
    status = unos_imena;
    minim = new Minim(this);
    igra_setup();
}


void draw(){  
  
    pozadina_draw();
    textFont(font);
    switch (status){
    
        case unos_imena:
            unos_imena_draw();
            break;
        
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
            if(indeks == ukupno) { 
                status = kraj;
                azuriraj_rezultate();
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
            if(indeks == ukupno) { 
                status = kraj;
                azuriraj_rezultate();
                if( zvuk == 1) pozadinska_pjesma.play(); }
            break;
        
        case kraj:
            if(mousePressed == true & mouseX > width/2-menu_width/2 & mouseX < width/2 + menu_width & mouseY > 0.8*height & mouseY < 0.8*height + menu_height) 
            {
                igra_setup();
                broj_tocnih = 0;  // bez ove linije se tijekom igre prikazivao ukupan broj pogodenih pjesama iz *svih* igara u trenutnom sessionu
                cestitam = false;
                status = pocetak;
            }
            break;
    }   
    
    
    back_mousePressed();

}

// ako se pritisne enter i u tijeku je unos imena, također se sprema ime i prelazi na izbornik
void keyPressed(){
    if ( status == unos_imena & key == ENTER ) {
        status = izbornik;
    }
}

void custom_delay(int delay)
{
    int time = millis();
    while(millis() - time <= delay);
}
