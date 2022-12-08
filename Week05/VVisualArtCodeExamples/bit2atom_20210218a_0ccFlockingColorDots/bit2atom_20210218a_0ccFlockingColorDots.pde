float t, r, R, T; 
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
} 
void draw() {
  t+=.005; 
  blendMode(BLEND);
  fill(0, 9);
  square(0, 0, 720); 
  blendMode(ADD); 
  for (r=0; r<50; r+=.2) {
    fill(r*5, 99, 255, 2550/(T=-r*9*tan(r+t))); 
    circle(cos(r*r+t)*T+360, sin(r-t)*T+360, T/7+5);
  }
}
