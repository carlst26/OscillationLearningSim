class SceneTitle extends Scene {

  int buttonW, buttonH;
  PVector playButton, slidesButton;
  boolean hoveringPlayButton, hoveringSlidesButton;

  SceneTitle() {
    buttonW = 140;
    buttonH = 60;

    playButton = new PVector(width*1/4, height*4/5);
    slidesButton = new PVector(width*3/4, height*4/5);
  }
  void update() {}

  void draw() {
    background(#69c4e1);

    strokeJoin(ROUND);
    strokeWeight(5);

    stroke(#b3475a);
    fill(#e06582);
    rect(playButton.x - buttonW/2, playButton.y - buttonH/2, buttonW, buttonH);
    hoveringPlayButton = isMouseHover(playButton.x - buttonW/2, playButton.y - buttonH/2, buttonW, buttonH);

    stroke(#1e913a);
    fill(#33d064);
    rect(slidesButton.x - buttonW/2, slidesButton.y - buttonH/2, buttonW, buttonH);
    hoveringSlidesButton = isMouseHover(slidesButton.x - buttonW/2, slidesButton.y - buttonH/2, buttonW, buttonH);
    
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(32);
    text("PLAY", playButton.x, playButton.y-4);
    text("LEARN", slidesButton.x, slidesButton.y-4);
  }

  void mousePressed() {
    if (hoveringPlayButton) gameState = new SceneGame();
    //if (hoveringSlidesButton) gameState = new SceneSlides();
  }
}
