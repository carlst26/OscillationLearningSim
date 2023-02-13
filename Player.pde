class Player {
  final float GRAVITY = 9.8;
  final float friction = .99;

  //Position and Velocity
  PVector pos, v;
  int radius;

  float angle, acceleration, damping, velocity;

  boolean isTethered;
  int maxTetherLength;
  Pivot originPivot;

  Player(Pivot p) {
    v = new PVector();
    pos = new PVector();
    pos.set(p.pos.x, p.pos.y);
    radius = 16;

    angle = PI/2;
    acceleration = 0.0;
    damping = .99;
    velocity = 0.0;

    isTethered = true;
    maxTetherLength = 100;
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
    float angle = atan2(origin.pos.y-pos.y, origin.pos.x-pos.x);
    //length of a line: sqrt((x2 - x1)^2 + (y2 - y1)^2)
    float R = sqrt( (origin.pos.x-pos.x)*(origin.pos.x-pos.x) + (origin.pos.y-pos.y)*(origin.pos.y-pos.y));
    //If tether is at max length, stop the player from leaving the proximity

    acceleration = (-1 * GRAVITY / R) * sin(angle);

    if (R >= maxTetherLength) { //STUB
      //currentTetherLength = maxTetherLength;
      //pos.x += currentTetherLength*cos(angle);
      //pos.y = p.y + currentTetherLength;
      //v.y = 0;
      velocity += acceleration;
      velocity *= damping;
      angle += velocity;

      pv.set(R*sin(ang), R*cos(ang), 0);
      pv.add(origin.pos);
    } else {
      pos.y += GRAVITY;
    }

    //Draw
    strokeWeight(2);
    stroke(0);
    line(pos.x, pos.y, origin.pos.x, origin.pos.y);
  }

  void ApplyForce() {
    print("z");
    v.x += 500;
  }

  void DetachTether() {
    isTethered = false;
    print("space");
  }
}
