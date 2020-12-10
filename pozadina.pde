

color[] colArray = {   //plavo
  color(25, 165, 190),
  color(95, 170, 200),
  color(120, 190, 210),
  color(170, 210, 230),
  color(205, 225, 245),
  color(220, 240, 250)
};

color[] colArrayRozo = { 
  color(210, 100, 100),
  color(210, 150, 120),
  color(210, 100, 120),
  color(230, 200, 170),
  color(245, 225, 205),
  color(250, 240, 220)
};


void pozadina_setup() {
  
  noStroke();
  frameRate(5);
}

void pozadina_draw() {
  
  background(boja_teksta);
 float rStep = 30;
 float rMax = 1920;
 
 for(float r = 0; r < rMax; r+=rStep) {
   
   float c = 2*PI*r;    //circimference
   float cSegment = map(r, 0, rMax, rStep*3/4, rStep/2);
   float aSegment = floor(c/cSegment);    //angle Segment
   float ellipseSize = map(r, 0, rMax, rStep*3/4-1, rStep/4);
   
   for(float a = 0; a < 360; a += 360/aSegment) {
     
     float random = random(6);
     if (boja == 1)
       fill(colArray[(int)random]);
     else
       fill(colArrayRozo[(int)random]);
       
      pushMatrix();
      rotate(radians(a));
      ellipse(r, 0, ellipseSize, ellipseSize);
      popMatrix();
    }
 }
}
