float r, S, R, x, y;
size(1920, 1080);
noStroke();
clear();
for (y=0; y<1170; y+=90)
  for (x=-y/90%3*30; x<2010; x+=90)
    for (r=0; r<TAU*3; r+=.1) {
      fill(64, 255, 64, 160);
      arc(x, y, S=sq(r%TAU-PI)*9, S, R=(x+y)*.1+r+int(r/TAU)*TAU/3, R+.1);
      fill(160, 64, 64);
      circle(x, y, 9);
    }
