class Partcile {
  PVector pos;
  float d = 5;
  color pColor;

  Partcile(PVector p) {//构造函数
    pos = p;
    pColor = color(random(255), random(255), random(255));
  }

  void run() {
    edgeCross();
    move();
    //edgeCross();
    show();
  }

  void show() {
    fill(pColor);
    noStroke();
    ellipse(pos.x, pos.y, d, d);
  }

  void move() {
    int indeX = floor(pos.x/cellSize); //x = 25.3 -> floor(x) = 25
    int indeY = floor(pos.y/cellSize);
    PVector force = gridVector[indeX][indeY];//gridVector[-1][20]//gridVector[0->row-1][0->col-1]
    pos.add(force);
  }
  
  void edgeCross(){
    if(pos.x < d/2) pos.x = width-d/2;
    if(pos.x > width-d/2) pos.x = d/2;
    if(pos.y < d/2) pos.y = height-d/2;
    if(pos.y > height-d/2) pos.y = d/2;
  }
}
