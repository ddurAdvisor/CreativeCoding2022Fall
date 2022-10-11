int s = 100;

void setup() {
  size(400, 400, P3D);
  background(0);
  translate(width/2, height/2, -100);
  stroke(255);
  rotateX(PI/2);
  rotateZ(-PI/6);
  noFill();
  
  beginShape();
  vertex(-s, -s, -s);
  vertex(s, -s, -s);
  vertex(0, 0, s);
  
  vertex(s, -s, -s);
  vertex(s,  s, -s);
  vertex(0, 0, s);
  
  vertex(s, s, -s);
  vertex(-s, s, -s);
  vertex(0, 0, s);
  
  vertex(-s, s, -s);
  vertex(-s, -s, -s);
  vertex(0, 0, s);
  endShape();
}
