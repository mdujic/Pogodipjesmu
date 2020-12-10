void kraj_draw()
{
    fill(#282828,180);
    rect(width/2-1.8*menu_width/2, height/3, 1.8*menu_width, 2*menu_height);
    fill(#282828);
    ellipse( width/2, height/3, 2*menu_width, 1.5*menu_height);
    fill(pravokutnik_pozadina);
    textAlign(CENTER, CENTER);
    text("Osvojeni bodovi:", width/2, height/3);
    fill(pravokutnik_pozadina);
    if(bodovi - (int)m/2000 < 0) text(0, width/2, 0.48*height); 
    else text(bodovi - (int)m/2000, width/2, 0.48*height);
    
    fill(pravokutnik_pozadina, 180);    
    rect(width/2-menu_width/2, 0.65*height, menu_width, menu_height);
    fill(#282828);
    textSize(fontSizeSmall);    
    text(" Igraj ponovo", width/2, 0.7*height);
}
