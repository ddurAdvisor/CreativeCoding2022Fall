class Circle {
  //属性
  float x;
  float y;
  float d;
  color c;
  boolean mouseInCircle;

  //构造函数
  Circle(float x_, float y_, float d_, color c_) {
    x = x_;
    y = y_;
    d = d_;
    c = c_;
  }

  //行为/方法
  void drawCircle() {
    reaction();
    
    if (mouseInCircle) {
      //do...
      strokeWeight(5);
      stroke(0);
      fill(255);
    } else {
      //do..
      fill(c);
      noStroke();
    }
    //fill(c);
    //noStroke();
    ellipse(x, y, d, d);
  }

  void reaction() {
    float dmc = dist(mouseX, mouseY, x, y);
    if (dmc > d/2) {
      mouseInCircle = false;
    } else {
      mouseInCircle = true;
    }
  }
}
