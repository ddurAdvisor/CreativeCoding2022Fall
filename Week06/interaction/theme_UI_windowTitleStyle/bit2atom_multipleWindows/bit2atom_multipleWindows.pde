void setup() {
  size(400, 400);

  String[] args = {"theWindow"};
  SecondApplet sa = new SecondApplet();
  PApplet.runSketch(args, sa);
}

void draw() {
  background(0);
  ellipse(mouseX, mouseY, 10, 10);
}
