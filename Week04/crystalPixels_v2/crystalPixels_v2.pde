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
  int pxlength = blockSize * blockSize;
  for (int i = 0; i < xDiv; i ++) {
    for (int j = 0; j < yDiv; j ++) {
      color cc = 0;
      float rr = 0;
      float gg = 0;
      float bb = 0;

      for (int m = 0; m < blockSize; m ++) {
        for (int n = 0; n < blockSize; n ++) {
          rr += red(img.get(blockSize*i+m, blockSize*j+n));
          gg += green(img.get(blockSize*i+m, blockSize*j+n));
          bb += blue(img.get(blockSize*i+m, blockSize*j+n));
        }
      }
      cc = color(rr/pxlength, gg/pxlength, bb/pxlength);

      //color c = img.get(width/xDiv*2*(i+1/2), height/yDiv*2*(j+1/2));
      //rectMode(CENTER);
      fill(cc);
      noStroke();
      rect(blockSize*i, blockSize*j, blockSize, blockSize);
    }
  }
}
