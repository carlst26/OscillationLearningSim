class Pivot {
  PVector pos;
  int radius;
  color pColor;
  int proximity, padding;
  //int pTether;
  
  float n; //Dashed circle interval
  float rotCounter, rotOffset; //Rotating proximity variables

  private Player playerRef; //ONLY TO USE AS A REFERENCE FOR VARIABLES

  Pivot(int x) { //Each Pivot has a determined horizonal placement
    pos = new PVector();
    
    playerRef = new Player(this); 

    radius = 5;
    proximity = playerRef.maxTetherLength;
    //pTether = 75;
    padding = proximity + playerRef.radius + 5;
    n = TWO_PI/7; //Change denominator
    
    rotCounter = .003;
    rotOffset = random(n);
    
    pos.x = x;
    pos.y = (int)random(padding, height-50 - padding);

    pColor = deeporange;
  }
  
  public void update() {
    rotOffset -= rotCounter;
    if (rotOffset >= TWO_PI) rotOffset = 0;
  }

  public void draw() {
    fill(pColor);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);

    noFill();
    stroke(pColor, 100);
    strokeWeight(3.5);
    strokeCap(SQUARE);
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rotOffset);
    for (float i = n/2; i < TWO_PI; i += n) {
      float j = i-n/2;
      arc(0, 0, proximity*2, proximity*2, j, i);
    }
    popMatrix();
    //ellipse(pos.x, pos.y, proximity*2, proximity*2);
    //ellipse(pos.x, pos.y, pTether*2, pTether*2);
  }
}
