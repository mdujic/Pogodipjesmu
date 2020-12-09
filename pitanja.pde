String odvojeno;
PFont font2;

float x1, x2, x3, x4;
float y1, y2, y3, y4;
float a, b;

void pitanja_setup(){
  font2 = createFont("BubblegumSans-Regular.ttf", 40);
  
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
    fill(170, 210, 230, 200);                   // 3 4
    
    rect(x1, y1, 1.3*menu_width, menu_height);  // 1
    rect(x2, y2, 1.3*menu_width, menu_height);  // 2
    rect(x3, y3, 1.3*menu_width, menu_height);  // 3
    rect(x4, y4, 1.3*menu_width, menu_height);  // 4
    
    fill(170, 210, 230);
    rect(a, b, 1.3*menu_width, menu_height);
    fill(#282828);
    textAlign(CENTER, CENTER);
    text("Pusti ponovno!", width/2, 0.75*height);
    /*fill(#282828);
    text(" Pjesme!", width/3-0.005*menu_width, height/2 + 0.35*menu_height);
    text(" Izvođači!", width/3+1.08*menu_width, height/2 + 0.35*menu_height);
    */
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
    
    fill(#282828);
    textAlign(CENTER, CENTER);
    textSize(17);     
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
  if(status == pitanja || status == pitanja1){
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
    
    /*
    rect(20, 20, 600, 40);
    rect(20, 70, 600, 40);
    rect(20, 120, 600, 40);
    rect(20, 170, 600, 40);
    */
    
    /*
    rect(width/4-1.3*menu_width/2, height/3, 1.3*menu_width, menu_height);                                     // 1
    rect(width/4-1.3*menu_width/2+1.1*1.3*menu_width, height/3, 1.3*menu_width, menu_height);                  // 2
    rect(width/4-1.3*menu_width/2, height/3+1.2*menu_height, 1.3*menu_width, menu_height);                     // 3
    rect(width/4-1.3*menu_width/2+1.1*1.3*menu_width, height/3+1.2*menu_height, 1.3*menu_width, menu_height);  // 4
    */
    if(rand_indeks[0]==1 & ne_mijenjaj_indeks == 0){
      if( ( mouseX >=x1 ) & ( mouseX <= x1 + 1.3*menu_width ) & ( mouseY >= y1 ) & ( mouseY <= y1 + menu_height ) ){
        bodovi = bodovi + 15;        
      }   
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 20, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==2 & ne_mijenjaj_indeks == 0){
      if( ( mouseX >= x2 ) & ( mouseX <= x2 + 1.3*menu_width ) & ( mouseY >= y2 ) & ( mouseY <= y2 + menu_height ) ){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 70, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==3 & ne_mijenjaj_indeks == 0){
      if( ( mouseX >= x3 ) & ( mouseX <= x3 + 1.3*menu_width ) & ( mouseY >= y3 ) & ( mouseY <= y3 + menu_height ) ){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 120, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==4 & ne_mijenjaj_indeks == 0){
      if( ( mouseX >= x4 ) & ( mouseX <= x4 + 1.3*menu_width ) & ( mouseY >= y4 ) & ( mouseY <= y4 + menu_height ) ){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 170, 600, 40);
      precrtaj();      
    }    
  }
}

void zacrveni() //Dodano da se igrač lakše snađe što je krivo stisnuo
{
  if( mouseX >= x1 & mouseX <= x1 + 1.3*menu_width & mouseY >= y1 & mouseY <= y1 + menu_height ){
        fill(#D6331A);
        rect(x1, y1, 1.3*menu_width, menu_height);   
      }
  if( mouseX >= x2 & mouseX <= x2 + 1.3*menu_width & mouseY >= y2 & mouseY <= y2 + menu_height ){
        fill(#D6331A);
        rect(x2, y2, 1.3*menu_width, menu_height);   
      }
  if( mouseX >= x3 & mouseX <= x3 + 1.3*menu_width & mouseY >= y3 & mouseY <= y3 + menu_height ){
        fill(#D6331A);
        rect(x3, y3, 1.3*menu_width, menu_height);     
      }
  if( mouseX >= x4 & mouseX <= x4 + 1.3*menu_width & mouseY >= x4 & mouseY <= x4 + menu_height ){
        fill(#D6331A);
        rect(x4, y4, 1.3*menu_width, menu_height);     
      }
}

/*

void pitanja_if(){
  if(status == pitanja || status == pitanja1){
    if(mouseX<20 || mouseX>620 || mouseY<20 || (mouseY>60 & mouseY<70) || (mouseY>110 & mouseY<120) || 
    (mouseY>160 & mouseY<170) || (mouseY>210 & mouseY<400) || (mouseX>170 & mouseY>400 & mouseY<440) || mouseY>440){
      ne_mijenjaj_indeks = 1;      
    }
    if(mouseX>=20 & mouseX<=170 & mouseY>=400 & mouseY<=440){
      ne_mijenjaj_indeks = 1;
      if(ponovljena_pjesma != null) ponovljena_pjesma.close();
      minim = new Minim(this);
      ponovljena_pjesma = minim.loadFile("pjesme/" + tocni_odgovori[indeks] + ".mp3"); //Ispravljeno, sitnica je nedostajala, ovaj string "pjesme/"
      song.get(indeks).close();
      ponovljena_pjesma.play();
    }    

    if(rand_indeks[0]==1 & ne_mijenjaj_indeks == 0){
      if(mouseX>=width/4-1.3*menu_width/2 & mouseX<=620 & mouseY>=20 & mouseY<=60){
        bodovi = bodovi + 15;        
      }   
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 20, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==2 & ne_mijenjaj_indeks == 0){
      if(mouseX>=20 & mouseX<=620 & mouseY>=70 & mouseY<=110){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 70, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==3 & ne_mijenjaj_indeks == 0){
      if(mouseX>=20 & mouseX<=620 & mouseY>=120 & mouseY<=160){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 120, 600, 40);
      precrtaj();      
    }
    if(rand_indeks[0]==4 & ne_mijenjaj_indeks == 0){
      if(mouseX>=20 & mouseX<=620 & mouseY>=170 & mouseY<=210){
        bodovi = bodovi + 15;        
      }
      zacrveni(); //dodano
      fill(#1AD631);
      rect(20, 170, 600, 40);
      precrtaj();      
    }    
  }
}
*/
