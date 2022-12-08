float t, n, T, C; 
void setup() {
  size(720, 720);
  clear();
  stroke(-1);
  fill(0, 8);
} 
void draw() { 
  t+=.003; 
  square(-1, -1, 720); 
  for (n=0; n<99; n++)  circle(noise(n, t)*720+(C=cos(T=(n+t)%(PI/2))*500), noise(n, t, 9)*720+C, sq(9*cos(T))); 
  copy(0, 0, 720, 720, 1, 1, 720, 720);
}
