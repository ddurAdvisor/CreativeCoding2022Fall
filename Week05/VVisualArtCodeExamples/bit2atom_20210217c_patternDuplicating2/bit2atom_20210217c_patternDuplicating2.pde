float t, i;
void setup() {
  size(720, 720);
  noFill();
  stroke(0, 99);
}
void draw() {
  t+=.03;
  for (i=0; i<9; i++) {
    if ((t+i)%7>TAU)
      copy(0, int(i*90-45), 720, 90, -int((t+i)%7), int(i*90-45), 720, 90);
    circle(cos(t*2+i)*65+630, sin(t*(i%4+1)+i)*35+90*i, 19*sin(t*.9+i));
  }
}
