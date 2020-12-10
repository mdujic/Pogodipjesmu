

void back_setup()  {
  
  
}


void back_draw() {
  
  if (status != 4) {
    fill(pravokutnik_pozadina);
    rect(width-menu_width, 0, menu_width, menu_height);
    text("Povratak", width/2, height/2);
  }
}


void back_mousePressed() {
  
}
