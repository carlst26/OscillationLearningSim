class SceneGame extends Scene {
  Player player;
  Pivot[] pivots;
  Goal goal;

  int gameHeight, pivotSpacing;


  PVector pv = new PVector(), origin = new PVector();
  float r = 40; //TetherLength
  float ang = PI*2/3;
  float grav = .4;
  float accel = 0.0;
  float damp = .995;
  float vel = 0.0;

  SceneGame() {
    gameHeight = height*4/5;
    pivotSpacing =  width/8; //Initiate after width is declared

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


    origin = new PVector(width/3, height/3);
  }

  public void update() {
    player.update();
    goal.update();
    for (Pivot piv : pivots) {
      piv.update();
    }
  }

  public void draw() {
    //Samples
    float wave = 60*cos(time*2) + height/3;
    ellipse(width/2, wave, 20, 20);

    //Daniel Shiffman Pendulum
    accel = (-1 * grav / r) * sin(ang);
    vel += accel;
    vel *= damp;
    ang += vel;

    pv.set(r*sin(ang), r*cos(ang), 0);
    pv.add(origin);
    fill(#AAAA00);
    stroke(1);
    line(origin.x, origin.y, pv.x, pv.y);
    ellipse(origin.x, origin.y, 5, 5);
    ellipse(pv.x, pv.y, 20, 20);


    //Draws
    for (Pivot piv : pivots) {
      piv.draw();
    }
    goal.draw();
    player.draw();

    //UI
    fill(200);
    rect(0, gameHeight, width, height);
  }

  public void keyPressed() {
    if (player != null) {
      if (keyCode == 90) player.ApplyForce(); //Z
      if (keyCode == 32) player.DetachTether(); //Spacebar
    }
  }
}
