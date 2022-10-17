int metaBallNum = 12;
PVector[] mb;
PVector[] speed;
float c = 2;

boolean moveAble = true;
boolean showCore;

void setup() {
  size(1200, 1200);
  background(0);
  loadPixels();
  initiateSource();
}

void draw() {
  background(0);
  surface.setTitle("MetaBalls | frameRate: " + nfc(frameRate, 2));
  if (moveAble) {
    move();
  }
  metaBall();
  if (showCore) {
    showSource();
  }
}

void initiateSource() {
  mb = new PVector[metaBallNum];
  speed = new PVector[metaBallNum];
  for (int i = 0; i < mb.length; i ++) {
    mb[i] = new PVector(width/2 + random(-200, 200), height/2 + random(-200, 200), random(50, 100));
    speed[i] = PVector.random2D().mult(2);
  }
}

void move() {
  for (int i = 0; i < mb.length; i ++) {
    mb[i].add(speed[i]);

    if (mb[i].x > width - mb[i].z/2) {
      mb[i].x = width - mb[i].z/2;
      speed[i].x *= -1;
    }
    if (mb[i].x < mb[i].z/2) {
      mb[i].x = mb[i].z/2;
      speed[i].x *= -1;
    }
    if (mb[i].y > height - mb[i].z/2) {
      mb[i].y = height - mb[i].z/2;
      speed[i].y *= -1;
    }
    if (mb[i].y < mb[i].z/2) {
      mb[i].y = mb[i].z/2;
      speed[i].y *= -1;
    }
  }
}

void showSource() {
  for (int i = 0; i < mb.length; i ++) {
    stroke(200, 0, 255);
    strokeWeight(1);
    //noStroke();
    noFill();
    ellipse(mb[i].x, mb[i].y, mb[i].z, mb[i].z);

    stroke(0);
    strokeWeight(5);
    point(mb[i].x, mb[i].y);
  }
}

void metaBall() {
  for (int p = 0; p < width * height; p ++) {
    int pLocX = p%width;
    int pLocY = p/width;

    float d = 0;
    for (int i = 0; i < mb.length; i ++) {
      d += mb[i].z / sqrt((pLocX - mb[i].x)*(pLocX - mb[i].x) + (pLocY - mb[i].y)*(pLocY - mb[i].y));
    }
    d /= 1.5;
    if (d > c*1.1) {
      pixels[p] = color(0);//inner area
    } else if (d > c) {
      pixels[p] = color(255);//contour area
    } else {
      pixels[p] = color(0);//outer area
    }
  }
  updatePixels();
}

void keyPressed() {
  if (key == 'r') {
    initiateSource();
  }
  //moveAble
  if (key == 'm') {
    moveAble = !moveAble;
  }
  //showCore
  if (key == 'c') {
    showCore = !showCore;
  }
}
