float t, r, d, N, T;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  clear();
  t+=.005;
  for (d=0; d<60; d++)
    for (r=0; r<TAU-.01; r+=PI/3/d) {
      fill(-1, 500/(T=pow(tan(PI/4+t+(N=noise(d, sin(r), t))), 4)*9));
      circle(cos(r)*d*(9+T)+360, sin(r)*d*(9+T)+360, T+9);
    }
}
