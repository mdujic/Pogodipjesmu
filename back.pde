

void back_setup()  {
  
  
}


void back_draw() {
  
  if (status != 4) {
    fill(pravokutnik_pozadina, 180);
    rect(width-menu_width, 0, menu_width, menu_height);
    fill(#282828);
    textFont(font);
    text("Povratak", width-0.5*menu_width, 0.5*menu_height);
    
  }
}


void back_mousePressed() {
   if (mouseX >= width-menu_width && mouseX <= width && mouseY <= menu_height) {
     status = 4;
     //if(ponovljena_pjesma != null) ponovljena_pjesma.close();
     if (status != 5)
       setup();
   }
}
