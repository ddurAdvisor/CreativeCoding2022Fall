float x, y, t, N;
void setup() {
  size(720, 720);
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.05;
  for (y=0; y<760; y+=40)for (x=0; x<760; x+=40) {
    fill((noise(x, y)*765)%255, 255, 255);
    ellipse(x, y+pow(tan((N=noise(x, y, int((x+y+t)/PI)))>.6?x+y+t:0), 8)*9, 35*cos(N>.6?x+y+t:0), 35);
  }
}
