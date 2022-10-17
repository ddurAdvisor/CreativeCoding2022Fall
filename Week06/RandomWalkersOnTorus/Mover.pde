class Mover{
  float blockSize;
  PVector p;  // p.x = theta, p.y = phi  in theta-phi plane
  PVector v;  // in theta-phi plane
  PVector a;  // in theta-phi plane
  float t;    // time
  float noiseBias;
  int N_tail = 1000;
  ArrayList<PVector> tail = new ArrayList<PVector>();
  
  Mover(float x, float y){
    blockSize = 20;
    p = new PVector(x, y);
    v = new PVector(0,0);
    a = new PVector(0,0);
    noiseBias = random(0,10);
    t = 0;
  }
  
  void move(){
    float amax_u = 0.1;
    float amax_v = 0.4;
    a.x = map(noise(t + noiseBias),0,1,-amax_u,amax_u);
    a.y = map(noise(t + noiseBias + 7),0,1,-amax_v,amax_v);
    v.add(a);
    v.limit(0.03);
    p.add(v);
    t += 0.01;
  }
  
  void show(){
    PVector pd = fp(p.x, p.y);
    
    tail.add(new PVector(pd.x, pd.y, pd.z));
    if(tail.size() > N_tail){
      tail.remove(0);
    }
    
    noFill();
    float hu = 0;
    
    beginShape();
    strokeWeight(1);
    for (PVector q : tail) { 
      stroke(hu%256,255,255);
      //stroke(255);
      vertex(q.x, q.y, q.z);
      hu += 0.2;
    }
    endShape();
    
    strokeWeight(1);
    pushMatrix();
    translate(pd.x, pd.y, pd.z);
    
    noStroke();
    fill(255);
    box(blockSize/3,blockSize/3,blockSize/3);
    stroke(255);
    fill(255,100);
    //box(blockSize,blockSize,blockSize);
    box(blockSize/2,blockSize/2,blockSize/2);
    popMatrix();
  }
}
////////////////////////////////////////////////
PVector fp(float u, float v){
  float x = ( Ra + Rb * cos(v) ) * cos(u) ;
  float y = ( Ra + Rb * cos(v) ) * sin(u) ;
  float z = Rb * sin(v);
  return new PVector(x, y, z);
}
////////////////////////////////////////////////
