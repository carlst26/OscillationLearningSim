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
    pos.set(p.pos.x, p.pos.y-50);
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
  }

  void draw() {
    fill(#FF0000);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  //Tether takes a pivot as input to bind to
  void Tether(Pivot origin) {
    //Make the player conform to the pivot and tether
    //R = sqrt( (origin.pos.x-pos.x)*(origin.pos.x-pos.x) + (origin.pos.y-pos.y)*(origin.pos.y-pos.y) );
    float lineLength = sqrt( (origin.pos.x-pos.x)*(origin.pos.x-pos.x) + (origin.pos.y-pos.y)*(origin.pos.y-pos.y) );
    //float angleStart = atan2(origin.pos.y-pos.y, origin.pos.x-pos.x);
    if ( lineLength >= maxTetherLength ) {
      R = maxTetherLength;
      //if (Float.isNaN(angle)) angle = angleStart;
    }
    //If tether is at max length, stop the player from leaving the proximity

    if (R == maxTetherLength) { //STUB
      //R = maxTetherLength;
      if (Float.isNaN(angle)) angle = atan2(origin.pos.y-pos.y, origin.pos.x-pos.x);
      acceleration = (-1 * GRAVITY / R) * sin(angle);
      //pos.x += currentTetherLength*cos(angle);
      //pos.y = p.y + currentTetherLength;
      //v.y = 0;
      //if (acceleration
      velocity += acceleration;
      velocity *= damping;
      angle += velocity;

      pos.set(R*sin(angle), R*cos(angle));
      pos.add(origin.pos);
    } else {
      velocity += GRAVITY * dt;
    }
    
    

    //Draw
    strokeWeight(2);
    stroke(0);
    line(pos.x, pos.y, origin.pos.x, origin.pos.y);
  }

  void ApplyForce() {
    print("z");
    velocity += .05;
  }

  void DetachTether() {
    isTethered = false;
    print("space");
  }
}
