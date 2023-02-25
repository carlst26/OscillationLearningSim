class Button {
  int x, y, w, h;
  boolean isHovering;
  color f, s;
  
  Button(int x, int y, int w, int h, color f, color s) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.f = f;
    this.s = s;
  }
  void draw() {
    strokeJoin(ROUND);
    strokeWeight(5);
    
    stroke(s);
    fill(f);
    rect(x - w/2, y - h/2, w, h);
    
    isHovering = isMouseHover(x - w/2, y - h/2, w, h);
  }
}
