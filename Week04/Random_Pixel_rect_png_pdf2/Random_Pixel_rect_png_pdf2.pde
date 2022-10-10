import processing.pdf.*;
boolean recordPDF = false;

PImage img; 
float min_radius, max_radius; 
 
void setup() 
{ 
  img = loadImage("bear.jpg"); 
  size(1024,576,P2D); 
  background(255); 
  noStroke(); 
  smooth(); 
  min_radius = 2.0; 
  max_radius = width/15.0; 
} 
 
void draw(){
  float radius = map(mouseX, 0, width, min_radius, max_radius); 
  int opacity = int(map(mouseY, 0, height, 0, 255)); 
  //Ensure nearly-constant area is drawn each time 
  int num_rects = round((5*max_radius*max_radius)/(radius*radius)); 
  for(int i = 0; i < num_rects; ++i) { 
    float theta = random(TWO_PI); 
    int x = int(random(img.width)); 
    int y = int(random(img.height)); 
    color c = img.get(x,y); 
    fill(c, opacity);
    pushMatrix();
      translate(x,y);
      rotate(theta);
      rect( -radius/2.0, -radius/2.0, radius, radius );
    popMatrix();
  }
}

/////////////////////module: save png and pdf///////////////////////////
void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("draw_##.png");
  if (key == DELETE || key == BACKSPACE) background(255);

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "draw.pdf");
      println("recording started");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(255); 
    }
  }
}

// String timestamp() {
//   Calendar now = Calendar.getInstance();
//   return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
// }
/////////////////////module: save png and pdf///////////////////////////
