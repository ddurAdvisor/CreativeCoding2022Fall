float x, y, z, t, Y; 
void setup() {
  size(720, 720, P3D);
} 
void draw() {
  clear();
  lights();
  t+=.5;
  for (z=-33; z<34; z+=6)for (y=-93; y<94; y+=6)for (x=-93; x<94; x+=6) {
    fill(z*4+128);
    resetMatrix();
    translate(x, Y=y+t%6, z-130+sin(Y*.05)*30);
    box(noise(x*.1, y*.1-int(t/6)*.6, z)>.6?6:0);
  }
}
