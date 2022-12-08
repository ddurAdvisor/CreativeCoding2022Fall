float t, n, T, C; 
void setup() {
  size(720, 720);
  clear();
  noStroke();
  colorMode(HSB);
} 
void draw() { 
  t+=.01; 
  for (n=0; n<20; n++) { 
    fill(n*12, 99, C=sin(T=n+t)%PI/2*510, C/2); 
    circle(sin(t+n*n)*99+noise(n, int(T/PI))*720, 30, cos(T%PI/2)*30);
  } 
  copy(0, 0, 720, 720, 0, 1, 720, 720);
}
