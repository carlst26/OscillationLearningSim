class Pivot {
  int x, y, radius;
  color pColor;
  int proximity;

  Pivot(int x) { //Each Pivot has a determined horizonal placement

    radius = 8;
    proximity = 75;

    this.x = x;
    this.y = (int)random(proximity, height-proximity);

    pColor = #0066DD;
  }

  void update() {
  }

  public void draw() {
    fill(pColor);
    noStroke();
    ellipse(x, y, radius*2, radius*2);
    
    noFill();
    stroke(pColor, 50);
    strokeWeight(2);
    ellipse(x, y, proximity*2, proximity*2);
  }
}
