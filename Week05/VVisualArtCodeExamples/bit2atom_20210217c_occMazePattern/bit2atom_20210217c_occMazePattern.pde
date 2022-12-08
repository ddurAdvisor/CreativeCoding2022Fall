float x, y, t, R, N, C, S;
void setup() {
  size(720, 720);
  stroke(-1);
}
void draw() {
  clear();
  t+=.01;
  for (y=0; y<800; y+=60)for (x=0; x<800; x+=60)line(x+(C=cos(R=PI/4+((N=int(noise(x, y, int(t))*8))+(int(noise(x, y, int(t)+1)*8)-N)*pow(t%1, 4))*PI/2)*42), y+(S=sin(R)*42), x-C, y-S);
}
