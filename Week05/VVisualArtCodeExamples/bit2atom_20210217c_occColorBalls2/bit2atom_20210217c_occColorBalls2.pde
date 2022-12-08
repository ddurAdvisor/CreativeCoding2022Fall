float t, d, x, y, E=360;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.01;
  for (d=90; d>0; d-=3)
    for (y=-E; y<=E; y+=60)
      for (x=-E; x<=E; x+=60) {
        fill((x*x+y*y)%255, 192, 255-d*3);
        circle(x+cos(x*y*4+t)*d/3+E, y+sin(x*y*4+t)*d/3+E, d);
      }
}
