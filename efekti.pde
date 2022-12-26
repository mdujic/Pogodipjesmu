void efekti_setup() {
  cestitam = false;
  crtaj_vatromet = false;
  
  vatromet = new Gif(this, "vatromet.gif");
  vatromet.play();
  vatromet.ignoreRepeat();
}

void vatromet_draw() {  // nazalost cini se da se prikazuje samo jedan frame od cijelog gifa
  fill(pravokutnik_pozadina);    
  rect(width/2-menu_width*3/2, 0.6*height, menu_width * 3, menu_height);
  fill(boja_teksta);
  textSize(fontSizeNormal);    
  text("Rezultat je među top 10 najboljih!", width/2, 0.65*height);

  if(crtaj_vatromet) {
    image(vatromet, width/2 - vatromet.width/2, height/2 - vatromet.height/2);
    //custom_delay(3000);  // ovo je pokusaj da pustim cijeli gif da se odvrti
    
    crtaj_vatromet = false;
  }
}

void tocno_play() {
  minim = new Minim(this);
  tocno = minim.loadFile("correct.wav");
  tocno.play();
}

void netocno_play() {
  minim = new Minim(this);
  netocno = minim.loadFile("incorrect.mp3");
  netocno.play();
}
