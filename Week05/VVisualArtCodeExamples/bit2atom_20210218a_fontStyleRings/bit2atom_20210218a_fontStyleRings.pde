float r, i, d; 
size(720, 720);
strokeWeight(2);
for (d=960; d>9; d-=80)for (r=0; r<TAU; r+=PI/d*5) {
  resetMatrix();
  translate(cos(r)*d/2+360, sin(r)*d/2+360);
  rotate(r+PI/2);
  for (i=0; i<random(3); i++) {
    line(0, 0, (int(random(3))-1)*7, (int(random(3))-1)*14);
    line(-4, -20, 4, -20);
  }
}
