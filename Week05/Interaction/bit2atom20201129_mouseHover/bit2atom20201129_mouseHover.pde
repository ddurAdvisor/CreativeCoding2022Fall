boolean hover;

void setup() {
  size(600, 400);
  background(0);
  stroke(255);
}

void draw() {
  background(0);
  noStroke();
  if (hover()) {
    fill(255, 0, 255);
  } else {
    fill(153);
  }
  ellipse(width/2, height/2, 100, 100);
}

boolean hover() {
  float d = sq(mouseX-width/2)+sq(mouseY-height/2);
  if (d < 50*50) {
    return true;
  } else {
    return false;
  }
}
