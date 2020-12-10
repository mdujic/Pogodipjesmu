void back_setup()  {
}


void back_draw() {
  
  // Iksić za izać iz igre:
  fill(pravokutnik_pozadina,180);
  textFont(font);
  textAlign(CENTER,CENTER);
  rect(width-menu_height,0,menu_height,menu_height);
  fill(boja_teksta);
  text("X", width-menu_height/2, menu_height/2);
  
  if (status != izbornik) {
    fill(pravokutnik_pozadina, 180);
    rect(width-menu_width, 0, menu_width, menu_height);
    fill(boja_teksta);
    textFont(font);
    text("Povratak", width-0.5*menu_width, 0.5*menu_height);
    
  }
}


void back_mousePressed() {
   if( mouseX >= width-menu_width & mouseX < width & mouseY <= menu_height)
     exit();
   if (mouseX >= width-menu_width && mouseX <= width && mouseY <= menu_height) {
     status = izbornik;
     //if(ponovljena_pjesma != null) ponovljena_pjesma.close();
     //if (status != postavke)
     pozadinska_pjesma.close();
       setup();
   }
}
