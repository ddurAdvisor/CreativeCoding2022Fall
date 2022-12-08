float t, r, d, N;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  blendMode(DIFFERENCE);
  t+=.02;
  for (r=0; r<TAU; r+=PI/8)for (d=0; d<160; d+=5)circle(cos(r+(N=d*d*(noise(r, t/9)-.5)*.0001))*d*(sin(N)+2)+360, (sin(r+N))*d*(sin(N)+2)+360, sin(r+d*.05-t)*40*cos(d*.04+N));
}
