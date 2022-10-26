float t, r;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  clear();
  t+=.003;
  for (r=0; r<6; r+=PI/2.5)
    f(360, 360, r, 99);
}
void f(float x, float y, float r, float d) {
  if (d>5) {
    circle(x+=cos(r)*d, y+=sin(r)*d, d/9);
    f(x, y, r+d*d+t, d*.8);
    f(x, y, r-d*d-t, d*.8);
  }
}
