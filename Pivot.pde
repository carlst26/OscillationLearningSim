class Pivot {
  PVector pos;
  int radius;
  color pColor;
  int proximity;

  Pivot(int x) { //Each Pivot has a determined horizonal placement
    pos = new PVector();

    radius = 7;
    proximity = 45;

    pos.x = x;
    pos.y = (int)random(proximity, height*4/5 - proximity);

    pColor = orange;
  }

  void update() {
  }

  public void draw() {
    fill(pColor);
    noStroke();
    ellipse(pos.x, pos.y, radius*2, radius*2);

    noFill();
    stroke(pColor, 50);
    strokeWeight(3);
    ellipse(pos.x, pos.y, proximity*2, proximity*2);
    ellipse(pos.x, pos.y, 150, 150);
  }
}
