float t, r;
void setup() {
  size(720, 720);
  stroke(-1);
}
void draw() {
  clear();
  t+=.01;
  for (r=0; r<6; r++)
    f(360, 360, PI/3*r, 99);
}
void f(float x, float y, float r, float d) {
  if (d>5) {
    line(x, y, x+=cos(r)*d, y+=sin(r)*d);
    f(x, y, cos(t)+r+PI/2, d*.7);
    f(x, y, sin(t)+r-PI/7, d*.72);
  }
}
