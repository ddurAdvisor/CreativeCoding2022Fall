// from Generative Gestaltung, ISBN: 978-3-87439-759-9 First Edition, Hermann Schmidt, Mainz, 2009


/**
 * drawing with a changing shape by draging the mouse.
 * 	 
 * MOUSE
 * position x          : length
 * position y          : thickness and number of lines
 * drag                : draw
 * 
 * KEYS
 * 1-3                 : stroke color
 * del, backspace      : erase
 * s                   : save png
 * r                   : start pdf record
 * e                   : end pdf record
 */
import java.util.*;
import processing.pdf.*;
boolean recordPDF = false;

color strokeColor = color(0, 10);


void setup(){
  size(720, 720);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  noFill();
  background(360);
}

void draw(){
  if(mousePressed){
    pushMatrix();
    translate(width/2,height/2);

    int circleResolution = (int)map(mouseY+100,0,height,2, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;

    strokeWeight(2);
    stroke(strokeColor);

    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
    
    popMatrix();
  }
}

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");

  switch(key){
  case '1':
    strokeColor = color(0, 10);
    break;
  case '2':
    strokeColor = color(192, 100, 64, 10);
    break;
  case '3':
    strokeColor = color(52, 100, 71, 10);
    break;
  }

  // ------ pdf export ------
  // press 'r' to start pdf recording and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, timestamp()+".pdf");
      println("recording started");
      recordPDF = true;
      colorMode(HSB, 360, 100, 100, 100);
      smooth();
      noFill();
      background(360);
    }
  } 
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(360); 
    }
  }  
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
