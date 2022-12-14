// from Generative Gestaltung, ISBN: 978-3-87439-759-9 First Edition, Hermann Schmidt, Mainz, 2009

/**
 * changing positions of stapled circles in a grid
 * 	 
 * MOUSE
 * position x          : module detail
 * position y          : module parameter
 * 
 * KEYS
 * 1-3                 : draw mode
 * arrow left/right    : number of tiles horizontally
 * arrow up/down       : number of tiles vertically
 * s                   : save png
 * p                   : save pdf
 */

import java.util.*;
import processing.pdf.*;
boolean savePDF = false;

float tileCountX = 6;
float tileCountY = 6;
int count = 0;

int drawMode = 1;


void setup() { 
  size(600, 600);
} 


void draw() { 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(HSB, 360, 100, 100); 
  rectMode(CENTER);
  smooth();
  //noStroke();
  stroke(0);
  noFill();
  background(360); 

  count = mouseX/20 + 5;
  float para = (float)mouseY/height - 0.5;

  for (int gridY=0; gridY<= tileCountY; gridY++) {
    for (int gridX=0; gridX<= tileCountX; gridX++) {  

      float tileWidth = width / tileCountX;
      float tileHeight = height / tileCountY;
      float posX = tileWidth*gridX + tileWidth/2;
      float posY = tileHeight*gridY + tileHeight/2;

      pushMatrix();
      translate(posX, posY);

      // switch between modules
      switch (drawMode) {
      case 1:
        translate(-tileWidth/2, -tileHeight/2);
        for(int i=0; i< count; i++) {
          line(0, (para+0.5)*tileHeight, tileWidth, i*tileHeight/count);
          line(0, i*tileHeight/count, tileWidth, tileHeight-(para+0.5)*tileHeight);
        }
        break;
      case 2:
        for(float i=0; i<=count; i++) {
          line(para*tileWidth, para*tileHeight, tileWidth/2, (i/count-0.5)*tileHeight);
          line(para*tileWidth, para*tileHeight, -tileWidth/2, (i/count-0.5)*tileHeight);
          line(para*tileWidth, para*tileHeight, (i/count-0.5)*tileWidth, tileHeight/2);
          line(para*tileWidth, para*tileHeight, (i/count-0.5)*tileWidth, -tileHeight/2);
        }
        break;
      case 3:
        for(float i=0; i<=count; i++) {
          line(0, para*tileHeight, tileWidth/2, (i/count-0.5)*tileHeight);
          line(0, para*tileHeight, -tileWidth/2, (i/count-0.5)*tileHeight);
          line(0, para*tileHeight, (i/count-0.5)*tileWidth, tileHeight/2);
          line(0, para*tileHeight, (i/count-0.5)*tileWidth, -tileHeight/2);
        }
        break;
      }

      popMatrix();

    }
  }
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
} 


void keyReleased(){
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
  
  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
  if (key == '3') drawMode = 3;

  if (keyCode == DOWN) tileCountY = max(tileCountY-1, 1);
  if (keyCode == UP) tileCountY += 1;
  if (keyCode == LEFT) tileCountX = max(tileCountX-1, 1);
  if (keyCode == RIGHT) tileCountX += 1;

}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
