String odvojeno;
PFont font2;

void pitanja_setup(){
  font2 = createFont("BubblegumSans-Regular.ttf", 40);
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
    
    noStroke();
    fill(170, 210, 230, 200);
    rect(width/4-1.3*menu_width/2, height/3, 1.3*menu_width, menu_height);
    rect(width/4-1.3*menu_width/2+1.1*1.3*menu_width, height/3, 1.3*menu_width, menu_height);
    rect(width/4-1.3*menu_width/2, height/3+1.2*menu_height, 1.3*menu_width, menu_height);
    rect(width/4-1.3*menu_width/2+1.1*1.3*menu_width, height/3+1.2*menu_height, 1.3*menu_width, menu_height);
    
    fill(170, 210, 230);
    rect(width/2-1.3*menu_width/2, 0.7*height, 1.3*menu_width, menu_height);
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
    textSize(20);     
    textFont(font2);
    
    for(int j=0; j<4; j++){      
    odvojeno = ponudeni_odgovori[j];
    String[] lista_odvojenog = split(odvojeno, "-");
    if( j%4 == 0 ){
      if(i == 0) text(" "+lista_odvojenog[1], width/3-menu_width/2+0.25*menu_width, height/3+0.4*menu_height);
      else text(" "+lista_odvojenog[0], width/3-menu_width/2+0.25*menu_width, height/3+0.4*menu_height); 
    }
    else if (j%4 == 1) {
      if(i == 0) text(" "+lista_odvojenog[1], width/3-menu_width/2+1.1*menu_width+0.05*menu_width+0.55*menu_width, height/3+0.4*menu_height);
      else text(" "+lista_odvojenog[0], width/3-menu_width/2+1.1*menu_width+0.55*menu_width, height/3+0.4*menu_height); 
    }
    else if (j%4 == 2) {
      if(i == 0) text(" "+lista_odvojenog[1], width/3-menu_width/2+0.25*menu_width, height/3+1.2*menu_height+0.4*menu_height);
      else text(" "+lista_odvojenog[0], width/3-menu_width/2+0.25*menu_width, height/3+1.2*menu_height+0.4*menu_height); 
    }
    else{
     if(i == 0) text(" "+lista_odvojenog[1], width/3-menu_width/2+1.1*menu_width+0.55*menu_width, height/3+1.2*menu_height+0.4*menu_height);
     else text(" "+lista_odvojenog[0], width/3-menu_width/2+1.1*menu_width+0.55*menu_width, height/3+1.2*menu_height+0.4*menu_height);
  }     
}
}
