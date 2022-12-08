float t, x, y, N, i;
void setup() {
  size(1920, 1080);
  stroke(-1, 8);
  fill(0, 16);
}
void draw() {
  square(0, 0, 1920);
  t+=.01;
  for (y=0; y<1080; y+=80)for (x=0; x<1920; x+=80)for (i=1; i<4; i++) {
    strokeWeight(i*i*5);
    line((N=int(noise(x, y, i+int(t))*4))%2*80+x, y, int(N/2)*80+x, y+80);
  }
}
