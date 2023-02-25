class SceneSlides extends Scene {
  int currentSlide;

  int buttonW, buttonH;
  Button nextButton, prevButton, playButton, exitButton;
  Button active1, active2;
  boolean hoveringNextButton, hoveringPrevButton;

  SceneSlides() {
    currentSlide = 1;
    buttonW = 140;
    buttonH = 60;
    
    prevButton = new Button(width*3/8, height*7/8, buttonW/2, buttonH, orange, deeporange);
    exitButton = new Button(width*1/8, height*7/8, buttonW/2, buttonH, yellow, violet);
    nextButton = new Button(width*5/8, height*7/8, buttonW/2, buttonH, orange, deeporange);
    playButton = new Button(width*7/8, height*7/8, buttonW, buttonH, yellow, violet);
    
  }

  public void update() {
  }
  public void draw() {
    background(0);
    //Check active Slide
    text(currentSlide, width/2, height/2);

    //Buttons
    if (currentSlide == 0) active1 = exitButton;
    else active1 = prevButton;
    if (currentSlide == 5) active2 = playButton;
    else active2 = nextButton;
    
    active1.draw();
    active2.draw();
  }
  public void mousePressed() {
    if (active1 == exitButton && active1.isHovering) gameState = new SceneTitle();
    if (active2 == playButton && active2.isHovering) gameState = new SceneGame();
    
    if (active1 == prevButton && active1.isHovering) currentSlide--;
    if (active2 == nextButton && active2.isHovering) currentSlide++;
    
  }
  public void keyPressed() {
  }

  void nextButton() {
    nextButton = new Button(width*5/8, height*4/5, buttonW, buttonH, orange, deeporange);
    nextButton.draw();
  }

  void prevButton() {
    prevButton.draw();
  }

  //What is Oscillation?
  void slide0() {
  }
}
