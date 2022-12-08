float i, x, y, m=250, I;
void setup() {
  size(500, 500);
  for (noStroke(); i<6; i+=.57) {
    fill(x=y=m, 0, 0);
    e(150, 70);
    if (r(2)<3) {
      fill(m);
      e(5, 25);
      fill(0, 0, m);
      e(3, 9);
    }
  }
}
float r(int i) {
  return random(i)+i;
}
void e(int d, int s) {
  ellipse(x+=d*cos(I=s==70?i:r(3)), y+=d*sin(I), r(s), r(s));
}
