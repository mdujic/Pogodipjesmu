

void back_setup()  {
  
  
}


void back_draw() {
  
  if (status != izbornik) {
    fill(pravokutnik_pozadina, 180);
    rect(width-menu_width, 0, menu_width, menu_height);
    fill(boja_teksta);
    textFont(font);
    text("Povratak", width-0.5*menu_width, 0.5*menu_height);
    
  }
}


void back_mousePressed() {
   if (mouseX >= width-menu_width && mouseX <= width && mouseY <= menu_height) {
     status = izbornik;
     //if(ponovljena_pjesma != null) ponovljena_pjesma.close();
     //if (status != postavke)
     pozadinska_pjesma.close();
       setup();
   }
}
