float x, y, t, N;
void setup() {
  size(1920, 1080);
  noStroke();
}
void draw() {
  clear();
  t+=.01;
  for (y=0; y<1126; y+=46)
    for (x=y/46%2*45; x<2010; x+=90) {
      resetMatrix();
      translate(x, y);
      rotate((N=noise(x, y, int(t/PI*2)))>.5?N>.6?t:-t:0);
      square(-25, -25, 50);
    }
}
