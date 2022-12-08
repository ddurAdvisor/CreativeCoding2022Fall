float r, d, t, P;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.004;
  for (d=1; d<361; d+=30)
    for (r=0; r<TAU; r+=.01) {
      fill((r*d)%255, 192, 255, 255-(P=sq(tan(r*r/9-t))));
      circle(tan(r+t+d)*d+360, sin(r+d+t*2)*d+360, P/9);
    }
}
