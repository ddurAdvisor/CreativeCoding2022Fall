float t, N, x, y, T;
void setup() {
  size(1920, 1080);
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.005;
  for (y=0; y<1080; y+=40)
    for (x=-y/40%2*40; x<1920; x+=80) {
      fill((N=noise(x, y))*765%255, 192, 255, (1-sq(T=tan((x+y)*t*.005+N+t)))*255);
      rect(x, y+pow(T, 5)*99, 80, 40);
    }
}
