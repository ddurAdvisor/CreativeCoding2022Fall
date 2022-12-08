float x, y, d, R, t, D, P=PI/4;
void setup() {
  size(720, 720);
  fill(96, 255, 160);
}
void draw() {
  clear();
  t+=.02;
  for (x=0; x<780; x+=60)
    for (y=0; y<720; y++)
      for (d=P; d<(y%9==0?PI*.8:0); d+=P)
        arc(sin(R=(x/60*PI+y*.05))*20+x, y, 25, 25, (D=sin(R-PI/2+t+(x+y)*.01)*.5+d)-P/4, D+P/4);
}
