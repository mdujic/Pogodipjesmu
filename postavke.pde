PImage sound;
PShape krugovi;
PShape plavi_krug, rozi_krug;


void postavke_setup() {
    sound = loadImage("sound.png");
    krugovi = loadShape("krugovi.svg");
    plavi_krug = krugovi.getChild("plavi_krug");
    rozi_krug = krugovi.getChild("rozi_krug");
    

}

void postavke_draw() {
    noStroke();
    textFont(font);

    //image(sound, 0, 0, 100, 100);
    
    
    
    fill(#282828);
    ellipse( width/2, height/3, 2*menu_width, 1.5*menu_height);
    fill(170, 210, 230);
    textAlign(CENTER);
    text("Izaberi temu:", width/2, height/3+0.1*menu_height);
    
    

}

void postavke_mousePressed(){   
  
}
