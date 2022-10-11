void setup() {
  size(400, 400, P3D);
  background(0);
}

void draw() {
  background(0);
  lights();
  camera(30.0, mouseY, mouseX, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
  noStroke();
  fill(200);
  box(90);
  stroke(255);
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);
}
