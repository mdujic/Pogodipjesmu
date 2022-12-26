
int boja = 1; //plavo = 1, rozo = 0
int zvuk = 1; // ON = 1, OFF = 0
color pravokutnik_pozadina = color(170, 210, 230); //defaultna je plava
color tocan_odgovor, netocan_odgovor;
color boja_teksta;
AudioPlayer pozadinska_pjesma;

void igra_setup()
{
    odgovori = loadStrings("odgovori.txt");
    song = new ArrayList();
    indeksi = new int [3];
    tocni_odgovori = new String [ukupno];
    ponudeni_odgovori = new String[4];
    rand_indeks = new int[4];
    indeks = 0;
    
    bodovi = 0;
    ne_mijenjaj_indeks = 0;
    pokreni_tajmer = 1;
    cekaj = 0;
    
    for(int i=0; i<ukupno; i++){ 
        test=1;
        while(test==1) //Ovdje je dodana while i for petlja, da se nijedno od tih pjesama ne ponovi
        {              //To olakšava igru jer igrač može naučiti koja je pjesma/izvođač tokom igre 
            rand = int(random(0,22)); //i onda sljedeći put točno odgovorit iako nije znao prije početka igre
            test=0;
            for(int j=0; j<i; j++)
            {
                if(tocni_odgovori[j]==odgovori[rand])
                {
                test=1;
                break;
                }
            }
        }
        minim = new Minim(this);
        song.add(minim.loadFile("pjesme/" +odgovori[rand] + ".mp3"));
        tocni_odgovori[i] = odgovori[rand];
    }  
    n=millis(); //Ovo je dodano
    
}

void postavke_setup() {
    tocan_odgovor = color(63, 224, 106);
    netocan_odgovor = color(224, 63, 66);
    boja_teksta = color(#282828);
}

void postavke_draw() {
    noStroke();
    textFont(font);

    
    fill(pravokutnik_pozadina, 180);
    rect(width/2-menu_width/2, height/3-0.5*menu_height, menu_width, menu_height);
    rect(width/2-menu_width/2, height/3-(0.5-1.4)*menu_height, menu_width, menu_height);
    
    // rect za ukupan broj pjesama
    rect(width/2-menu_width/2, height/3-(0.5-2.8)*menu_height, menu_width, menu_height);
    // u istom retku dugma za plus i minus koja smanjuju i povećavaju broj pjesama u igri
    rect(width/2-menu_width/2, height/3-(0.5-4.2)*menu_height, menu_width/2, menu_height);
    rect(width/2, height/3-(0.5-4.2)*menu_height, menu_width/2, menu_height);

    fill(boja_teksta);
    
    if (boja == 1) 
        text("Tema: plavo", width/2, height/3-0.07*menu_height);
    else 
        text("Tema: rozo", width/2, height/3-0.07*menu_height);
     
    if (zvuk == 1)
        text("Zvuk: ON",width/2, height/3+1.3*menu_height);
    else
        text("Zvuk: OFF", width/2, height/3+1.3*menu_height);

    text("Broj pjesama: " + ukupno, width/2, height/3+2.7*menu_height);
    text("+", width/2-menu_width/4, height/3+4.1*menu_height);
    text("-", width/2+menu_width/4, height/3+4.1*menu_height);

}

void postavke_mousePressed(){   
  
    if(mouseX>=width/2-menu_width/2 & mouseX<=(width/2-menu_width/2 + menu_width) & mouseY>=height/3-0.5*menu_height & mouseY<=(height/3-0.5*menu_height + menu_height)) {
        if(boja == 1){
            pravokutnik_pozadina = color(230, 180, 170);
            boja = 0;
        }
        else {
            pravokutnik_pozadina = color(170, 210, 230);
            boja = 1;
        }
    }
  
  
    if(mouseX>=width/2-menu_width/2 & mouseX<=width/2-menu_width/2+menu_width & mouseY>=height/3-(0.5-1.4)*menu_height & mouseY<=height/3-(0.5-1.4)*menu_height+menu_height) {
        if(zvuk == 0){
            pozadinska_pjesma.play();
            zvuk = 1;
        }
        else {
            pozadinska_pjesma.pause();
            zvuk = 0;
        }
    }
    
    // ako je pritisnut "+" ili "-", promijeni broj pjesama
    if(mouseX>=width/2-menu_width/2 & mouseX<=width/2 & mouseY>=height/3-(0.5-4.2)*menu_height & mouseY<=height/3-(0.5-4.2)*menu_height+menu_height) {
        if(ukupno < 22)
        ukupno++;
    }
    if(mouseX>=width/2 & mouseX<=width/2+menu_width/2 & mouseY>=height/3-(0.5-4.2)*menu_height & mouseY<=height/3-(0.5-4.2)*menu_height+menu_height) {
        if(ukupno > 5)
        ukupno--;
    }

}
