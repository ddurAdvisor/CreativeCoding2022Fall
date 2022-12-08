float r, d, t, X, Y, D, l, a, C, S;
void setup() {
  size(720, 720);
  stroke(-1);
}
void draw() {
  clear();
  t+=sq(sin(a+=.05))*.01;
  for (d=1; d<9; d++)for (r=0; r<7; r+=PI/3/d)for (l=0; l<6; l++)line((X=cos(r)*d*60+360)+(C=cos(D=sin(d+t)*l+r+t)*30), (Y=sin(r)*d*60+360)+(S=sin(D)*30), X-C, Y-S);
}
