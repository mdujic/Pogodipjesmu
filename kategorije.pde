void kategorije_draw()
{
    noStroke();
    fill(170, 210, 230, 180);
    rect(width/3-menu_width/2, height/2, menu_width, menu_height);
    rect(width/3-menu_width/2+1.1*menu_width, height/2, menu_width, menu_height);
    fill(#282828);
    textAlign(CENTER, CENTER);
    text(" Pjesme!", width/3-0.005*menu_width, height/2 + 0.35*menu_height);
    text(" Izvođači!", width/3+1.08*menu_width, height/2 + 0.35*menu_height);
    fill(#282828);
    ellipse( width/2, height/3, 2*menu_width, 1.5*menu_height);
    fill(170, 210, 230);
    textAlign(CENTER);
    text("Izaberi kategoriju:", width/2, height/3+0.1*menu_height);
}
