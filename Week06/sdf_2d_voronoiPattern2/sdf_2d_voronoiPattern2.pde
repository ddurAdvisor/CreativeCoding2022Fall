int n=50, i, j, k;
float a[]=new float[n*4], d, m;

void setup() {
  size(800, 800);
  for (i=0; i<n*2; i++) {
    a[i]=random(800);
    a[i+n*2]=1-random(2);
  }
}

void draw() {
  background(-1);
  for (i=0; i<800; i++) {
    for (j=0; j<800; j++) {
      m=1e5;
      for (k=0; k<n; k++) {
        d=dist(i, j, a[k], a[k+n]);
        if (d<m) {
          m=d;
        }
      }
      stroke(m);
      point(i, j);
    }
  }
  for (i=0; i<n*2; i++) {
    a[i]+=a[i+n*2];
    if (a[i]<0||a[i]>800) {
      a[i+n*2]*=-1;
    }
  }
}
