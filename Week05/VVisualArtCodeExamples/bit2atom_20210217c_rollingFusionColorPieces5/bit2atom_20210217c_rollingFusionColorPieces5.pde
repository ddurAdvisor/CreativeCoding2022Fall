float t, x, y, d;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.01;
  for (d=90; d>0; d-=3)
    for (y=0; y<780; y+=60)
      for (x=y/60%2*30; x<780; x+=60) {
        fill(((x+y)*.1+t)%255, 255-d*2, d*4*sq(sin(x*4+y*4+t)));
        circle(x, y, 1.5*d*sin(x*2+y*2+t));
      }
}
