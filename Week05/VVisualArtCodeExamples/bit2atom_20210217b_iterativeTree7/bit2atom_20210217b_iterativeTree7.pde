float t, r;
void setup() {
  size(720, 720);
  stroke(-1);
}
void draw() {
  clear();
  t+=.001;
  for (r=0; r<6; r+=PI/6)
    f(360, 360, r, 200);
}
void f(float x, float y, float r, float d) {
  if (d>2) {
    line(x, y, x+=tan(r+t)/2*d, y+=sin(r-t)*d);
    f(x, y, r+t, d/1.6);
    f(x, y, r-t, d/1.6);
  }
}
