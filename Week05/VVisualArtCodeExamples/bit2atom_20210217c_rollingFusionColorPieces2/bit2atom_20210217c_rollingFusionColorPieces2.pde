float d, r, t, R, L;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.01;
  for (d=90; d>0; d-=3)
    for (r=0; r<TAU; r+=PI/16) {
      fill(r*40, 255-d*2, d*3);
      circle(cos(R=r-d*(sin(3*r+5*t)*.005))*(L=250+sin(5*r+3*t)*50)+360, sin(R)*L+360, d);
    }
}
