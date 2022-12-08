float t, r, n, x, i; 
void setup() {
  size(720, 720, P3D);
} 
void draw() {
  clear();
  t+=.2;
  for (i=0; i<30; i++) {
    fill((i+t%1)*8);
    for (r=0; r<TAU; r+=PI/32) {
      resetMatrix();
      translate(x+cos(r+t)*99+(n=noise((int)(i-t)*.03)*300-150), sin(r+t)*99, -330+i*9+t%1*9);
      box(9);
    }
  }
  x-=(n+x)/20;
}
