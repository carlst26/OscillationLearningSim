class Player {
  final float GRAVITY = .098; //Y Acceleration
  final float friction = .99; //X Acceleration

  //Position and Velocity
  PVector pos, prevPos, airVelocity;
  int radius;

  float angle, acceleration, damping, velocity, R, maxTetherLength;

  boolean isTethered;
  Pivot originPivot;

  Player(Pivot p) {
    //v = new PVector();
    pos = new PVector();
    prevPos = new PVector();
    airVelocity = new PVector();
    pos.set(p.pos.x-10, p.pos.y);
    radius = 16;

    angle = 0;
    acceleration = 0.0;
    damping = .99;
    velocity = 0.0;
    //R = maxTetherLength;

    isTethered = true;
    maxTetherLength = 75.0;
    originPivot = p;
  }

  void update() {
    if (isTethered) {
      updateTether();
      drawTether();
    }
    else projectileMotion();
    
    //stayInBounds();
  }

  void draw() {
    
    fill(red);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  //Tether takes a pivot as input to bind to
  void updateTether() {
    //Make the player conform to the pivot and tether
    float lineLength = sqrt( (originPivot.pos.x-pos.x)*(originPivot.pos.x-pos.x) + (originPivot.pos.y-pos.y)*(originPivot.pos.y-pos.y) );
    
    //If tether is at max length, stop the player from leaving the proximity
    if ( lineLength >= maxTetherLength ) { //Debug
      R = maxTetherLength;
      angle = -(atan2(originPivot.pos.y-pos.y, originPivot.pos.x-pos.x) + PI/2);
    }
    
    if (R == maxTetherLength) {
      acceleration = (-1 * GRAVITY / R) * sin(angle);
      velocity += acceleration;
      velocity *= damping;
      angle += velocity;

      pos.set(R*sin(angle), R*cos(angle));
      pos.add(originPivot.pos);
    } else {
      projectileMotion();
    }
    
    airVelocity.set(pos.x-prevPos.x, pos.y-prevPos.y);
    prevPos = pos.copy();
  }

  void drawTether() {
    strokeWeight(2);
    stroke(deepred);
    line(pos.x, pos.y, originPivot.pos.x, originPivot.pos.y);
  }
  
  void projectileMotion() {
    airVelocity.add(0, GRAVITY);
    pos.add(airVelocity);
  }

  void applyForce() {
    velocity += .1;
  }

  void detachTether() {
    isTethered = false;
  }
  
  void retether(Pivot piv) {
    isTethered = true;
    originPivot = piv;
    angle = -(atan2(originPivot.pos.y-pos.y, originPivot.pos.x-pos.x) + PI/2);
  }

  void stayInBounds() {
    if (pos.x < radius) pos.x = radius;
    if (pos.x > width-radius) pos.x = width-radius;
    if (pos.y > 200) pos.y = 200;
  }
  
  void keyPressed() {
      if (keyCode == 90 && R == maxTetherLength) applyForce(); //Z
      if (keyCode == 32 && isTethered) detachTether(); //Spacebar
  }
}
