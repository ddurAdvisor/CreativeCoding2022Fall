// from Generative Gestaltung, ISBN: 978-3-87439-759-9 First Edition, Hermann Schmidt, Mainz, 2009


/**
 * draw tool. draws a specific module according to 
 * its east, south, west and north neighbours. 
 * 
 * MOUSE
 * drag left           : draw new module
 * drag right          : delete a module
 * 
 * KEYS
 * del, backspace      : clear screen
 * g                   : toogle. show grid
 * d                   : toogle. show module values
 * s                   : save png
 * p                   : save pdf
 */
import java.util.*;
import processing.pdf.*;
boolean savePDF = false;

PFont font;
PShape[] modules;

float tileSize = 30;
int gridResolutionX, gridResolutionY;
char[][] tiles;

boolean drawGrid = true;
boolean debugMode = false;


void setup() {
  // use full screen size 
  size(800, 800);
  //size(720, 540);
  smooth();
  cursor(CROSS);
  font = createFont("sans-serif",8);
  textFont(font,8);
  textAlign(CENTER,CENTER);

  gridResolutionX = round(width/tileSize)+2;
  gridResolutionY = round(height/tileSize)+2;
  tiles = new char[gridResolutionX][gridResolutionY];
  initTiles();

  // load svg modules
  modules = new PShape[16]; 
  for (int i=0; i< modules.length; i++) { 
    modules[i] = loadShape(nf(i,2)+".svg");
  }
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  background(255);

  if (mousePressed && (mouseButton == LEFT)) setTile();
  if (mousePressed && (mouseButton == RIGHT)) unsetTile();

  if (drawGrid) drawGrid();
  drawModules();

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


void initTiles() {
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      tiles[gridX][gridY] = '0';
    }
  }
}

void setTile() {
  // convert mouse position to grid coordinates
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY] = '1';
}

void unsetTile() {
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY] = '0';
}

void drawGrid() {
  rectMode(CENTER);
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      float posX = tileSize*gridX - tileSize/2;
      float posY = tileSize*gridY - tileSize/2;
      strokeWeight(0.15);
      fill(255);
      if (debugMode) {
        if (tiles[gridX][gridY] == '1') fill(220);
      }
      rect(posX, posY, tileSize, tileSize);
    }
  }
}

void drawModules() {
  shapeMode(CENTER);
  for (int gridY=1; gridY< gridResolutionY-1; gridY++) {  
    for (int gridX=1; gridX< gridResolutionX-1; gridX++) { 
      // use only active tiles
      if (tiles[gridX][gridY] == '1') {
        // check the four neighbours, each can be 0 or 1
        String east = str(tiles[gridX+1][gridY]);
        String south = str(tiles[gridX][gridY+1]);
        String west = str(tiles[gridX-1][gridY]);
        String north = str(tiles[gridX][gridY-1]);
        // create a binary result out of it, eg. 1011
        String binaryResult = north + west + south + east;
        // convert the binary string to a decimal value from 0-15
        int decimalResult = unbinary(binaryResult);
        
        float posX = tileSize*gridX - tileSize/2;
        float posY = tileSize*gridY - tileSize/2;
        // decimalResult is the also the index for the shape array
        shape(modules[decimalResult],posX, posY, tileSize, tileSize);

        if (debugMode) {
          fill(150);
          text(decimalResult+"\n"+binaryResult,posX, posY);
        }
      }
    }
  }
}




void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;

  if (key == DELETE || key == BACKSPACE) initTiles();
  if (key == 'g' || key == 'G') drawGrid = !drawGrid;
  if (key == 'd' || key == 'D') debugMode = !debugMode;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
