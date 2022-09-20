class Circle
{
  float x, y, r, r2, sp, ysp;
  int id;

  Circle( float px, float py, float pr, float psp, float pysp, int pid ) {
    x = px;
    y = py;
    r = pr;
    r2 = r*r;
    id = pid;
    sp = psp;
    ysp = pysp;
  }

  void update() {
    for (int i=0; i<numCircle; i++) {
      if (i != id) {
        intersect( this, circles[i] );
      }
    }
  }

  void move() {
    x += sp;
    y += ysp;
    if (sp > 0) {
      if (x > width+r) {
        x = -r;
      }
    } else {
      if (x < -r) {
        x = width+r;
      }
    }
    if (ysp > 0) {
      if (y > height+r) {
        y = -r;
      }
    } else {
      if (y < -r) {
        y = height+r;
      }
    }
  }
}


void intersect( Circle cA, Circle cB )
{
  float dx = cA.x - cB.x;
  float dy = cA.y - cB.y;
  float d2 = dx*dx + dy*dy;
  float d = sqrt( d2 );

  if ( d>cA.r+cB.r || d<abs(cA.r-cB.r) ) {
    return; // no solution
  }

  float a = (cA.r2 - cB.r2 + d2) / (2*d);
  float h = sqrt( cA.r2 - a*a );
  float x2 = cA.x + a*(cB.x - cA.x)/d;
  float y2 = cA.y + a*(cB.y - cA.y)/d;

  float paX = x2 + h*(cB.y - cA.y)/d;
  float paY = y2 - h*(cB.x - cA.x)/d;
  float pbX = x2 - h*(cB.y - cA.y)/d;
  float pbY = y2 + h*(cB.x - cA.x)/d;

  stroke(dist(paX, paY, pbX, pbY)*4, 12);
  line(paX, paY, pbX, pbY);
}
