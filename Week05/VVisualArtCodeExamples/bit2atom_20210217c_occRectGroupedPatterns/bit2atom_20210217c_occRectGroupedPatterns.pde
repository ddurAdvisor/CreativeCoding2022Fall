int t, x, l, T;
float X, Y;
void setup() {
  size(720, 720);
}
void draw() {
  if ((T=t++%55)<15)copy(get(), 0, 0, 720, 720, T, T, T=720-2*T, T);
  else {
    for (l=0; l<4; l++)for (x=0; x<640; x+=80)line(X=(l%3==0?40:680)+cos(l*PI/2)*x, Y=(l<2?40:680)+sin(l*PI/2)*x, X+cos(X=t*.1+x)*38, Y+sin(X)*38);
  }
}
