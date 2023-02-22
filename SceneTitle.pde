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
  void update() {
  }

  void draw() {
    background(#729EA1);

    strokeJoin(BEVEL);
    strokeWeight(4);

    stroke(#BA274C);
    fill(#DB5375);
    rect(playButton.x - buttonW/2, playButton.y - buttonH/2, buttonW, buttonH);
    hoveringPlayButton = isMouseHover(playButton.x - buttonW/2, playButton.y - buttonH/2, buttonW, buttonH);

    stroke(#454A29);
    fill(#B5BD89);
    rect(slidesButton.x - buttonW/2, slidesButton.y - buttonH/2, buttonW, buttonH);
    hoveringSlidesButton = isMouseHover(slidesButton.x - buttonW/2, slidesButton.y - buttonH/2, buttonW, buttonH);
  }

  void mousePressed() {
    if (hoveringPlayButton) gameState = new SceneGame();
    //if (hoveringSlidesButton) gameState = new SceneSlides();
  }
}
