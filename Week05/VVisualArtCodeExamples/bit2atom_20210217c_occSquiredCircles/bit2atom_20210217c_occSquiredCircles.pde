float t, d, r, R, S;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.005;
  for (d=0; d<50; d++)for (r=0; r<d*6; r++) {
    fill(r%255, 160, 255, (S=sq(sin(R=d+r*PI/d/3+t)))*255);
    circle(1/cos(R)*d*6/tan(R+t)+360, 1/sin(R)*d*6/tan(R-t)+360, (1-S)*15);
  }
}
