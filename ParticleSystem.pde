class ParticleSystem {
  ArrayList<Particle> particles;
  Player origin;

  ParticleSystem(Player p) {
    origin = p;
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin.pos));
  }

  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.draw();
      if (p.lifespan <= 0) particles.remove(i);
    }
  }
}
