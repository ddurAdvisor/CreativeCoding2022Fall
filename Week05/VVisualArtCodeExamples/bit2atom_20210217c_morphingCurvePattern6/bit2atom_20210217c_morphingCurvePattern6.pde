float r, d, t, R, N;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  t+=.004;
  blendMode(DIFFERENCE);
  for (d=0; d<300; d+=9) {
    for (r=0; r<TAU; r+=PI/7) {
      circle(cos(R=t+r+noise(r, d*.005, t))*(N=d*noise(r, R, t)*2)+360, sin(R)*N+360, (300-d)/9);
    }
  }
}
