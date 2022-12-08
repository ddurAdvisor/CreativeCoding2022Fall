float t, x, y, r;
void setup() {
  size(720, 720);
  noFill();
  colorMode(HSB);
  strokeWeight(4);
}
void draw() {
  clear();
  t+=.01;
  for (r=0; r<TAU*9; r+=.01) {
    stroke((r*r)%255, 255, 255, 99);
    arc(cos(r*r)*99+360, sin(r*r)*99+360, tan(r+t)*r*9, sin(r-t)*r*9, r*r, r*r+PI/6);
  }
}
