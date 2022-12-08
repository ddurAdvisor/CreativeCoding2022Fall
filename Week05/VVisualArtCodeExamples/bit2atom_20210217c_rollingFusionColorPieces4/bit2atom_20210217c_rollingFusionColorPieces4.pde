float x, y, d, t;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.004;
  for (d=90; d>0; d-=3)
    for (y=0; y<770; y+=50)
      for (x=y/50%2*30; x<780; x+=60) {
        fill((x+y)%255, d*3, sin(x*y+t*3)*255-d*2);
        circle(x, y, 2*d*sin(x*y-t));
      }
}
