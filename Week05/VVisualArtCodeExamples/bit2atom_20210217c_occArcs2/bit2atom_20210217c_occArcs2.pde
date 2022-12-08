float t, d, r, T;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.003;
  for (d=90; d>0; d-=3)
    for (r=0; r<TAU; r+=.01) {
      fill((r*r*40)%255, d*3, 255-d*2, 255-d*3);
      arc(cos(r*t)*(T=tan(t+sin(r)*99)*99)+360, sin(r-t)*T+360, d, d, r-T/999, r+T/999);
    }
}
