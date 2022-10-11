import processing.dxf.*;

boolean record = false;

void setup() {
  size(600, 400, P3D);
  background(0);
  noStroke();
}

void draw() {
  if (record == true) {
    beginRaw(DXF, "output.dxf");
  }
  background(0);
  lights();
  translate(width/2, height/2, -200);
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateZ(map(mouseY, 0, height, 0, -PI));
  fill(255);
  for (int y = -2; y < 2; y++) {
    for (int x = -2; x < 2; x++) {
      for (int z = -2; z < 2; z++) {
        pushMatrix();
        translate(100*x, 100*y, 100*z);
        sphere(30);
        popMatrix();
      }
    }
  }
  if (record == true) {
    endRaw();
    record = false;
  }
}

void keyPressed() {
  if (key == 'R' || key == 'r') {
    record = true;
  }
}
