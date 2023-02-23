class SceneTitle extends Scene {

  int buttonW, buttonH;
  PVector playButton, slidesButton;
  boolean hoveringPlayButton, hoveringSlidesButton;
  float wave;

  SceneTitle() {
    buttonW = 140;
    buttonH = 60;

    playButton = new PVector(width*3/8, height*4/5);
    slidesButton = new PVector(width*5/8, height*4/5);
  }

  void update() {
    wave = 100*cos(time) + width/2;
  }

  void draw() {
    background(purple);

    strokeJoin(ROUND);
    strokeWeight(5);

    stroke(deepred);
    fill(red);
    rect(playButton.x - buttonW/2, playButton.y - buttonH/2, buttonW, buttonH);
    hoveringPlayButton = isMouseHover(playButton.x - buttonW/2, playButton.y - buttonH/2, buttonW, buttonH);

    stroke(deeporange);
    fill(orange);
    rect(slidesButton.x - buttonW/2, slidesButton.y - buttonH/2, buttonW, buttonH);
    hoveringSlidesButton = isMouseHover(slidesButton.x - buttonW/2, slidesButton.y - buttonH/2, buttonW, buttonH);

    textAlign(CENTER, CENTER);
    fill(255);
    textSize(32);
    text("PLAY", playButton.x, playButton.y-4);
    text("LEARN", slidesButton.x, slidesButton.y-4);

    textSize(72);
    text("OSCILLATION", wave, height/3);
  }

  void mousePressed() {
    if (hoveringPlayButton) gameState = new SceneGame();
    //if (hoveringSlidesButton) gameState = new SceneSlides();
  }
}
