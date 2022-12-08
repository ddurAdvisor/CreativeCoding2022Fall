float t, x, y, d;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.003;
  for (d=90; d>0; d-=3)
    for (y=0; y<780; y+=60)
      for (x=y/60%3*20; x<780; x+=60) {
        fill((x+y)%255, 255-d*2, d*3);
        circle(x+tan(y+t)*99, y+tan((x+y)*.01+t)*90, d);
      }
}
