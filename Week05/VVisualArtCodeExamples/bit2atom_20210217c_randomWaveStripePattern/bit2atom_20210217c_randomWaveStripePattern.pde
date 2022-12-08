float x, y, t, a, N;
void setup() {
  size(720, 720);
  colorMode(HSB);
}
void draw() {
  clear();
  t+=sq(sin(a+=.02))*.1;
  for (y=-9; y<730; y+=4)for (x=0; x<810; x+=90) {
    stroke(x/4, 128, 255);
    line(x-cos(t+(N=noise((x+y)*.001+t*.01))*5*(x+y)*.01)*43, y-9, x+sin(t-N*5*(x-y)*.01)*43, y+9);
  }
}
