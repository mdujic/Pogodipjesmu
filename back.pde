

void back_draw() {
  
  // Iksić za izać iz igre:
  fill(pravokutnik_pozadina,180);
  textFont(font);
  textAlign(CENTER,CENTER);
  rect(width-menu_height,0,menu_height,menu_height);
  fill(boja_teksta);
  text("X", width-menu_height/2, menu_height/2);
  
  //povratak
  if (status != izbornik) {
    fill(pravokutnik_pozadina, 180);
    rect(width-0.7*menu_width-1.3*menu_height, 0, 0.7*menu_width, menu_height);
    fill(boja_teksta);
    textFont(font);
    text("Povratak", width-0.625*menu_width, 0.5*menu_height);
    
  }
}


void back_mousePressed() {
   if( mouseX >= width-menu_height & mouseX < width & mouseY>0 & mouseY <= menu_height)
     exit();
   else if (mouseX >= width-0.7*menu_width-1.3*menu_height & mouseX <= width-0.7*menu_width-1.3*menu_height + 0.7*menu_width && mouseY <= menu_height) {
  
     //if (pozadinska_pjesma.isPlaying() )
       //pozadinska_pjesma.pause();
     if ( indeks < 5 )
     {
     if ( song.get(indeks).isPlaying() ) {
       song.get(indeks).pause();
       song.get(indeks).close(); 
    
     }
   }
     
     if (ponovljena_pjesma != null)
       if ( ponovljena_pjesma.isPlaying() ) {
         ponovljena_pjesma.pause();
         ponovljena_pjesma.close();
     }
     igra_setup(); 
     if( status == pjesme  || status == izvodaci ) pozadinska_pjesma.play();
     status = izbornik;
   }
   
}
