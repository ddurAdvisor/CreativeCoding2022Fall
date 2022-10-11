void setup() {
  size(400, 400, P3D);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  if (mousePressed) {
    // Turn the lights on on mouse press
    lights();
  }
  pushMatrix();
  translate(mouseX, mouseY, -500);
  rotateX(-PI/6);
  rotateY(PI/6);
  box(400, 100, 400);
  translate(0, -200, 0);
  sphere(150);
  popMatrix();
}
