//Particle pt;
ArrayList<Particle> pts;
int particleNum = 20;

void setup() {
  size(800, 800);
  background(0);

  initiate();
}

void initiate() {
  //pt = new Particle(random(width), random(height), random(10,30));
  pts = new ArrayList<Particle>();

  for (int i  = 0; i < particleNum; i ++) {
    PVector pp = new PVector(random(width), random(height));
    Particle p = new Particle(pp, random(10, 50));
    pts.add(p);
  }
}

void draw() {
  background(0);
  //pt.display();
  //pt.move();
  
  for(int i = 0 ; i <pts.size(); i ++){
    //pts.get(i).display();
    pts.get(i).move();
    pts.get(i).edgeProcess();
    pts.get(i).collision();
    
    pts.get(i).display();
  }
  
  println("frameRate: " + frameRate);
}

void keyPressed() {
  if (key == 'r') {
    initiate();
  }
}
