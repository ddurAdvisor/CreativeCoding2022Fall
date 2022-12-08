int i, t, H=720;
void setup() {
  size(720, 720);
}
void draw() {
  if ((t++%120)<1) {
    background(-1);
    for (i=-2; i<random(4); i++)
      bezier(random(H), random(H), random(H), random(H), random(H), random(H), random(H), random(H));
    copy(0, 0, 360, H, H, 0, -360, H);
    copy(0, 0, H, 360, 0, H, H, -360);
  }
}
