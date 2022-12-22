import processing.pdf.*;
PFont font;
PImage letter;

ArrayList<Particle> pts;
PGraphics pgLetter;

float[][] laplacian = {{1, 1, 1}, {1, -8, 1}, {1, 1, 1}};

boolean savePDF;

String str = "A";

int textSize = 600;
float scaleSize = 600/textSize;

void settings() {
  size(800, 800);
}

void setup() {
  background(0);
  createLetterPGraphic();
  //image(pgLetter, 0, 0);
  pts = new ArrayList<Particle>();
  convolutionProcess(pgLetter);
  println(pts.size());
}

void draw(){
  background(255);
  if(savePDF){
    beginRecord(PDF, "outPut/font-"+str+".pdf"); 
  }
  
  for(Particle p : pts){
    p.run();
  }
  
  if(savePDF){
    endRecord();
    savePDF = false; 
  }
}

void keyPressed(){
  if(key == 's') savePDF = true;
}

void createLetterPGraphic(){
  font = createFont("arial", 800);
  pgLetter = createGraphics(width, height);
  pgLetter.beginDraw();
  pgLetter.background(255);
  pgLetter.textAlign(CENTER, CENTER);
  pgLetter.fill(0);
  pgLetter.textFont(font);
  pgLetter.textSize(textSize);
  pgLetter.text(str, width/2, height/2);
  pgLetter.endDraw();
}

void convolutionProcess(PImage img) {
  for (int i = 0; i < img.width; i ++) {
    for (int j = 0; j < img.height; j ++) {
      color convColor = color(convolution(i, j, laplacian, img));
      if (brightness(convColor)>200) {
        PVector p = new PVector(i, j);
        pts.add(new Particle(p));
      }
    }
  }
}

color convolution(int x, int y, float[][] matrix, PImage img) {
  float bTotal = 0;
  int offset = matrix.length / 2;
  // Loop through convolution matrix
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      // What pixel are we testing
      int xloc = x + i-offset;
      int yloc = y + j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we haven't walked off the edge of the pixel array
      loc = constrain(loc, 0, img.pixels.length-1);
      // Calculate the convolution
      bTotal += (brightness(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  bTotal = constrain(bTotal, 0, 255);

  // Return the resulting color
  return color(bTotal);
}
