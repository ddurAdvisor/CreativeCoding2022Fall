float t, a, x, y, W;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  blendMode(DIFFERENCE);
  t+=sq(sin(a+=.05))*.05;
  for (y=0; y<780; y+=60)for (x=0; x<780; x+=60) {
    resetMatrix();
    translate(x, y);
    rotate(t);
    rect(-(W=noise(x, y, int(t/PI))>.5?sq(sin(t))*20+30:30), -W, W*2, W*2, 20);
  }
}
