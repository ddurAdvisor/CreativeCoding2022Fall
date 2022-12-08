int t, i;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  t++;
  float x=359, y=359, d=0, r=0, c=1;
  for (i=0; i<130321; i++) {
    fill(int((r/c+i*.00001+t*.01)*255)&(int(i*.005+t*.5)%255));
    square(x+=cos(d+=--r<0?TAU/5+(r=int(i/int(c+=.5)))*0:0)*2, y+=sin(d)*2, 4);
  }
}
