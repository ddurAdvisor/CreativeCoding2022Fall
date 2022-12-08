float t, r, d, a, S;
void setup() {
  size(1920, 1080);
  noStroke();
}
void draw() {
  clear();
  t+=pow(sin(a+=.03), 8)*.02;
  for (d=0; d<35; d++)
    for (r=0; r<TAU; r+=PI/3/d)
      arc(cos(S=r+d*sin(t))*d*15+960, sin(S)*d*15+540, 20, 20, r-sin(d+r-t)*PI/2, r+cos(d+r+t)*PI/2);
}
