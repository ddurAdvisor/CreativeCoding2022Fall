void setup() {
  size(400, 400, P3D);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  pointLight(255, 0, 0, // Color
    300, -150, 0); // Position
  directionalLight(0, 255, 0, // Color
    1, 0, 0); //X, Y, Z direction
  spotLight(0, 0, 255, // Color
    0, 40, 300, //Position
    0, -0.5, -0.5, // Direction
    PI/2, 2); // Angle, concentration
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateX(map(mouseY, 0, height, 0, PI));
  box(200);
}
