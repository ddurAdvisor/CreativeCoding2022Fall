int t, x, y, a=-90, b=-a;
void setup() {
  size(720, 720);
}
void draw() {
  stroke(0, t%255);
  curve(0, 0, cos(++t*.04)*90+90, sin(t*.03)*90+90, tan(t*.01)*99, -tan(t*.03)*99, 180, 180);
  for (y=0; y<720+(b=-b); y+=180)for (x=0; x<720; x+=180)copy(0, 0, 180, 180, x+90-(a=-a), y+90-b, a*2, b*2);
}
