int t, T, x, y;
void setup() {
  size(720, 720);
  noStroke();
  rectMode(CENTER);
}
void draw() {
  clear();
  T=(t++/60)%96;
  for (y=0; y<241; y++) {
    for (x=0; x<241; x++) {
      square(x*3, y*3, ((((int(abs(120-x))&int(abs(120-y)))^T)%95))>T?abs(30-t%60)/10:3);
    }
  }
}
