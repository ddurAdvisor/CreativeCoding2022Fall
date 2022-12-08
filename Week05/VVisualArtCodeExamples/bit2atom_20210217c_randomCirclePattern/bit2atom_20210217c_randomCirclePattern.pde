float d, Y, r, i=int(random(99));
size(720, 720);
fill(-1, 24);
noStroke();
clear();
for (r=0; r<TAU; r+=PI/99) {
  resetMatrix();
  translate(cos(r)*240+360, sin(r)*240+360);
  rotate(r+(i%5+1));
  Y=0;
  for (d=0; d<400; ) {
    circle(++d, Y+=tan((i%8+1)*r+d*TAU/99), 5);
  }
}
