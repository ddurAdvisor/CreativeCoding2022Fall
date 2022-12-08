float t;
void setup() {
  size(720, 720);
  stroke(-1);
}
void draw() {
  clear();
  t+=.01;
  f(0, 0, 1, 270, 7);
}
void f(float x, float y, float r, float d, float a) {
  if (d>3) {
    line(x, y, x+=cos(r)*d, y+=sin(r)*d);
    f(x, y, r+PI/2, d*.7, a+1);
    f(x, y, r-PI/a, d*.72, a+sin(d+t));
  }
}
