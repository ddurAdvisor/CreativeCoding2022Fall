float t, r, S, T;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  fill(0, 8);
  square(0, 0, 721);
  t+=.05;
  for (r=6; r<TAU*9; r+=.2) {
    fill((r*r*r)%255, 192, (S=sq(sin(r+t)))*255, S*99);
    circle(cos(r)*r*(9+(T=sin(t+r*.2)))+360, tan(r*3-t*.1)*r*(9+T)+360, T*20);
  }
}
