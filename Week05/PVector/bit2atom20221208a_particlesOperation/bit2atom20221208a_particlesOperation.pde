//Particle pt;
ArrayList<Particle> pts;

void setup() {
  size(800, 800);
  background(0);

  initiate();
}

void initiate() {
  //pt = new Particle(random(width), random(height), random(10,30));
  pts = new ArrayList<Particle>();

  for (int i  = 0; i < 10; i ++) {
    Particle p = new Particle(random(width), random(height), random(10, 30));
    pts.add(p);
  }
}

void draw() {
  background(0);
  //pt.display();
  //pt.move();
  
  for(int i = 0 ; i <pts.size(); i ++){
    pts.get(i).display();
    pts.get(i).move();
  }
}

void keyPressed() {
  if (key == 'r') {
    initiate();
  }
}
