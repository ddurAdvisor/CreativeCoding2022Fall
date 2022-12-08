float t, x, y, N, d, a;
void setup() {
  size(1920, 1080);
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.001;
  for (y=0; y<1080; y+=90)for (x=y/90%3*10; x<1920; x+=90)for (d=0; d<80; d+=3) {
    stroke((x+y)%255, a=abs(40-d)*6, 350-a);
    line(x-(N=sin(t*9+noise(x, y, t)*d)*40), y+d, x+N, y+d);
  }
}
