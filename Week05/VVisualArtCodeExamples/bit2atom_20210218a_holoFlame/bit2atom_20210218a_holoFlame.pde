float t, r, T; 
void setup() {
  size(720, 720);
  noStroke();
  colorMode(HSB);
} 
void draw() {
  blendMode(BLEND);
  fill(0, 9);
  square(0, 0, 720); 
  t+=.01; 
  blendMode(ADD); 
  for (r=0; r<TAU*9; r+=.01) { 
    fill(r*5, 99, 255, 16); 
    circle(sin(noise(r, t)*3+t)*cos(r+t)*r*9+360, tan(r-t)*r*9+360, 5);
  }
}
