int t, r, d;
void setup() {
  size(720, 720);
  noFill();
  colorMode(HSB);
}
void draw() {
  clear();
  t++;
  for (d=0; d<115; d++) {
    for (r=0; r<628; r++) {
      if (abs(((d+r+t)%510)-255)+(~d+~r)%255>(d^r)%255) {
        stroke((d^r+t)%255, 255, 255);
        arc(360, 360, d*9, d*9, r*.01, r*.01+.01);
      }
    }
  }
}
