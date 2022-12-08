float t, x, y, d, A, D;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.02;
  for (d=90; d>0; d-=3)for (y=0; y<765; y+=45)for (x=0; x<765; x+=45) {
    fill((x+y)%255, d*3, 255-d*2, d);
    arc(x+cos(y-t)*(D=99-d), y+sin(y-t)*D, d, d, A=(x+y)*.01+t, A+2*sin(y-t));
  }
}
