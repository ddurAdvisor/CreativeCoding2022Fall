float t, d, x, T;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.003;
  for (d=90; d>0; d-=3) {
    for (x=0; x<730; x+=9) {
      fill((x*x)%255, 255-d*2, d*3);
      ellipse(x, .5*tan(T=2*x+t)*9+150, d*(abs(cos(T))*.8+.2), d*(sq(sin(T))*.2+.8));
    }
  }
}
