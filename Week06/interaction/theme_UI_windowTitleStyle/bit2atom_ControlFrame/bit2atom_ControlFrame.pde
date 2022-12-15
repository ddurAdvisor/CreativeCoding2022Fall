import controlP5.*;
ControlFrame cf;

int surfaceLocationX = 100;
int surfaceLocationY = 100;

void settings() {
  size(1200, 1200, P3D);
}

void setup() {
  background(255);
  cf = new ControlFrame(this, 300, width, "SystemController");
  surface.setLocation(surfaceLocationX, surfaceLocationY);
}

void draw(){
  background(255);
  ellipse(width/2, height/2, 100, 100);
}
