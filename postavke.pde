//PImage sound;
//PShape krugovi, pravokutnici, nosound;
//PShape plavi_krug, rozi_krug;
int boja = 1; //plavo = 1, rozo = 0
int zvuk = 1; // ON = 1, OFF = 0
color pravokutnik_pozadina = color(170, 210, 230); //defaultna je plava
AudioPlayer pozadinska_pjesma;

void postavke_setup() {
  /*
    sound = loadImage("sound.jpg");
    nosound = loadShape("nosound.svg");
    krugovi = loadShape("krugovi.svg");
    pravokutnici = loadShape("pravokutnici.svg");
    plavi_krug = krugovi.getChild("plavi_krug");
    rozi_krug = krugovi.getChild("rozi_krug");
    //shapeMode(CENTER);
    imageMode(CENTER);
    */
    
    minim = new Minim(this);
    pozadinska_pjesma = minim.loadFile("Ariana Grande - Dangerous Woman.mp3");
    //pozadinska_pjesma = minim.loadFile("pjesme/Abba - Dancing Queen.mp3");

    pozadinska_pjesma.play();
    
    
    

}

void postavke_draw() {
    noStroke();
    textFont(font);

    //image(sound, 0, 0, 100, 100);
    /*
    fill(#282828);
    ellipse( width/4, height/3, menu_width+70, menu_height);
    ellipse( width/4, 2*height/3, menu_width+70, menu_height);

    fill(170, 210, 230);
    textAlign(CENTER);
    text("Izaberi temu:", width/4, height/3+0.1*menu_height);
    text("Zvuk ON/OFF:", width/4, 2*height/3+0.1*menu_height);

    //shape(krugovi,  width/4, height/4+0.1*menu_height+50, 400, 400);
    //shape(pravokutnici,  width/2, height/3-30, 400, 400);

    //shape(plavi_krug, 0, 0);
    //image(sound, 2*width/3, 2*height/3, 100, 100);
    //shape(nosound, 2*width/3, 2*height/3, 100, 100);
   */
   //fill();
    
    fill(pravokutnik_pozadina, 180);
    rect(width/2-menu_width/2, height/3-0.5*menu_height, menu_width, menu_height);
    rect(width/2-menu_width/2, height/3-(0.5-2.4)*menu_height, menu_width, menu_height);
    fill(#282828);
    
    if (boja == 1) {
      
      text("Tema: plavo", width/2, height/3-0.07*menu_height);
      
    }
     else {
      
      text("Tema: rozo", width/2, height/3-0.07*menu_height);
     }
    if (zvuk == 1)
      text("Zvuk: ON",width/2, height/3+2.3*menu_height);
    else
      text("Zvuk: OFF", width/2, height/3+2.3*menu_height);

    
    
}

void postavke_mousePressed(){   
  
  if(mouseX>=width/4 & mouseX<=(width/4+width/2) & mouseY>=height/3 & mouseY<=(height/3+height/7)) {
    if(boja == 1){
      pravokutnik_pozadina = color(230, 180, 170);
      boja = 0;
    }
    else {
      pravokutnik_pozadina = color(170, 210, 230);
      boja = 1;
    }
  }
  
  
  if(mouseX>=width/4 & mouseX<=(width/4+width/2) & mouseY>=2*height/3 & mouseY<=(2*height/3+height/7)) {
    if(zvuk == 0){
      pozadinska_pjesma.play();
      zvuk = 1;
    }
    /*
     else if (pozadinska_pjesma.position() == pozadinska_pjesma.length()) {
    
      pozadinska_pjesma.rewind();
      pozadinska_pjesma.play();
    
    }
    */
    else {
      pozadinska_pjesma.pause();
      zvuk = 0;
    }
  }
  
}
