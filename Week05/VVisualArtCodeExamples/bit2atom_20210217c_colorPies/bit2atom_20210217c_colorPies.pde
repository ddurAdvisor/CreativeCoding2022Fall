float t, x, y, R;
void setup() {
  size(720, 720);
  clear();
  noStroke();
  colorMode(HSB);
}
void draw() {
  t+=.05;
  for (y=0; y<800; y+=70) {
    for (x=y/70%2*40; x<800; x+=80) {
      fill(noise(x, y, t/9)*765%255, 99, t*99%255+99);
      arc(x, y, 80, 80, R=x+y+t, R+.06);
    }
  }
}
