void izbornik_draw(){
    noStroke();
    // fill(170, 210, 230, 220); -> mousePressed
    fill(170, 210, 230, 180);
    rect(width/2-menu_width/2, height/3-0.5*menu_height, menu_width, menu_height);
    rect(width/2-menu_width/2, height/3-(0.5-1.2)*menu_height, menu_width, menu_height);
    rect(width/2-menu_width/2, height/3-(0.5-2.4)*menu_height, menu_width, menu_height);
    fill(#282828);
    textAlign(CENTER, CENTER);
    text(" Igraj!".toUpperCase(), width/2, height/3-0.07*menu_height);
    text(" Postavke".toUpperCase(), width/2, height/3+1.1*menu_height);
    text(" Rezultati".toUpperCase(), width/2, height/3+2.3*menu_height);
}
