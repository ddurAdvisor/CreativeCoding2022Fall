float x, y, r, t, a, N;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  clear();
  t+=pow(sin(a+=.04), 4)*.04;
  for (y=0; y<810; y+=90)for (x=0; x<810; x+=90)for (r=0; r<TAU; r+=PI/4)bezier(x+cos(N=t+noise(x, y, t*.1)*9+r)*40, y+sin(N)*40, x, y, x, y, x-cos(t+r)*40, y-sin(t+r)*40);
}
