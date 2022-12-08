float x, y, X, Y, R;
size(1280, 1280);
clear();
for (y=-30; y<1310; y+=3) {
  for (x=-30; x<1310; x+=3) {
    stroke(128+random(128), 128+random(128), 128, 32);
    R=noise(x*.01, y*.01)*TAU;
    bezier(X=x+cos(R)*30, Y=y+sin(R)*30, x, y, x, y, X, Y);
  }
}
