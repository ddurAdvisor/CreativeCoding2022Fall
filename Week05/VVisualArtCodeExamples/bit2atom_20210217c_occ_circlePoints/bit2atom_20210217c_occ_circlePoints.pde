float t, x, y, r, N;
void setup() {
  size(720, 720);
  noStroke();
}
void draw() {
  clear();
  t+=.003;
  for (y=0; y<780; y+=60)for (x=0; x<780; x+=60)
    for (r=0; r<TAU; r+=PI/16) {
      fill(-1, cos(r*8)*255);
      circle(cos(r+(N=noise(x, y, int(t/PI*4))>.5?sin(t*2)*PI/4:0))*60+x, sin(r+N)*60+y, 18);
    }
}
