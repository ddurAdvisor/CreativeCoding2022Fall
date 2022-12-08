int t, i;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  t++;
  float x=359, y=359, d=-t*.01, r=0, c=1;
  for (i=0; i<130321; i++) {
    fill(int((r/c)*128+sq(sin((i*.001+t)*.03))*128)|abs(128-t%255));
    square(x+=cos(d+=--r<0?TAU/7+(r=int(i/int(c+=.5)))*0:0)*2, y+=sin(d)*2, 7);
  }
}
