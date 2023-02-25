class Button {
  int x, y, w, h;
  boolean isHovering;
  color f, s; //Fill and Stroke colors
  String t; //Text
  float ts; //Text size
  
  Button(int x, int y, int w, int h, color f, color s, String t, float ts) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.f = f;
    this.s = s;
    this.t = t;
    this.ts = ts;
  }
  void draw() {
    strokeJoin(ROUND);
    strokeWeight(5);
    
    stroke(s);
    fill(f);
    rect(x - w/2, y - h/2, w, h);
    
    isHovering = isMouseHover(x - w/2, y - h/2, w, h);
    
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(ts);
    text(t, x, y-4);
  }
}
