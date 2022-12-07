float x = 0;
float easing = 0.07;

void setup() {
  size(600, 400);
  background(0);
  stroke(255);
}

void draw() {
  background(0);
  fill(255);
  float targetX = mouseX;
  x += (targetX - x) * easing;
  ellipse(x, height/2, 40, 40);
}
