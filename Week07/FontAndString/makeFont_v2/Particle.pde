class Particle {
  PVector pos;
  ArrayList<PVector> trace;
  float squiggliness = 0.002;
  float noiseFactor = random(10, 50);
  float distValue = 1.2;
  
  //float scaleSize = 2;

  Particle(PVector p) {
    pos = p;
    
    pos.mult(scaleSize);
    pos.sub(new PVector(width*(scaleSize-1)/2, height*(scaleSize-1)/2));
    
    trace = new ArrayList<PVector>();
    trace.add(new PVector(pos.x, pos.y));
  }

  void run() {
    //noiseFactor = random(1, 2);
    if (pos.x >=0 && pos.x <= width && pos.y >=0 && pos.y <= height) {
      //move();
      squiggly();
    }
    display();
  }

  void display() {
    stroke(0);
    noFill();
    //draw trace with the same strokeWeight
    //strokeWeight(0.2);
    //point(pos.x, pos.y);
    //beginShape();
    //for(int i = 0; i < trace.size(); i ++){
    //  vertex(trace.get(i).x, trace.get(i).y);
    //}
    //endShape();
    
    //draw trace with different strokeWeight
    for(int i = 1; i < trace.size(); i ++){
      float sw = map(i, 0, trace.size(), 5, 0.1);
      strokeWeight(sw);
      line(trace.get(i-1).x, trace.get(i-1).y, trace.get(i).x, trace.get(i).y);
    }
  }
  
  void squiggly(){
    float theta = noise(pos.x*squiggliness, pos.y*squiggliness)*PI*noiseFactor;
    PVector v = PVector.fromAngle(theta).setMag(distValue);
    pos.add(v);
    
    trace.add(new PVector(pos.x, pos.y));
  }

  void move() {
    PVector v = PVector.sub(pos, new PVector(width/2, height/2));
    v.normalize().mult(5);
    pos.add(v);
    
    trace.add(new PVector(pos.x, pos.y));
  }
}
