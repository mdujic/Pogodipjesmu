void rezultati_draw()
{
   fill(boja_teksta);
    ellipse( width/2, height/3, 2*menu_width, 1.5*menu_height);
    fill(pravokutnik_pozadina, 180);
    textAlign(CENTER);
    textFont(font2);
    text("Izgleda da ces ovo morat iskodirat. :P", width/2, height/3+0.1*menu_height); 
}
