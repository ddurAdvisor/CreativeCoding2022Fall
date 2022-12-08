float r, i=PI/2;
void setup() {
  size(720, 720);
  clear();
  for (r=0; r<TAU*9; r+=.3)f(cos(r)*r*9+360, sin(r)*r*9+360, r+(i*=-1), r);
}
void f(float x, float y, float r, float d) {
  if (d>1) {
    line(x, y, x+=cos(r)*d, y+=sin(r)*d);
    stroke(r, 255, r);
    f(x, y, r+PI/4, d*.65);
    f(x, y, r-PI/5, d*.65);
  }
}
