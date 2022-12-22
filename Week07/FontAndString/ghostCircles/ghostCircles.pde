ArrayList<Particle> particles;
ArrayList<Particle> circles;
float squiggliness = 0.002;
float margin;
boolean theEnd = false;
int r;
float noiseFactor;

int count;

void setup() {
  size(1200, 1200);
  colorMode(HSB, 100);
  
  r = width/3;
  margin = width/40;

  background(0);
  updateParticles();

  noiseFactor = random(10, 50);
}

void draw() {
  if (theEnd) {
    noLoop();
  } else {
    for (Particle p : particles) {
      p.drawParticle();
      p.move();
    }
  }
  
  count ++;
  if(count%200==0){
    noiseFactor = random(10, 50);
    updateParticles();
  }
}


void updateParticles() {
  particles = new ArrayList<Particle>();
  float xCenter = width/2;
  float yCenter = height/2;
  int n = r*20;
  //circle based distribution
  for (int i = 0; i < n; i++) {
    float theta = map(i, 0, n, -PI, PI);
    //float rScale = (noise(0.1*i)-0.5)*2;
    //float rangeScale = 0.9;
    //float x_ = xCenter + (r*rangeScale+r*rScale*(1-rangeScale))*cos(theta);
    PVector pos = new PVector(xCenter + r*cos(theta), yCenter + r*sin(theta));
    float s_ = 1;
    particles.add(new Particle(pos, s_, r));
  }
  
  //line based distribution
  //for (int i = 0; i < n; i++) {
  //  float x_ = map(i,0,n-1,0,width);
  //  float y_ = yCenter;
  //  float s_ = 1;
  //  particles.add(new Particle(x_, y_, s_, r));
  //}
  
  r -= margin;
  if (r < margin*2) {
    theEnd = true;
  }
}

boolean intersectsWithOtherCircles(float x_, float y_, float r_) {
  for (Particle c : circles) {
    if (dist(c.pos.x, c.pos.y, x_, y_) < c.r + r_ + margin) {
      return true;
    }
  }
  circles.add( new Particle(new PVector(x_, y_), r_, int(r_)));
  return false;
}
