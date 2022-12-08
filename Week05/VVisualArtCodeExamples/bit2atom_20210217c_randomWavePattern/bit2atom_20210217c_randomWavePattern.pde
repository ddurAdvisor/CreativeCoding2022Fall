float t, r, d, N;
void setup() {
  size(720, 720);
  stroke(-1);
}
void draw() { 
  clear();
  t+=.01;
  for (r=0; r<7; r+=PI/2) {
    resetMatrix();
    translate(cos(r)*300+360, sin(r)*300+360);
    rotate(r+PI/2+PI/4);
    for (d=0; d<424; d+=3)line(d, 0, d+(N=noise(d*.01+t))*99, sin(t+d/424*TAU)*200*N);
  }
}
