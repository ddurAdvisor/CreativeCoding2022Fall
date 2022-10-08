import controlP5.*;
ControlP5 cp;

PImage img;
int rectNum = 50000;
int blockSize = 128;

int xDiv;
int yDiv;

void setup() {
  img = loadImage("bear.jpg");
  cp = new ControlP5(this);
  cp.addSlider("blockSize", 1, 512, 64, 50, 50, 200, 30);
  //cp.addSlider("yDiv", 9, 288, 50, 50, 90, 200, 30);
  size(1024, 576);
}

void draw() {
  background(0);
  xDiv = width/blockSize;
  yDiv = height/blockSize;
  //image(img, 0, 0);
  //drawRect();
  drawGrid();
}

void drawRect() {
  for (int i = 0; i < rectNum; i ++) {
    int x = int(random(width));
    int y = int(random(height));
    color c = img.get(x, y);
    rectMode(CENTER);
    fill(c, 100);
    noStroke();
    rect(x, y, 30, 30);
  }
}

void drawGrid() {
  for (int i = 0; i < xDiv; i ++) {
    for (int j = 0; j < yDiv; j ++) {
      color c = img.get(blockSize*(i+1/2), blockSize*(j+1/2));
      //rectMode(CENTER);
      fill(c);
      noStroke();
      rect(blockSize*i, blockSize*j, blockSize, blockSize);
    }
  }
}
