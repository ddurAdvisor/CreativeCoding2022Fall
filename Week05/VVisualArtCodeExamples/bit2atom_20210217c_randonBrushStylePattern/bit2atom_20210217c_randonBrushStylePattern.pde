float t, T;
int N;
void setup() {
  size(720, 720);
  noStroke();
  clear();
}
void draw() {
  for (T=0; T<20; t+=.003, T++) {
    N=int(noise(int(t/TAU))*999);
    fill(N%25*9+64, 16);
    arc(acos(cos(t*(N%4+1))/(N%7+1))*720/PI, acos(sin(t*(N%5+1))/(N%6+1))*720/PI, N%9*9+9, N%8*9+9, t, t+.2);
  }
}
