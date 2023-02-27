class SceneTitle extends Scene {

  int buttonW, buttonH;
  Button playButton, slidesButton;
  float wave;

  SceneTitle() {
    buttonW = 140;
    buttonH = 60;

    playButton = new Button(width*3/8, height*4/5, buttonW, buttonH, orange, deeporange, "Play", 32);
    slidesButton = new Button(width*5/8, height*4/5, buttonW, buttonH, red, deepred, "Learn", 32);
  }

  void update() {
    wave = 100*sin(time) + width/2;
  }

  void draw() {
    background(purple);
    
    //Buttons
    playButton.draw();
    slidesButton.draw();
    
    //Text
    //textAlign(CENTER, CENTER);
    //fill(255);
    //textSize(32);
    //text("PLAY", playButton.x, playButton.y-4);
    //text("LEARN", slidesButton.x, slidesButton.y-4);

    //Header
    textAlign(CENTER, CENTER);
    textFont(header);
    textSize(72);
    text("OSCILLATION", wave, height/3);
    
    textFont(body);
    //textSize(12);
    fill(yellow);
    text("A visual demonstration by Tyger Carlson", width/2, height-25);
  }

  void mousePressed() {
    if (playButton.isHovering) gameState = new SceneGame();
    if (slidesButton.isHovering) gameState = new SceneSlides();
  }
}
