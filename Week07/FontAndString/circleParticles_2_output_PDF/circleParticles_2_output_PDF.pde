import processing.pdf.*;

ArrayList<Particle> pts;
float rad;

boolean savePDF;

void setup() {
  size(800, 800);
  background(255);
  initiateSystem(); 
  println(pts.size());
}

void initiateSystem() {
  rad = width/4;
  float step = 0.01;
  pts = new ArrayList<Particle>();
  for (float a = 0; a < TWO_PI; a += step) {
    float x = rad * cos(a) + width/2;
    float y = rad * sin(a) + height/2;
    PVector p = new PVector(x, y);
    pts.add(new Particle(p));
  }
}

void draw() {
  background(255);
  
  //start pdf rendering
  if(savePDF) {
    beginRecord(PDF, "output/Line.pdf"); 
  }
  
  for(int i = 0; i < pts.size(); i ++){
    pts.get(i).run();
  }
  
  if(savePDF) {
    endRecord();
    savePDF = false; 
  }
  //end.
}

void keyPressed(){
  if(key == 's') savePDF = true;
}
