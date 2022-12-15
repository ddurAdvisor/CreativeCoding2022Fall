class SecondApplet extends PApplet {

  void setup() {
    surface.setTitle("newWindow");
    surface.setSize(400, 400);
  }
  
  void draw() {
    background(255);
    fill(0);
    ellipse(mouseX, mouseY, 10, 10);
  }
}
