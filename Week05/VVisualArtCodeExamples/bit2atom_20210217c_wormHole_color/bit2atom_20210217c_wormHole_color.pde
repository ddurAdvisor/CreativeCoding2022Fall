float r, d;
size(1920, 1080);
colorMode(HSB);
blendMode(ADD);
noStroke();
clear();
for (d=999; d>0; d-=3) {
  fill((d/3)%255, 128, 255, 64);
  beginShape(TRIANGLE_STRIP);
  for (r=d; r<=TAU+d; r+=PI/32)
    vertex(cos(r)*(d+noise(r, d)*d)+960, sin(r)*(d+noise(r, d)*d)+540);
  endShape();
}
