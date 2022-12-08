float r, D;
size(1920, 1080);
clear();
for (r=9; r<TAU*45; r+=.05-r*.00016) {
  textSize(r/9+5);
  resetMatrix();
  translate(cos(r)*(D=r*(6+sin(r*6)))+960, sin(r)*D+540);
  rotate(r+PI/2);
  text(int(r*r)%10, -r/25, 0);
  scale(-1, 1);
  text(int(r*r)%10, -r/25, 0);
}
