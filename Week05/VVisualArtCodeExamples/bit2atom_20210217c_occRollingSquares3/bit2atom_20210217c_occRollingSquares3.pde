float x, y, t, r, p, X, Y;
void setup() {
  size(720, 720);
  stroke(-1);
  fill(0, 9);
}
void draw() {
  square(-1, 0, 721);
  t+=.005;
  for (y=0; y<720; y+=4)
    for (x=0; x<720; x+=4) {
      p=noise(X=x*.01, Y=y*.01, t)*2;
      square(x+cos(r=noise(X, Y, t*.1)*TAU*9)*(p=p>1?p*4:0), y+sin(r)*p, p>0?p:0);
    }
}
