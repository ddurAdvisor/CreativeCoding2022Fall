float r, d, t, N;
void setup() {
  size(720, 720);
  stroke(-1);
  fill(0, 4);
}
void draw() {
  square(0, 0, 721);
  t+=.01;
  for (d=0; d<7; d++)
    for (r=0; r<PI/4; r+=.01)
      circle(pow(cos(r*r+t+(N=noise(r, d, t*.01)*9)), 3)*cos(t)*360+360, pow(sin(r*r+t-N), 3)*sin(t)*360+360, 1);
}
