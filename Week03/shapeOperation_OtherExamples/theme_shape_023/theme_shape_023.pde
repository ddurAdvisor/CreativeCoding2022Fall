// from Generative Gestaltung, ISBN: 978-3-87439-759-9 First Edition, Hermann Schmidt, Mainz, 2009


/**
 * limited diffusion aggregation 
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */
import java.util.*;
import processing.pdf.*;
boolean savePDF = false;

int maxCount = 5000; //max count of the cirlces
int currentCount = 1;
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount]; // radius

void setup() {
  size(501,723);
  smooth();
  //frameRate(10);

  // first circle
  x[0] = width/2;
  y[0] = height/2;
  r[0] = 10;
  //r[0] = 400; 
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  background(255);

  strokeWeight(0.5);
  //noFill();

  // create a radom set of parameters
  float newR = random(1, 7);
  float newX = random(0+newR, width-newR);
  float newY = random(0+newR, height-newR);

  float closestDist = 100000000;
  int closestIndex = 0;
  // which circle is the closest?
  for(int i=0; i < currentCount; i++) {
    float newDist = dist(newX,newY, x[i],y[i]);
    if (newDist < closestDist) {
      closestDist = newDist;
      closestIndex = i; 
    } 
  }

  // show random position and line
  // fill(230);
  // ellipse(newX,newY,newR*2,newR*2); 
  // line(newX,newY,x[closestIndex],y[closestIndex]);

  // aline it to the closest circle outline
  float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);

  x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex]+newR);
  y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex]+newR);
  r[currentCount] = newR;
  currentCount++;

  // draw them
  for (int i=0 ; i < currentCount; i++) {
    //fill(50,150);
    fill(50);
    ellipse(x[i],y[i], r[i]*2,r[i]*2);  
  }

  if (currentCount >= maxCount) noLoop();

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
