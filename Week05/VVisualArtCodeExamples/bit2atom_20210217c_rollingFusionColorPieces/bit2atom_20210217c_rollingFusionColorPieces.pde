float t, r, d, T;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t-=.004;
  for (d=90; d>0; d-=3) {
    for (r=0; r<720; r+=10) {
      fill(r%255, d*3, 255-d*2, 255-d*2);
      circle(cos(r*4+t+d*.002)*300+360, sin(r*3+t+d*.002)*300+360, d);
    }
  }
}
