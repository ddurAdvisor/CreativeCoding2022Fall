int T, t, x, y, a, b, O;
void setup() {
  size(720, 720);
}
void draw() {
  a=-30;
  b=-a;
  bezier(cos((T=int(++t/5))*.02)*30+30, sin(T*.01)*30+10, 10, 10, 50, 50, tan(T*.02)*9, tan(T*.03)*9);
  for (y=O=-T%255; y<780+(b=-b); y+=60)for (x=O; x<780; x+=60)copy(0, 0, 60, 60, x+30-(a=-a), y+30-b, a*2, b*2);
}
