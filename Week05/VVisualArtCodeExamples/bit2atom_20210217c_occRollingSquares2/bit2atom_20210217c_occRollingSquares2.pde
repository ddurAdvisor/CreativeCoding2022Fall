float t, i, a, S, W;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  blendMode(DIFFERENCE);
  t+=pow(sin(a+=.03), 4)*.02;
  for (i=0; i<169; i++) {
    resetMatrix();
    translate(i%13*60, int(i/13)*60);
    rotate(S=noise(i, int(t/PI))>.5?t:0);
    rect(W=-30-sq(sin(S))*15, W, S=-W*2, S, 9);
  }
}
