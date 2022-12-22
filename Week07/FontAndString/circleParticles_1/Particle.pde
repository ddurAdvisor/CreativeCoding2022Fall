class Particle{
  PVector pos; //pos.x, pos.y
  float w = 1;
  float squiggly = 0.001;
  float noiseFactor;
  
  Particle(PVector p){
    pos = p;
    noiseFactor = random(1, 20);
  }
  
  void run(){
    move();
    display();
  }
  
  void display(){
    stroke(0);
    strokeWeight(w);
    point(pos.x, pos.y);
  }
  
  void move(){//noise()
  float theta = noise(pos.x*squiggly, pos.y*squiggly)*PI*noiseFactor;
  PVector v = PVector.fromAngle(theta);
  pos.add(v);
  }
}
