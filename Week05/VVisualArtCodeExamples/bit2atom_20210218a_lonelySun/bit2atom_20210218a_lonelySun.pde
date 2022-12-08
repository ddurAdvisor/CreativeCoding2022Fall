float n;

void setup() {
  size(500, 400);
  noStroke();
  background(90, 100, 110);
  blendMode(ADD);
  for (int y = 0; y < 200; y ++) {
    for (int x = 0; x < 250; x ++) {
      n=noise(x*.001, y*.01)-.3;
      fill(130, 90+y*.3, 50, n*500);
      square(x*2, y*2, 2);
      fill(200, 0, 0);
      circle(320, 170, 20);
    }
  }
}
