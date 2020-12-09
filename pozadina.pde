

int colArrayCounter = 0;
color[] colArray = {
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
  
  
  //size(800, 600);
  //surface.setLocation(800, 70);
  //noLoop();
  noStroke();
  //mouseX = 10;
  frameRate(5);
}

void pozadina_draw() {
  background(#282828);
 //translate(width/2, height/2);
 float rStep = 30;
 float rMax = 1920;
 //float rMin = mouseX;
 
 for(float r = 0; r < rMax; r+=rStep) {
   
   float c = 2*PI*r;    //circimference
   float cSegment = map(r, 0, rMax, rStep*3/4, rStep/2);
   float aSegment = floor(c/cSegment);    //angle Segment
   float ellipseSize = map(r, 0, rMax, rStep*3/4-1, rStep/4);
   
   for(float a = 0; a < 360; a += 360/aSegment) {
     //fill(random(255), random(255), random(255));
     colArrayCounter++;
     if(colArrayCounter > 5) colArrayCounter = 0;
     float random = random(6);
     if (boja == 1)
       fill(colArray[(int)random]);
     else
       fill(colArrayRozo[(int)random]);
     //fill(colArray[colArrayCounter]);
     //fill(colArray[int(random(6))]);
      pushMatrix();
      rotate(radians(a));
      ellipse(r, 0, ellipseSize, ellipseSize);
      popMatrix();
    }
 }
}
