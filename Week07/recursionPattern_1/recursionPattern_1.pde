float r, t;
void setup() {
  size(720, 720);
  stroke(-1);
}
void draw() {
  clear();
  t+=.003;
  for (r=0; r<6; r+=PI/4)
    f(360, 360, r, 120);
}
void f(float x, float y, float r, float d) {
  if (d>3) {
    line(x, y, x+=cos(r)*d, y-=sin(r)*d);
    f(x, y, r+y/99+t, d/1.5);
    f(x, y, r-y/99-t, d/1.5);
  }
}
