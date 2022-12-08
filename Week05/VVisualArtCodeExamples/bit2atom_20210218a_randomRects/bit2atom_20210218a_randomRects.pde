void setup() {
  size(500, 500);
  stroke(-1);
  noFill();
  clear();
  r(0, 0, 500, 500, 1);
} 
void r(int x, int y, int w, int h, int v) { 
  if (w>9&h>9) { 
    int W=v>0?w/int(random(2)+2):w, H=v<0?h/int(random(2)+2):h; 
    rect(x, y, w, h);
    r(x, y, W, H, -v);
    r(x+W, y+H, v>0?w-W:w, v<0?h-H:h, -v);
  }
}
