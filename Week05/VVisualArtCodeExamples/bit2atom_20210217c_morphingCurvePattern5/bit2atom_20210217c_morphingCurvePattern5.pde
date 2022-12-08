float t, j;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  blendMode(DIFFERENCE);
  t+=.005;
  for (j=0; j<9; j++)
    f(360, 360, j+t, 3);
}
void f(float x, float y, float i, float d) {
  if (d>0) {
    circle(x+=(noise(0, i)-.5)*20, y+=(noise(0, i, 9)-.5)*20, d*9);
    f(x, y, i+.01, d-=.04);
  }
}
