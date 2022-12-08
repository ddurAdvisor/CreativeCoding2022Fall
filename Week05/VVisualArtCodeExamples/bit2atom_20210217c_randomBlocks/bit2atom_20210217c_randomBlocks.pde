float x, y;
void setup() {
  size(720, 720);
}
void draw() {
  fill(0, 2);
  square(0, 0, 721);
  translate(x=(x+(int(random(2))*2-1)*18+720)%720, y=y%720+9);
  fill(#4040FF);
  quad(0, 0, 18, -9, 36, 0, 18, 9);
  fill(#C0C0FF);
  quad(0, 0, 18, 9, 18, 27, 0, 18);
  fill(#1010FF);
  quad(18, 9, 36, 0, 36, 18, 18, 27);
}
