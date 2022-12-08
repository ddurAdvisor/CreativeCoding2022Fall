float r, d, t, b;
void setup() {
  size(1920, 1080);
  noStroke();
  fill(-1, 64);
}
void draw() {
  clear();
  t+=.01;
  for (d=0; d<900; d++)
    for (r=0; r<TAU; r+=.1)
      circle(cos(r+(b=bezierTangent(0, sin(r*r-t)*99, 0, sin(r*r+t+d/99)*d/8, d/1800)*.01))*d+960, sin(r-b)*d+540, 2);
}
