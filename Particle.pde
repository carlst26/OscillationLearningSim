class Particle {
  PVector pos;
  float lifespan, r;
  
  Particle(PVector pos) {
    this.pos = pos.copy();
    lifespan = 200.0;
    r = 10;
  }
  
  void update() {
    lifespan -= 5.0;
    r -= .2;
  }
  
  void draw() {
    noStroke();
    fill(violet, lifespan);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
