float t, r, d, S;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  blendMode(ADD);
  t+=.01;
  for (d=120; d>0; d-=3)
    for (r=0; r<TAU*9; r+=.5) {
      fill((r*r)%255, d*2, 255-d*2, 16);
      circle(cos(r)*r*9*(S=sin(r*r+t))+360, sin(r)*r*9*S+360, d);
    }
}
