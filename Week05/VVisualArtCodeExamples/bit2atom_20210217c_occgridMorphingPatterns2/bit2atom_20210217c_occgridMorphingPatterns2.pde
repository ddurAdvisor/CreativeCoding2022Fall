float x, y, d, t, N;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  clear();
  t+=.01;
  for (y=0; y<810; y+=90)
    for (x=0; x<810; x+=90)
      for (d=0; d<TAU; d+=PI/8)
        curve(x, y, x+cos(d+t+(N=noise(x, y, t*.1)*50))*N, y+sin(d+t-N)*N, x-cos(d-t-N)*N, y-sin(d-t+N)*N, x, y);
}
