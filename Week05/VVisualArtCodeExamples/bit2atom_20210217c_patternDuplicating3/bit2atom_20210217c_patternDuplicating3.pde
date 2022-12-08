float t, i, I;
void setup() {
  size(720, 720);
  fill(0);
}
void draw() {
  t+=.04;
  if (t%7+.28>TAU)
    copy(0, 0, 720, 720, -6, 0, 720, 720);
  else {
    for (i=0; i<20; i++)
      circle(cos(t*int(noise(i, int(t/7))*6))*(I=4-i%4)*9+i%4*150+230, sin(t*int(noise(i, 9)*6))*I*9+int(i/4)*144+72, 1);
  }
}
