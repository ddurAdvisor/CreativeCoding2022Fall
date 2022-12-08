class Particle {
  //属性attributes
  //float x;
  //float y;
  PVector pos;//PVector(x, y);
  float d;
  //float xSpeed;
  //float ySpeed;
  PVector speed;
  color pColor;

  Particle(PVector p, float d_) {
    //x = x_;
    //y = y_;
    pos = p;
    d = d_;
    //xSpeed = random(-2, 2);
    //ySpeed = random(-2, 2);
    speed = PVector.random2D().mult(random(2));
    pColor = color(255, 255, 255);
  }

  //行为behavior
  void display() {
    fill(pColor);
    ellipse(pos.x, pos.y, d, d);
    //float sLength = speed.mag();
    PVector nS = speed;
    nS.normalize().mult(speed.mag()*30);
    PVector arrowHead = PVector.add(pos, nS);
    stroke(200, 0, 255);
    line(pos.x, pos.y, arrowHead.x, arrowHead.y);
  }

  void move() {
    //x = x + xSpeed;
    //y += ySpeed;
    speed.limit(2);
    pos.add(speed);
    //speed.mult(0.99);
  }

  void edgeProcess() {//edgeCollision(){}
    //if (x >= width - d/2 || x <= d/2) {
    //  xSpeed *= -1;//xSpeed = xSpeed * -1;
    //}
    //if (y >= height - d/2 || y <= d/2) {
    //  ySpeed *= -1;//xSpeed = xSpeed * -1;
    //}

    if (pos.x >= width - d/2) {
      pos.x = width - d/2;
      speed.x *= -1;
    }
    if (pos.x <= d/2) {
      pos.x = d/2;
      speed.x *= -1;
    }

    if (pos.y >= height - d/2) {
      pos.y = height - d/2;
      speed.y *= -1;
    }
    if (pos.y <= d/2) {
      pos.y = d/2;
      speed.y *= -1;
    }
  }

  //collision
  void collision() {
    for (int i = 0; i < pts.size(); i ++) {
      //pts.get(i).x
      //pts.get(i).y
      if (pts.get(i) != this) {
        float dDist = dist(pos.x, pos.y, pts.get(i).pos.x, pts.get(i).pos.y);
        if(dDist <= d/2 + pts.get(i).d/2){
          PVector a = PVector.sub(pos, pts.get(i).pos);
          a.normalize();//mult();
          speed.add(a);
        }
      }
      
    }
  }
  //collision
  
}
