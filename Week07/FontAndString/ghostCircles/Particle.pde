class Particle {
  PVector pos;
  float size;
  float alpha;
  float dist;
  int r;

  Particle(PVector pos_, float s_, int r_) {
    this.pos = pos_;
    this.size = s_;
    this.alpha = 100;
    this.dist = 1.2;
    this.r = r_;
  }

  void move() {
    float theta = noise(this.pos.x * squiggliness, this.pos.y * squiggliness)*PI*noiseFactor;
    PVector v = PVector.fromAngle(theta).setMag(this.dist);
    this.pos.add(v);
    //this.dist *= 0.999;
    this.alpha *= 0.985;
    this.size *= 0.985;
  }

  void drawParticle() {
    stroke(100, this.alpha);
    strokeWeight(this.size);
    point(this.pos.x, this.pos.y);
  }
}
