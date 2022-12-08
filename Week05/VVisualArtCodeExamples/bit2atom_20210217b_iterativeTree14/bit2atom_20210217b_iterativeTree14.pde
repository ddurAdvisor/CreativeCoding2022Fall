float t, r;
void setup() {
  size(720, 720);
}
void draw() {
  background(-1);
  t+=.003;
  for (r=0; r++<4; )f(360, 360, r*PI/2, 99, sin(t)*5);
}
void f(float x, float y, float r, float d, float a) {
  if (d>9) {
    line(x, y, x+=cos(r)*d, y+=sin(r)*d);
    f(x, y, r+d+t, d*.8+a, a/2);
    f(x, y, r-d-t, d*.8+a, a/2);
  }
}
