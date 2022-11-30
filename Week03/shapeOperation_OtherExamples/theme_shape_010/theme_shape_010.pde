// from Generative Gestaltung, ISBN: 978-3-87439-759-9 First Edition, Hermann Schmidt, Mainz, 2009

/**
 * changing size of circles in a rad grid depending the mouseposition
 * 	 
 * MOUSE
 * position x/y        : module size and offset z
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */
import java.util.*;
import processing.pdf.*;
boolean savePDF = false;

float tileCount = 20;
color moduleColor = color(0);
int moduleAlpha = 180;
int actRandomSeed = 0;
int max_distance = 500; 

void setup(){
  size(600, 600, P3D);
}

void draw() {
  if (savePDF) beginRaw(PDF, timestamp()+".pdf");

  background(255);
  smooth();
  noFill();

  randomSeed(actRandomSeed);

  stroke(moduleColor, moduleAlpha);
  strokeWeight(3);

  for (int gridY=0; gridY<width; gridY+=25) {
    for (int gridX=0; gridX<height; gridX+=25) {

      float diameter = dist(mouseX, mouseY, gridX, gridY);
      diameter = diameter/max_distance * 40;
      pushMatrix();
      translate(gridX, gridY, diameter*5);
      rect(0, 0, diameter, diameter);    //// also nice: ellipse(...)
      popMatrix(); 
    }
  }

  if (savePDF) {
    savePDF = false;
    endRaw();
  }
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}

void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
