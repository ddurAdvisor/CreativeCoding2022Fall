class Particle {
  //属性attributes
  float x;
  float y;
  float d;
  float xSpeed;
  float ySpeed;

  Particle(float x_, float y_, float d_) {
    x = x_;
    y = y_;
    d = d_;
    xSpeed = random(-2, 2);
    ySpeed = random(-2, 2);
  }

  //行为behavior
  void display() {
    ellipse(x, y, d, d);
  }

  void move() {
    x = x + xSpeed;
    y += ySpeed;
  }

  void edgeProcess() {//edgeCollision(){}
    //if (x >= width - d/2 || x <= d/2) {
    //  xSpeed *= -1;//xSpeed = xSpeed * -1;
    //}
    //if (y >= height - d/2 || y <= d/2) {
    //  ySpeed *= -1;//xSpeed = xSpeed * -1;
    //}

    if (x >= width - d/2) {
      x = width - d/2;
      xSpeed *= -1;
    }
    if (x <= d/2) {
      x = d/2;
      xSpeed *= -1;
    }

    if (y >= height - d/2) {
      y = height - d/2;
      ySpeed *= -1;
    }
    if (y <= d/2) {
      y = d/2;
      ySpeed *= -1;
    }
  }
}
