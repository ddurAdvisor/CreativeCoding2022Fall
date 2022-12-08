float t, x, y, R;
void setup() {
  size(720, 720);
  noStroke();
  rectMode(CENTER);
}
void draw() {
  fill(0, 9);
  square(360, 360, 720);
  fill(-1);
  t+=.01;
  for (y=0; y<780; y+=30)
    for (x=-y/30%2*30; x<780; x+=60) {
      arc(x, y, pow(cos(x*y+t), 8)*400, pow(sin(x*y+t), 8)*400, R=x+y+t, R+PI);
    }
}
