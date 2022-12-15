import peasy.*;
PeasyCam cam;

void setup() {
  size(1200, 960, P3D); 
  surface.setTitle("Title: " + frameRate);
  cam = new PeasyCam(this, 200);
  UI();
}

void draw(){
  background(175);
  
  cam.beginHUD();
  bar.draw();
  cam.endHUD();
}
