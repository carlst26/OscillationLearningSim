class SceneTitle extends Scene {

  int buttonW, buttonH;
  Button playButton, slidesButton;
  float wave;

  SceneTitle() {
    buttonW = 140;
    buttonH = 60;

    slidesButton = new Button(width*3/8, height*4/5, buttonW, buttonH, red, deepred, "Learn", 32);
    playButton = new Button(width*5/8, height*4/5, buttonW, buttonH, orange, deeporange, "Play", 32);
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
    
    textAlign(CENTER, BOTTOM);
    textFont(body);
    fill(yellow);
    text("A visual demonstration by Tyger Carlson", width/2, height-10);
    
    textAlign(RIGHT, BOTTOM);
    textSize(11);
    text("© 2023", width-10, height-10);
  }

  void mousePressed() {
    if (playButton.isHovering) gameState = new SceneGame();
    if (slidesButton.isHovering) gameState = new SceneSlides();
  }
}
