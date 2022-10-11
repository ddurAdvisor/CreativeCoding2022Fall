import saito.objloader.*;

OBJModel model;

void setup() {
  size(displayWidth, displayHeight, P3D);
  model = new OBJModel(this, "hogwarts.obj", TRIANGLES);
  background(255);
  noStroke();
}

void draw() {
  background(255);
  lights();
  pushMatrix();
  translate(width/2, height, 0);
  rotateY(map(mouseX, 0, width, -PI, PI));
  float scale = map(mouseY, 0, height, 0, 1);
  scale(scale);
  model.draw();
  popMatrix();
}
