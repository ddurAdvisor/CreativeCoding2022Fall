import peasy.*;
PeasyCam cam;

float r, i, t, x, y, n, d=400, k=0;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100);
}

void draw() {
  background(-1);
  for (x=-d; x<d; x++)for (y=-d; y<d; y++) {
    r=i=n=0;
    while ((r*r+i*i<4)&&n<d) {
      t=r*r-i*i+x/d-1;
      i=2*r*i+y/d;
      r=t;
      n++;
    }
    stroke(n);
    point(x, y, -n*k);
  }
  k+=.01;
}
