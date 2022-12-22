class Particle {
  PVector pos;
  ArrayList<PVector> trace;
  
  //float scaleSize = 2;

  Particle(PVector p) {
    pos = p;
    
    pos.mult(scaleSize);
    pos.sub(new PVector(width*(scaleSize-1)/2, height*(scaleSize-1)/2));
    
    trace = new ArrayList<PVector>();
    trace.add(new PVector(pos.x, pos.y));
  }

  void run() {
    if (pos.x >=0 && pos.x <= width && pos.y >=0 && pos.y <= height) {
      move();
    }
    display();
  }

  void display() {
    stroke(0);
    noFill();
    strokeWeight(0.2);
    //point(pos.x, pos.y);
    beginShape();
    for(int i = 0; i < trace.size(); i ++){
      vertex(trace.get(i).x, trace.get(i).y);
    }
    endShape();
  }

  void move() {
    PVector v = PVector.sub(pos, new PVector(width/2, height/2));
    v.normalize().mult(5);
    pos.add(v);
    
    trace.add(new PVector(pos.x, pos.y));
  }
}
