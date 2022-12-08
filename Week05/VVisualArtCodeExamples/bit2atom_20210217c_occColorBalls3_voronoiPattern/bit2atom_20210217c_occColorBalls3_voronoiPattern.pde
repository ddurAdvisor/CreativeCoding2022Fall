float t, d, l, x;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.001;
  for (d=90; d>0; d-=3) {
    for (l=30; l<230; l+=99) {
      for (x=0; x<760; x+=15) {
        fill((x+l)%255, 255-d*2, d*3);
        circle(x, 1/sin(x+t+l)*l+360, d);
      }
    }
  }
}
