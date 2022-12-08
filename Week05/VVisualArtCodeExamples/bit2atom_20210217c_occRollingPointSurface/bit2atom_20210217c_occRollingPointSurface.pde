float t, r, c, R;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  clear();
  t+=.01;
  for (r=0; r<TAU*9; r+=.01) {
    fill(-1, sin(9*r-t*5)*128+128);
    circle(cos(r-t)*r*(9+tan(R=r-t*.02)*9)+360, sin(r-t)*r*(9+.005*tan(R)*999)+360, sin(R)*r/2);
  }
}
