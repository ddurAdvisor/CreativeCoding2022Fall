void setup() {
  // Setup the 3D environment using the P3D renderer
  size(400, 400, P3D);
  background(0);
}

void draw() {
  background(0);
  
  translate(width/2, height/2, -width);
  
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));
  
  noStroke();
  fill(200, 0, 200);
  rect(-200, -200, 400, 400);
  
  stroke(200, 200, 0);
  strokeWeight(1);
  line(0, 0, -500, 0, 0, 200);
  
  stroke(255);
  strokeWeight(5);
  point(0, 0, 200);
}
