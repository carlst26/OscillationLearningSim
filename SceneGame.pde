class SceneGame extends Scene {
  Player player;
  Pivot[] pivots;
  Goal goal;
  ParticleSystem ps;

  int gameHeight, pivotSpacing, resetCounter;
  Boolean didWin, outOfBounds;
  String resetMessage;
  Button exitButton;
  color inputZ, inputSpace;

  SceneGame() {
    gameHeight = height-50;
    pivotSpacing =  width/8; //Initiate after width is declared

    resetCounter = 120;

    didWin = false;
    outOfBounds = false;
    resetMessage = "";
    inputZ = 255;
    inputSpace = 255;

    exitButton = new Button(35, gameHeight+25, 50, 30, violet, deepyellow, "<", 20);

    pivots = new Pivot[3]; //Initiate with static amount because there will always only be 3
    for (int i = 0; i < pivots.length; i++) {
      //Formula for spacing the pivots across the screen evenly
      int px = pivotSpacing + i*2*pivotSpacing;
      pivots[i] = new Pivot(px);
    }
    //Placing the goal on the right
    goal = new Goal(width-pivotSpacing);
    //Instantiate the player on the first pivot
    player = new Player(pivots[0]);
    ps = new ParticleSystem(player);
  }

  public void update() {


    //Updates
    player.update();
    goal.update();

    //Check Collision
    for (Pivot piv : pivots) {
      piv.update();
      if (checkRadialCollision(player, piv))
        player.retether(piv);
    }

    //Win Condition
    if (checkRadialCollision(player, goal)) {
      player.retether(goal);
      didWin = true;
    }

    if (didWin) resetCounter--;
    else if (player.outOfBounds()) {
      outOfBounds = true;
      resetCounter--;
    }
    else {
      outOfBounds = false;
      resetCounter = 120;
    }

    if (resetCounter <= 0) {
      if (didWin) winCount++;
      resetScene();
    }
  }

  public void draw() {

    //Draws
    for (Pivot piv : pivots) {
      piv.draw();
    }
    goal.draw();
    
    ps.addParticle();
    ps.update();
    player.draw();

    //UI
    fill(purple);
    rect(0, gameHeight, width, height);
    exitButton.draw();

    textAlign(LEFT, CENTER);
    textFont(header);
    textSize(26);
    fill(inputZ);
    text("Z", 128, gameHeight+22);
    fill(inputSpace);
    text("SPACE", width/2 -57, gameHeight+22);

    textAlign(LEFT, CENTER);
    textFont(body);
    fill(yellow);
    text("tap", 100, gameHeight+23);
    text("tap", width/2 -86, gameHeight+23);
    text("to APPLY FORCE", 149, gameHeight+23);
    text("to DETACH", width/2 + 33, gameHeight+23);

    textAlign(RIGHT, CENTER);
    textFont(body);
    //textSize(23);
    fill(255);
    text("Swing to the yellow goal!", width-10, gameHeight+22);

    if (winCount > 0) {
      textAlign(RIGHT, CENTER);
      textFont(body);
      fill(red);
      text("Wins: " + winCount, width-10, gameHeight-20);
    }

    if (didWin) resetMessage = "Win!";
    else if (outOfBounds) resetMessage = "Out of Bounds!";
    else resetMessage = "";

    textAlign(CENTER, CENTER);
    textFont(body);
    textSize(32);
    fill(yellow);
    text(resetMessage, width/2, 40);
  }

  public void keyPressed() {
    player.keyPressed();
    if (keyCode == 90) inputZ = red;
    if (keyCode == 32) inputSpace = red;
  }
  
  void keyReleased() {
    if (keyCode == 90) inputZ = 255;
    if (keyCode == 32) inputSpace = 255;
  }

  void mousePressed() {
    if (exitButton.isHovering) gameState = new SceneTitle();
  }

  boolean checkRadialCollision(Player p, Pivot piv) {
    float dx = piv.pos.x-p.pos.x;
    float dy = piv.pos.y-p.pos.y;
    float dis = sqrt( sq(dx) + sq(dy));

    if (dis <= piv.proximity) return true;
    return false;
  }

  void resetScene() {
    gameState = new SceneGame();
  }
}
