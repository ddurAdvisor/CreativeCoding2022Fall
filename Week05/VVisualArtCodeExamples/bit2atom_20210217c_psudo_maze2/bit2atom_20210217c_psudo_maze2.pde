int t;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  t++;
  float x=357, y=357, d=0, r=0, c=1, T=t/20;
  for (int i=0; i<121*121; i++) {
    fill((i*i/T)%255);
    square(x+=cos(d+=--r<0?PI/2+(r=int(i/int(c+=.5)))*0:0)*6, y+=sin(d)*6, 6);
  }
}
