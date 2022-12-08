int t, i, j;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  clear();
  t++;
  float[]a={360, 360, 360, 360, 360, 360};
  for (i=99; i>0; i--)
    for (j=0; j<3; j++) {
      fill(255-i*2);
      circle(a[j*2]+=(noise(i*.01+t*.01, j)-.5)*12, a[j*2+1]+=(noise(i*.01+t*.01, 9, j)-.5)*12, i);
    }
}
