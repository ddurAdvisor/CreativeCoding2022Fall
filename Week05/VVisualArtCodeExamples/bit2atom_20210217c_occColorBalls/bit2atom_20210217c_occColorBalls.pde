float x, y, d, t;
void setup() {
  size(720, 720);
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.01;
  noStroke();
  for (d=90; d>0; d-=3)
    for (y=0; y<800; y+=80)
      for (x=0; x<800; x+=80) {
        fill((2*x+3*y)%255, 255, d*3);
        circle(x+cos(x+y+t)*d/3, y+sin(x+y-t)*d/3, d);
      }
}
