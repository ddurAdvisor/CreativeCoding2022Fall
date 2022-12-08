float t, d, r, D;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.01;
  for (d=30; d<720; d+=30)
    for (r=0; r<TAU; r+=PI/d) {
      fill((d/3+r*40)%255, 192, 255, 32);
      circle(cos(r)*(D=d+sin(d/2+r*5+t)*30)+360, sin(r)*D+360, pow(sin(d+t), 4)*40);
    }
}
