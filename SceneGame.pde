class SceneGame extends Scene {
  Player player;
  Pivot[] pivots;
  Goal goal;

  int gameHeight, pivotSpacing, resetCounter;
  Boolean didWin, outOfBounds;
  String resetMessage;
  Button exitButton;

  SceneGame() {
    gameHeight = height-50;
    pivotSpacing =  width/8; //Initiate after width is declared

    resetCounter = 120;

    didWin = false;
    outOfBounds = false;
    resetMessage = "";

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
  }

  public void update() {


    //Updates
    player.update();

    //Check Collision
    for (Pivot piv : pivots)
      if (checkRadialCollision(player, piv))
        player.retether(piv);

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

    if (resetCounter <= 0) {
      if (didWin) winCounter++;
      resetScene();
    }
  }

  public void draw() {

    //Draws
    for (Pivot piv : pivots) {
      piv.draw();
    }
    goal.draw();
    player.draw();

    //UI
    fill(purple);
    rect(0, gameHeight, width, height);
    exitButton.draw();

    textAlign(CENTER, CENTER);
    textFont(header);
    textSize(26);
    fill(255);
    text("Z", 115, gameHeight+22);
    text("SPACE", width/3 + 50, gameHeight+22);

    textAlign(LEFT, CENTER);
    textFont(body);
    fill(yellow);
    text("Apply Force", 130, gameHeight+23);
    text("Detatch Tether", width/2 - 35, gameHeight+23);

    textAlign(RIGHT, CENTER);
    textFont(body);
    textSize(23);
    fill(yellow);
    text("Swing to the yellow goal!", width-10, gameHeight+22);

    if (winCounter > 0) {
      textAlign(RIGHT, CENTER);
      textFont(body);
      fill(red);
      text("Wins: " + winCounter, width-10, gameHeight-20);
    }

    if (didWin) resetMessage = "Win!";
    else if (outOfBounds) resetMessage = "Out of Bounds!";

    textAlign(CENTER, CENTER);
    textFont(body);
    textSize(32);
    fill(yellow);
    text(resetMessage, width/2, 40);
  }

  public void keyPressed() {
    player.keyPressed();
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
