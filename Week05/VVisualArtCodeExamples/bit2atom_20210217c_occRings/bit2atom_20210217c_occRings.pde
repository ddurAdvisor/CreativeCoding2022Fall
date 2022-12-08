float t, i, R, M, N;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  fill(0, 32);
  square(0, 0, 721);
  fill(255);
  t+=.003;
  M=1;
  N=1;
  for (i=1; i<271; i++) {
    circle(cos(R=i*TAU/(i>M*6?(M+=++N)*0+N*6:N*6)*(1-pow(sin(i/N/90+t), 4)))*N*40+360, sin(R)*N*40+360, 35);
  }
}
