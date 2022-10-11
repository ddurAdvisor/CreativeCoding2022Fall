void setup() {
  size(600, 400, P3D);
  background(0);
  colorMode(RGB, 1);
  noStroke();
  fill(0.75, 0, 0);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  lightSpecular(1, 1, 1);
  directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
  float w = width;
  float s = mouseX / w;
  specular(s, s, s);
  sphere(90);
}
