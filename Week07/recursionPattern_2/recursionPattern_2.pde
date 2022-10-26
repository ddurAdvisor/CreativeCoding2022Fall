float r, t;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  t+=.003;
  for (r=0; r<TAU; r+=PI/4)f(360, 360, r-t, 99*sq(cos(r)-sin(r)));
}
void f(float x, float y, float r, float d) {
  if (d>9) {
    circle(x+=cos(r)*d, y+=sin(r)*d, d/2);
    f(x, y, r+d/99+t, d*.7);
    f(x, y, r-d/99-t, d*.7);
  }
}
