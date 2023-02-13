class Pivot {
  PVector pos;
  int radius;
  color pColor;
  int proximity;

  Pivot(int x) { //Each Pivot has a determined horizonal placement
  pos = new PVector();

    radius = 8;
    proximity = 75;

    pos.x = x;
    pos.y = (int)random(proximity, height-proximity);

    pColor = #0066DD;
  }

  void update() {
  }

  public void draw() {
    fill(pColor);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);
    
    noFill();
    stroke(pColor, 50);
    strokeWeight(2);
    ellipse(pos.x, pos.y, proximity*2, proximity*2);
  }
}
