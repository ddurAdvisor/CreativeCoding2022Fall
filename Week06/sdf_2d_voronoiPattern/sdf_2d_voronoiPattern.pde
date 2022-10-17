int n=50, i, j, k;
float a[]=new float[n*2], d, m, t=1;

void setup() {
  size(800, 800);
  for (i=0; i<n*2; i++) {
    a[i]=random(800);
  }
}

void draw() {
  clear();
  for (i=0; i<800; i++)for (j=0; j<800; j++) {
    m=1e5;
    for (k=0; k<n; k++) {
      m=(d=dist(i, j, a[k], a[k+n]))<m?d:m;
    }
    stroke(0, m*t, 0);
    point(i, j);
  }
  t+=.02;
}
