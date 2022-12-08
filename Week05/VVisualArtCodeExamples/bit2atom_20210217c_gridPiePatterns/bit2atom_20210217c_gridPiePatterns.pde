float x, y, l, t, R;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  fill(0, 16);
  square(0, 0, 720);
  fill(-1, 8);
  t+=.01;
  for (y=0; y<780; y+=52)
    for (x=-y/52%2*30; x<780; x+=60)
      for (l=0; l<6; l++)
        arc(x, y, 60, 60, R=int(noise(int(t))*999*l+x/60+y/52)%12*PI/3, R+PI/3);
}
