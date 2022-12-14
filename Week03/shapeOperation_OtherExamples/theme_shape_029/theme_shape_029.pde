// from Generative Gestaltung, ISBN: 978-3-87439-759-9 First Edition, Hermann Schmidt, Mainz, 2009


/**
 * draw tool. shows how to work with relations between elements. 
 * 
 * MOUSE
 * drag                : draw
 * 
 * KEYS
 * 1                   : draw mode 1 - fixed distance
 * 2                   : draw mode 2 - distance threshold 
 * del, backspace      : clear screen
 * arrow up            : line length +
 * arrow down          : line length -
 * s                   : save png
 * r                   : start pdf recording
 * e                   : stop pdf recording
 */
import java.util.*;
import processing.pdf.*;
boolean recordPDF = false;

int drawMode = 1;

color col = color(random(255),random(255),random(255),random(100));
float x = 0, y = 0;
//float newX = 0, newY = 0;
float stepSize = 5.0;
float lineLength = 25;


void setup() {
  // use full screen size 
  size(800, 800);
  background(255);
  smooth();
  x = mouseX;
  y = mouseY;
  cursor(CROSS);
}


void draw() {
  if (mousePressed) {
    float d = dist(x,y, mouseX,mouseY);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x); 

      pushMatrix();
      translate(x,y);
      rotate(angle);
      stroke(col);
      if (frameCount % 2 == 0) stroke(150);
      line(0,0,0,lineLength*random(0.95,1.0)*d/10);
      popMatrix();

      if (drawMode == 1) {
        x = x + cos(angle) * stepSize;
        y = y + sin(angle) * stepSize; 
      } 
      else {
        x  = mouseX;
        y  = mouseY; 
      }
    }
  }
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
  col = color(random(255),random(255),random(255),random(100));
  //lineLength = random(15,50);
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == DELETE || key == BACKSPACE) background(255);

  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;

  // ------ pdf export ------
  // press 'r' to start pdf recording and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+"_.pdf");
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

void keyPressed() {
  // lineLength ctrls arrowkeys up/down 
  if (keyCode == UP) lineLength += 5;
  if (keyCode == DOWN) lineLength -= 5; 
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
