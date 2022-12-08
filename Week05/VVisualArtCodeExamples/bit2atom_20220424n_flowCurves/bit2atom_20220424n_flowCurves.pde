float t = 0.0;
float k;

void setup() {
  size(640, 640);
  smooth(5);
}

void draw(){
  background(255);
  k = map(sin(t+=.005), -1, 1, 99, 50);
  
  //stroke(0);
  strokeWeight(5);

  for (float y = 0; y < width; y += 8) {
    endShape();
    beginShape();
    strokeCap(ROUND);
    strokeJoin(ROUND);
    //noFill();
    //stroke(t*y%255);
    for (float x = 0; x < width; x += 8) {
      float d = noise(x/width, y/width-t)*k;
      vertex(cos(d)*9+x, sin(d)*9+y);
    }
    //endShape();
  }
}
