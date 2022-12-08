float x, y, z, t, Z;
void setup() {
  size(720, 720, P3D);
}
void draw() {
  clear();
  t+=.01;
  for (z=-63; z<64; z+=6)for (y=-63; y<64; y+=6)for (x=-63; x<64; x+=6) {
    resetMatrix();
    fill(z*2+128);
    translate(x, y+tan(Z=z*.01+t)*9, z-200);
    box(noise(x*.02, y*.02, z*.01+int((Z+PI/2)/PI))>.5?6:0);
  }
}
