import controlP5.*;

ControlP5 cp5;

void unos_imena_setup() {
  PFont font = createFont("arial",20);

  cp5 = new ControlP5(this);

  cp5.addTextfield("")
    .setPosition(width*0.35,height*0.45)
    .setSize(600,50)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255,0,0))
    ;

  textFont(font);
}

void unos_imena_draw() {
    fill(pravokutnik_pozadina, 180);
    
    rect(width/2-menu_width/2, height/3-0.5*menu_height, menu_width, menu_height);
    rect(width/2-menu_width/2, height/3-(0.5-2.4)*menu_height, menu_width, menu_height);
    fill(boja_teksta);
    textAlign(CENTER, CENTER);
    text(" Unesi ime:".toUpperCase(), width/2, height/3-0.07*menu_height);
    text(" Enter za kraj :)".toUpperCase(), width/2, height/3+2.3*menu_height);
}


void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
    ime = theEvent.getStringValue();
    cp5.remove("");
  }
}
