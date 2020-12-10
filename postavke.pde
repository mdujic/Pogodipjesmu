
int boja = 1; //plavo = 1, rozo = 0
int zvuk = 1; // ON = 1, OFF = 0
color pravokutnik_pozadina = color(170, 210, 230); //defaultna je plava
color tocan_odgovor, netocan_odgovor;
color boja_teksta;
AudioPlayer pozadinska_pjesma;

void postavke_setup() {
    
    minim = new Minim(this);
    pozadinska_pjesma = minim.loadFile("Ariana Grande - Dangerous Woman.mp3");

    pozadinska_pjesma.play();
    
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
    fill(boja_teksta);
    
    if (boja == 1) 
      text("Tema: plavo", width/2, height/3-0.07*menu_height);
    else 
      text("Tema: rozo", width/2, height/3-0.07*menu_height);
     
    if (zvuk == 1)
      text("Zvuk: ON",width/2, height/3+1.3*menu_height);
    else
      text("Zvuk: OFF", width/2, height/3+1.3*menu_height);
}

void postavke_mousePressed(){   
  
  if(mouseX>=width/2-menu_width/2 & mouseX<=(width/2-menu_width/2 + menu_width) & mouseY>=height/3-(0.5-1.4)*menu_height & mouseY<=(height/3-(0.5-1.4)*menu_height + menu_height)) {
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
  
}
