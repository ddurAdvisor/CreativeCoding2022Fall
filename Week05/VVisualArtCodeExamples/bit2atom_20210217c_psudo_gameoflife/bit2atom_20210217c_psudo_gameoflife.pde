int x, y, t, T, C, X, Y;
void setup() {
  size(720, 720);
}
void draw() {
  clear();
  scale(6);
  T=(++t)/6;
  for (y=0; y<120; y++) {
    for (x=0; x<120; x++) {
      stroke(((((X=x%64)%(T/64+1)))^(X^(Y=y%64))^((Y%(T/64+3))))>T%64?(C=(T%128)/64-1):C*C-1);
      point(x, y);
    }
  }
}
