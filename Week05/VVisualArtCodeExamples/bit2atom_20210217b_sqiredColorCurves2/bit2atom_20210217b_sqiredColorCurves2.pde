float i, x=1, y=1, z=99, tx, ty;
size(1920, 1080);
colorMode(HSB);
clear();
for (i=0; i<9000000; i++) {
  tx=cos(x*y)/y+cos(x)*.3;
  ty=sin(x)+cos(y)+sin(z)*.3;
  z=sin((x+y-tan(z))/9);
  stroke((z*255+255)%255, 255, 255, 8);
  point((x=tx)*300+960, (y=ty)*300+540);
}
