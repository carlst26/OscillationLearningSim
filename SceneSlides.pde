class SceneSlides extends Scene {
  int currentSlide;

  int buttonW, buttonH;
  Button nextButton, prevButton, playButton, exitButton;
  Button active1, active2;
  boolean hoveringNextButton, hoveringPrevButton;
  
  float titleFS;

  SceneSlides() {
    currentSlide = 0;
    buttonW = 80;
    buttonH = 50;
    
    titleFS = 50;
    
    prevButton = new Button(width*3/8, height*7/8, buttonW, buttonH, orange, deeporange, "<", 32);
    exitButton = new Button(width*1/8, height*7/8, buttonW, buttonH, deepred, violet, "menu", 20);
    nextButton = new Button(width*5/8, height*7/8, buttonW, buttonH, orange, deeporange, ">", 32);
    playButton = new Button(width*7/8, height*7/8, buttonW*3/2, buttonH*3/2, violet, deepyellow, "PLAY", 40);
    
  }

  public void update() {
  }
  
  public void draw() {
    background(deeppurple);
    
    //Check active Slide
    if (currentSlide == 0) slide0();
    else if (currentSlide == 1) slide1();
    else if (currentSlide == 2) slide2();
    else if (currentSlide == 3) slide3();
    
    fill(yellow);
    text(currentSlide, width/2, height/2);

    //Buttons
    if (currentSlide == 0) active1 = exitButton;
    else active1 = prevButton;
    if (currentSlide == 3) active2 = playButton;
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

  //What is Oscillation?
  void slide0() {
    textAlign(CENTER, CENTER);
    textSize(titleFS);
    text("What is Oscillation?", width/2, 50);
  }
  
  //What is NOT Oscillation?
  void slide1() {
    textAlign(CENTER, CENTER);
    textSize(titleFS);
    text("What is NOT Oscillation?", width/2, 50);
  }
  
  //Simple Harmonic Motion
  void slide2() {
    textAlign(CENTER, CENTER);
    textSize(titleFS);
    text("Simple Harmonic Motion", width/2, 50);
  }
  
  //Damped Harmonic Motion
  void slide3() {
    textAlign(CENTER, CENTER);
    textSize(titleFS);
    text("Damped Harmonic Motion", width/2, 50);
  }
}
