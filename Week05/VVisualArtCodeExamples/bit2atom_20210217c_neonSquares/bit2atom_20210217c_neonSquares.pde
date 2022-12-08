int x, y, t, a;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  t++;
  for (y=-22; y<23; y++) {
    for (x=-22; x<23; x++) {
      fill(f(0), f(5), f(9), 4);
      square((x+22)*16, (y+22)*16, 16);
    }
  }
}
int f(int i) {
  return (a=abs(x)+abs(y))%int(1+noise(a, int(t/99), i)*9)*25;
}
