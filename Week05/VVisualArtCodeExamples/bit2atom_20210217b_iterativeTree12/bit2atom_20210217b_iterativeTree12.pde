float r, t;
void setup() {
  size(720, 720);
  stroke(-1);
}
void draw() {
  clear();
  t+=.003;
  for (r=0; r<TAU; r+=PI/5)
    f(360, 360, r, 126);
}
void f(float x, float y, float r, float d) {
  if (d>3) {
    line(x, y, x+=cos(r)*d, y+=sin(r)*d);
    f(x, y, r+tan(d)+t, d*.7);
    f(x, y, r-tan(d)-t, d*.7);
  }
}
