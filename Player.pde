class Player {
  final float GRAVITY = .2; //Y Acceleration

  //Position and Velocity
  PVector pos, prevPos, airVelocity;
  int radius, maxTetherLength;

  float angle, acceleration, damping, velocity, R;

  boolean isTethered;
  Pivot originPivot;

  Player(Pivot p) {

    isTethered = true;
    maxTetherLength = 60;
    originPivot = p;
    
    pos = new PVector();
    prevPos = new PVector();
    airVelocity = new PVector();
    pos.set(p.pos.x-maxTetherLength, p.pos.y);
    radius = 10;

    angle = 0;
    acceleration = 0.0;
    damping = .993;
    velocity = 0.0;
  }

  void update() {
    if (isTethered) {
      updateTether();
      drawTether(); //Draws underneath the pivot
    }
    else projectileMotion();
  }

  void draw() {
    
    fill(red);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  //Tether takes a pivot as input to bind to
  void updateTether() {
    //Make the player conform to the pivot and tether
    float lineLength = sqrt( sq((originPivot.pos.x-pos.x)) + sq((originPivot.pos.y-pos.y)) );
    
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
  
  Boolean outOfBounds() {
    if (pos.y > height) return true;
    if (pos.x < -radius) return true;
    if (pos.x > width+radius) return true;
    return false;
  }
  
  void keyPressed() {
      if (keyCode == 90 && isTethered) applyForce(); //Z
      if (keyCode == 32 && isTethered) detachTether(); //Spacebar
  }
}
