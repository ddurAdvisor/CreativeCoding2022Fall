float t, x, A;
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
}
void draw() {
  clear();
  t+=.002;
  for (x=0; x<720; x++) {
    fill(((A=x*.05+t)*50)%255, 192, 255, 96);
    arc(x, sin(x*.01+t)*99/sin(sin(x+t)+A)+360, 9+sq(sin(A/2))*30, 9+sq(sin(A/2))*30, A-PI, A);
  }
}
