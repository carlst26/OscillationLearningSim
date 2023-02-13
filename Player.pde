class Player {
  final float GRAVITY = 9.8f;
  final float friction = .99;
  
  //Position and Velocity
  PVector pos, v;
  int radius;


  boolean isTethered;
  int maxTetherLength;
  Pivot currentAttachedPivot;

  Player(Pivot p) {
    pos = new PVector();
    v = new PVector();  
    pos.x = p.x;
    pos.y = p.y + 75;
    radius = 16;

    isTethered = true;
    maxTetherLength = 100;
    currentAttachedPivot = p;
  }

  void update() {
    //v.y += GRAVITY;
    v.x *= friction;
    
    pos.x += v.x * dt;
    pos.y += v.y * dt;
    if (isTethered) Tether(currentAttachedPivot);
  }

  void draw() {
    fill(#FF0000);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  //Tether takes a pivot as input to bind to
  void Tether(Pivot p) {
    //Make the player conform to the pivot and tether
    float angle = atan2(p.y-pos.y, p.x-pos.x);
    //length of a line: sqrt((x2 - x1)^2 + (y2 - y1)^2)
    float currentTetherLength = sqrt( (p.x-pos.x)*(p.x-pos.x) + (p.y-pos.y)*(p.y-pos.y));
    //If tether is at max length, stop the player from leaving the proximity
    if (currentTetherLength >= maxTetherLength) { //STUB
      //currentTetherLength = maxTetherLength;
      //pos.x += currentTetherLength*cos(angle);
      //pos.y = p.y + currentTetherLength;
      //v.y = 0;
      pos.y += (-1 * GRAVITY / currentTetherLength) * sin(angle);
    }
    
    //Draw
    strokeWeight(2);
    stroke(0);
    line(pos.x, pos.y, p.x, p.y);
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
