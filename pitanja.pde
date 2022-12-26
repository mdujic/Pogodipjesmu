String odvojeno;

float x1, x2, x3, x4;
float y1, y2, y3, y4;
float a, b;

void pitanja_setup(){  
    x1 = width/4-1.3*menu_width/2;
    y1 = height/3;
    
    x2 = width/4-1.3*menu_width/2+1.1*1.3*menu_width;
    y2 = height/3;
    
    x3 = width/4-1.3*menu_width/2;
    y3 = height/3+1.2*menu_height;
    
    x4 = width/4-1.3*menu_width/2+1.1*1.3*menu_width;
    y4 = height/3+1.2*menu_height;
    
    a = width/2-1.3*menu_width/2;
    b = 0.7*height;
  
}

void pitanja_draw()
{
   /*
    fill(#D3BABA);
    rect(20, 20, 600, 40);
    rect(20, 70, 600, 40);
    rect(20, 120, 600, 40);
    rect(20, 170, 600, 40);
    rect(20, 400, 150, 40);
    fill(#382FC1); 
    textSize(20);
    text(" Pusti ponovo", 40, 425);*/
    
    noStroke();                                 // 1 2
    fill(pravokutnik_pozadina, 200);            // 3 4
    
    rect(x1, y1, 1.3*menu_width, menu_height);  // 1
    rect(x2, y2, 1.3*menu_width, menu_height);  // 2
    rect(x3, y3, 1.3*menu_width, menu_height);  // 3
    rect(x4, y4, 1.3*menu_width, menu_height);  // 4
    
    fill(pravokutnik_pozadina, 180);
    rect(a, b, 1.3*menu_width, menu_height);
    fill(boja_teksta);
    textAlign(CENTER, CENTER);
    text("Pusti ponovno!", width/2, 0.75*height);
}

void nacrtaj_odgovore(int i){
  /*
    for(int j=0; j<4; j++){      
        odvojeno = ponudeni_odgovori[j];
        String[] lista_odvojenog = split(odvojeno, "-");
        if(i == 0) text(" "+lista_odvojenog[1], 20, 45 + (rand_indeks[j]-1)*50);
        else text(" "+lista_odvojenog[0], 20, 45 + (rand_indeks[j]-1)*50);    
    }     
  */
    
    fill(boja_teksta);
    textAlign(CENTER, CENTER); 
    textFont(font2);
    
    for(int j=0; j<4; j++){                                                                                   // 1 2
        odvojeno = ponudeni_odgovori[j];                                                                    // 3 4  
        String[] lista_odvojenog = split(odvojeno, "-");
        if( rand_indeks[j] == 1 ){                                                                       // odgovor na mjestu 1
            if(i == 0) text(" "+lista_odvojenog[1], width/3-menu_width/2+0.25*menu_width, height/3+0.4*menu_height);
            else text(" "+lista_odvojenog[0], width/3-menu_width/2+0.25*menu_width, height/3+0.4*menu_height); 
        }
        else if (rand_indeks[j] == 2) {                                                                   // odgovor na mjestu 2
            if(i == 0) text(" "+lista_odvojenog[1], width/3-menu_width/2+1.1*menu_width+0.05*menu_width+0.55*menu_width, height/3+0.4*menu_height);
            else text(" "+lista_odvojenog[0], width/3-menu_width/2+1.1*menu_width+0.55*menu_width, height/3+0.4*menu_height); 
        }
        else if (rand_indeks[j] == 3) {                                                                   // odgovor na mjestu 3
            if(i == 0) text(" "+lista_odvojenog[1], width/3-menu_width/2+0.25*menu_width, height/3+1.2*menu_height+0.4*menu_height);
            else text(" "+lista_odvojenog[0], width/3-menu_width/2+0.25*menu_width, height/3+1.2*menu_height+0.4*menu_height); 
        }
        else if(rand_indeks[j] == 4){                                                                     // odgovor na mjestu 4
            if(i == 0) text(" "+lista_odvojenog[1], width/3-menu_width/2+1.1*menu_width+0.55*menu_width, height/3+1.2*menu_height+0.4*menu_height);
            else text(" "+lista_odvojenog[0], width/3-menu_width/2+1.1*menu_width+0.55*menu_width, height/3+1.2*menu_height+0.4*menu_height);
      }     
    }
  
  
}

void pitanja_if(){
    if(status == pjesme || status == izvodaci){
        if (  mouseX < x1 || mouseX > x2 + 1.3*menu_width || mouseY < y1 || mouseY > y3 + menu_height ||
            ( mouseX > x1 + 1.3*menu_width  & mouseX < x2) || ( mouseY > y1 + menu_height & mouseY < y3 )  ) 
        ne_mijenjaj_indeks = 1;
        if( mouseX >= a & mouseX <= a + 1.3*menu_width & mouseY >= b & mouseY <= b + menu_height){
        ne_mijenjaj_indeks = 1;
        if(ponovljena_pjesma != null) ponovljena_pjesma.close();
        minim = new Minim(this);
        ponovljena_pjesma = minim.loadFile("pjesme/" + tocni_odgovori[indeks] + ".mp3"); //Ispravljeno, sitnica je nedostajala, ovaj string "pjesme/"
        song.get(indeks).close();
        ponovljena_pjesma.play();
    }    
    
    if(rand_indeks[0]==1 & ne_mijenjaj_indeks == 0){
        if( ( mouseX >=x1 ) & ( mouseX <= x1 + 1.3*menu_width ) & ( mouseY >= y1 ) & ( mouseY <= y1 + menu_height ) ){
            tocno_play();
            bodovi = bodovi + 15;
            broj_tocnih++;       
        }   
        zacrveni(); //dodano
        fill(tocan_odgovor);
        rect(x1, y1, 1.3*menu_width, menu_height); 
        precrtaj();      
    }
    if(rand_indeks[0]==2 & ne_mijenjaj_indeks == 0){
        if( ( mouseX >= x2 ) & ( mouseX <= x2 + 1.3*menu_width ) & ( mouseY >= y2 ) & ( mouseY <= y2 + menu_height ) ){
            tocno_play();
            bodovi = bodovi + 15;
            broj_tocnih++;   
        }
        zacrveni(); //dodano
        fill(tocan_odgovor);
        rect(x2, y2, 1.3*menu_width, menu_height); 
        precrtaj();      
    }
    if(rand_indeks[0]==3 & ne_mijenjaj_indeks == 0){
        if( ( mouseX >= x3 ) & ( mouseX <= x3 + 1.3*menu_width ) & ( mouseY >= y3 ) & ( mouseY <= y3 + menu_height ) ){
            tocno_play();
            bodovi = bodovi + 15;  
            broj_tocnih++;      
        }
        zacrveni(); //dodano
        fill(tocan_odgovor);
        rect(x3, y3, 1.3*menu_width, menu_height); 
        precrtaj();      
    }
    if(rand_indeks[0]==4 & ne_mijenjaj_indeks == 0){
        if( ( mouseX >= x4 ) & ( mouseX <= x4 + 1.3*menu_width ) & ( mouseY >= y4 ) & ( mouseY <= y4 + menu_height ) ){
            tocno_play();
            bodovi = bodovi + 15;
            broj_tocnih++;        
        }
        zacrveni(); //dodano
        fill(tocan_odgovor);
        rect(x4, y4, 1.3*menu_width, menu_height); 
        precrtaj();      
    }    
  }
}

void zacrveni() //Dodano da se igrač lakše snađe što je krivo stisnuo
{
    if( mouseX >= x1 & mouseX <= x1 + 1.3*menu_width & mouseY >= y1 & mouseY <= y1 + menu_height ){
        netocno_play();
        fill(netocan_odgovor);
        rect(x1, y1, 1.3*menu_width, menu_height);   
    }
    if( mouseX >= x2 & mouseX <= x2 + 1.3*menu_width & mouseY >= y2 & mouseY <= y2 + menu_height ){
        netocno_play();
        fill(netocan_odgovor);
        rect(x2, y2, 1.3*menu_width, menu_height);   
    }
    if( mouseX >= x3 & mouseX <= x3 + 1.3*menu_width & mouseY >= y3 & mouseY <= y3 + menu_height ){
        netocno_play();
        fill(netocan_odgovor);
        rect(x3, y3, 1.3*menu_width, menu_height);     
    }
    if( mouseX >= x4 & mouseX <= x4 + 1.3*menu_width & mouseY >= y4 & mouseY <= y4 + menu_height ){
        fill(netocan_odgovor);
        rect(x4, y4, 1.3*menu_width, menu_height);     
    }
}

void precrtaj(){
    //fill(#382FC1);
    if(status == pjesme) nacrtaj_odgovore(0);
    else nacrtaj_odgovore(1);
    cekaj = 1;
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
