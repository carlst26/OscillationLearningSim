class Player {
  final float GRAVITY = 1.0;
  final float friction = .99;

  //Position and Velocity
  PVector pos, v;
  int radius;

  float angle, acceleration, damping, velocity, R, maxTetherLength;

  boolean isTethered;
  Pivot originPivot;

  Player(Pivot p) {
    v = new PVector();
    pos = new PVector();
    pos.set(p.pos.x, p.pos.y);
    radius = 16;

    angle = Float.NaN;
    acceleration = 0.0;
    damping = .99;
    velocity = 0.0;
    //R = maxTetherLength;

    isTethered = true;
    maxTetherLength = 75.0;
    originPivot = p;
  }

  void update() {
    //v.y += GRAVITY;
    //v.x *= friction;

    //pos.x += v.x * dt;
    //pos.y += v.y * dt;
    if (isTethered) Tether(originPivot);
    
    //stayInBounds();
  }

  void draw() {
    fill(#FF0000);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  //Tether takes a pivot as input to bind to
  void Tether(Pivot origin) {
    //Make the player conform to the pivot and tether
    float lineLength = sqrt( (origin.pos.x-pos.x)*(origin.pos.x-pos.x) + (origin.pos.y-pos.y)*(origin.pos.y-pos.y) );
    
    //If tether is at max length, stop the player from leaving the proximity
    if ( lineLength >= maxTetherLength )
      R = maxTetherLength;

    if (R == maxTetherLength) { //STUB
      if (Float.isNaN(angle)) angle = atan2(origin.pos.y-pos.y, origin.pos.x-pos.x);
      acceleration = (-1 * GRAVITY / R) * sin(angle);
      velocity += acceleration;
      velocity *= damping;
      angle += velocity;

      pos.set(R*sin(angle), R*cos(angle));
      pos.add(origin.pos);
    } else {
      acceleration = GRAVITY;
      velocity += acceleration;
      angle = 0;
      pos.set(R*sin(angle), R*cos(angle));
    }



    //Draw
    strokeWeight(2);
    stroke(#000000);
    line(pos.x, pos.y, origin.pos.x, origin.pos.y);
  }

  void ApplyForce() {
    print("z");
    velocity += .1;
  }

  void DetachTether() {
    isTethered = false;
    print("space");
  }
  
  void stayInBounds() {
    if (pos.x < radius) pos.x = radius;
    if (pos.x > width-radius) pos.x = width-radius;
    if (pos.y > 200) pos.y = 200;
  }
}
