float x, y, d, t, a, S, D, F=1;
void setup() {
  size(720, 720);
}
void draw() {
  t+=pow(sin(a+=.03), 4)*.1;
  for (x=0; x<780; x+=60)
    for (y=(x/60)%2*45-90; y<810; y+=90) {
      stroke((S=sin(t+noise(x, t*.1)*9))*255, 99);
      for (d=0; d<56; d+=8)
        line(x-(D=d*S*(F=-F)), y, x+D, y+90);
    }
}
