float t, i, d, x, y;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  blendMode(DIFFERENCE);
  t+=.005;
  for (i=0; i<9; i++) {
    x=y=360;
    for (d=.5; d>0; d-=.01) {
      circle(x+=(noise(i, d+t)-.5)*30, y+=(noise(i, d+t, 9)-.5)*30, d*40);
    }
  }
}
