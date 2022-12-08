float x, z, t, N=990;
void setup() {
  size(720, 720, P3D);
}
void draw() {
  clear();
  t+=.01;
  lights();
  for (z=-N; z<N; z+=40)for (x=-N; x<N; x+=40) {
    resetMatrix();
    camera(cos(t/2)*N, sin(t)*99, sin(t)*N, 99, 99, 0, 0, 1, 0);
    translate(x, 180, z);
    rotateY(noise(x, z)>.5?PI/4:-PI/4);
    box(58, 58, 3);
  }
}
