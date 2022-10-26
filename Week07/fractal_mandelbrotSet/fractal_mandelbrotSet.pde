double r, i, a, b, t, s=9, x, y;
int n;

void setup() {
  size(400, 400);
}

void draw() {
  clear();
  for (x=0; x<400; x++) {
    for (y=0; y<400; y++) {
      r=i=n=0;
      a=(x-200)/s-.545;
      b=(y-200)/s-.5345;
      while ((r*r+i*i<4)&&n<255) {
        t=r*r-i*i+a;
        i=2*r*i+b;
        r=t;
        n++;
      }
      stroke(n);
      point((float)x, (float)y);
    }
  }
  s*=1.2;
}
