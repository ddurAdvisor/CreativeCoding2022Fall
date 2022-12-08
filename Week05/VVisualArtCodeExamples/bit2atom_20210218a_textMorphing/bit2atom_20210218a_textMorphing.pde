PFont font;
int t, x; 

void setup() {
  size(720, 720);
  font = createFont("微软雅黑", 24);
  textSize(80);
} 
void draw() { 
  clear(); 
  t++; 
  textFont(font);
  textSize(60);
  text("秋雨意悠然 怡静心万里", 50, 400); 
  for (x=0; x<720; x++) copy(x, 0, 1, 720, x, -int(min(pow(tan((x-t+99*noise(x))*.003), 16)*9, 200)*sin((x-t)*.006)), 1, 720);
}
