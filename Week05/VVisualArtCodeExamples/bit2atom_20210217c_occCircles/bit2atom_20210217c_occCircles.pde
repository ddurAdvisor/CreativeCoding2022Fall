float t, r, d;
void setup() {
  size(1920, 1080);
}
void draw() {
  clear();
  t+=.05;
  for (r=0; r<TAU; r+=PI/16) {
    resetMatrix();
    translate(960, 540);
    rotate(r);
    for (d=0; d<11; d++) {
      translate(90, 30);
      bezier(0, 0, 30, d*30*sin(t+d), 60, -30*d*cos(t+d), 90, 0);
    }
  }
}
