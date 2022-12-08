float i, x=1, y=1, tx, C=4000000;
size(1920, 1080);
clear();
for (i=0; i<C*2; i++) {
  stroke(i>C?0x10A0C0FF:0x0AC08040);
  tx=i>C?cos(x+y)/y*3*sin(y*sin(y)):cos(x*y)/y/.8;
  y=i>C?tan(y)-sin(x)/y:sin(x+y)+cos(x)/y;
  point((x=tx)*(i>C?200:200)+960, y*200+540);
}
