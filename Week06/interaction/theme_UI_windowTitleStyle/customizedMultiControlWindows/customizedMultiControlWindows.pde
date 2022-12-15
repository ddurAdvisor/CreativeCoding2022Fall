import controlP5.*;

CtWindow[] cw;

float eX, eY, eD;
int fR, fG, fB;

void setup(){
  size(800, 800);
  cw = new CtWindow[2];
  cw[0] = new CtWindow(this, 400, 200, "control Panel A", 0);
  cw[1] = new CtWindow(this, 400, 200, "control Panel B", 1);
}

void draw(){
  background(0);
  noStroke();
  fill(fR, fG, fB);
  ellipse(eX, eY, eD, eD);
}
