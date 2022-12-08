float t, x, y, d;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  t+=.004;
  for (d=90; d>0; d-=3)
    for (y=0; y<760; y+=40)
      for (x=y/40%2*20; x<760; x+=40) {
        fill((x+y)%255, d*3, 255-d*3);
        circle(x+noise(x+y, d*.01, t)*99-50, y+noise(d*.01, x*y, t)*99-50, d);
      }
}
