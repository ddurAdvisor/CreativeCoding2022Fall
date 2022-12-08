float r, t;
void setup() {
  size(720, 720);
  noFill();
}
void draw() {
  background(-1);
  t+=.003;
  for (r=0; r<TAU; r+=PI/2)
    f(360, 360, r, 99);
}
void f(float x, float y, float r, float d) {
  if (d>9) {
    circle(x+=cos(r)*d, y+=sin(r)*d, d/4);
    f(x, y, r+d+t, d*.8);
    f(x, y, r-d-t, d*.8);
  }
}
