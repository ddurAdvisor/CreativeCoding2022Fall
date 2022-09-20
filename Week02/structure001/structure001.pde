ArrayList<Particle> particles;
int particleNum = 200;

void setup() {
  size(600, 600);
  intiateData();
}

void intiateData() {
  particles = new ArrayList<Particle>();
  for (int i = 0; i < particleNum; i ++) {
    particles.add(new Particle(new PVector(random(width), random(height))));
  }
}

void draw() {
  //background(0);
  
  fill(0, 15);
  noStroke();
  rect(0, 0, width, height);
  
  for (Particle p : particles) {
    p.run();
  }
}
