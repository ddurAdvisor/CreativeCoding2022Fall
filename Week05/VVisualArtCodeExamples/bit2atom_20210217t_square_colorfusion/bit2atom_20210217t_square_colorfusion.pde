float x, y, t, a, S;
void setup() {
  size(720, 720);
  colorMode(HSB);
  noStroke();
}
void draw() {
  t+=.005;
  for (y=0; y<800; y+=80)for (x=0; x<800; x+=80) {
    fill(((S=pow(sin((t+(a=(x*2+y)/80))*2), 9)*40)+x+y)%255, 160, 255, 64);
    square(x+((t+a)%TAU<PI?S:-S), y+((t+a)%TAU>PI?S:-S), S*2);
  }
}
