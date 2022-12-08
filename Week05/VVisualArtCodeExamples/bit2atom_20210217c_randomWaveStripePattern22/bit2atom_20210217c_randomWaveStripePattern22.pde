float x, y, t, S, P, f=1;
void setup() {
  size(720, 720);
  strokeWeight(3);
}
void draw() {
  clear();
  t+=.01;
  for (y=0; y<720; y+=90) {
    f=-f;
    for (x=-9; x<729; x+=9) {
      stroke((S=sq(sin((x+y)*.05*noise(y, x*.001+t*.05)*.5+t*f)))*999);
      line(x-9, y+(P=(pow(1-S, 8))*90), x+9, y+P+25);
    }
  }
}
