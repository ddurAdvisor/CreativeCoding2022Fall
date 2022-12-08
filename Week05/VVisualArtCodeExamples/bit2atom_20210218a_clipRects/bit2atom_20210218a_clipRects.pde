float t, x, y, F; 
void setup() {
  size(720, 720);
  noStroke();
} 
void draw() {
  background(99);
  t+=.01; 
  for (y=0; y<1440; y+=60)for (x=0; x<1440; x+=60) {
    push(); 
    fill(x+y>1440?-1:0); 
    clip(x%750, y%750, 30, 30); 
    translate(360, 360); 
    rotate(x+y>1440?t:-t); 
    square(-260, -260, 520);
    pop();
  }
}
