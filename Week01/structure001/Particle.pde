class Particle {
  PVector pos;
  PVector speed;

  Particle(PVector p) {
    pos = p;
    speed = PVector.random2D();
  }

  void run() {
    move();
    edge();
    //connection();
    display();
  }

  void move() {
    pos.add(speed);
  }

  void edge() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }

  void display() {
    strokeWeight(2);
    stroke(255);
    point(pos.x, pos.y);
  }
  
  void connection(){
    for(Particle p : particles){
      if(p != this){
        PVector c = PVector.add(pos, p.pos).div(2);
        float cc = PVector.sub(c, new PVector(width/2, height/2)).mag();
        float d = PVector.sub(pos, p.pos).mag();
        if(d > cc*0.25 && d < cc*0.28){
          strokeWeight(0.5);
          line(pos.x, pos.y, p.pos.x, p.pos.y);
        }
      }
    }
  }
  
}
