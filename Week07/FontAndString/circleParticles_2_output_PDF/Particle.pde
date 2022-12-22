class Particle {
  PVector pos; //pos.x, pos.y
  float w = 1;
  float squiggly = 0.001;
  float noiseFactor;

  //trace
  ArrayList<PVector> trace;

  Particle(PVector p) {
    pos = p;
    noiseFactor = random(1, 20);

    trace = new ArrayList<PVector>();
    trace.add(new PVector(pos.x, pos.y));
  }

  void run() {
    move();
    display();
  }

  void display() {
    stroke(0);
    strokeWeight(w);
    //point(pos.x, pos.y);
    
    noFill();
    beginShape();
    for(int i = 0; i < trace.size(); i ++){
      float tx = trace.get(i).x;
      float ty = trace.get(i).y;
      vertex(tx, ty);
    }
    endShape();
  }

  void move() {//noise()
    float theta = noise(pos.x*squiggly, pos.y*squiggly)*PI*noiseFactor;
    PVector v = PVector.fromAngle(theta);
    pos.add(v);
    trace.add(new PVector(pos.x, pos.y));
  }
}
