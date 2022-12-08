float r, t;
void setup() {
  size(720, 720);
  colorMode(HSB, 9);
}
void draw() {
  clear();
  t+=.01;
  for (r=0; r<6; r++)f(360, 360, r, 1);
}
void f(float x, float y, float i, float d) {
  if (d<9) {
    stroke((d*i)%9, 7, 9);
    line(x, y, x+=cos(i+d)*150/d, y+=sin(i+d)*150/d);
    f(x, y, i+t, ++d);
    f(y, x, -i-t, d);
  }
}
