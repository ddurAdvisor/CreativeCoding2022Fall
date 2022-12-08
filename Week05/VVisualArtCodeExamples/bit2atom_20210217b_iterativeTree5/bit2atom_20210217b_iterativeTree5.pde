float r, t;
void setup() {
  size(720, 720);
  stroke(-1, 72);
}
void draw() {
  clear();
  t+=.003;
  for (r=0; r<7; r+=PI/3)
    f(360, 360, r, 160);
}
void f(float x, float y, float r, float d) {
  if (d>9) {
    line(x, y, x+=cos(r)*d, y+=sin(r)*d);
    f(x, y, r+d+t, d/1.3);
    f(x, y, r-d-t, d/1.3);
  }
}
