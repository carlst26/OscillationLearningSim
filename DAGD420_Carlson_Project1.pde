// Copyright Tyger Carlson 2023
// Visualization Tools - Oscillation


Player player;
Pivot[] pivots;
Goal goal;

float dt, prevTime = 0;
float time;
int pivotSpacing;

void setup() {
  size(800, 500);
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
}

void draw() {
  calcDeltaTime();
  background(240);

  //Samples
  time = (float)millis()/1000;
  float wave = 60*cos(time) + height/3;
  ellipse(width/2, wave, 20, 20);


  //Updates
  player.update();
  goal.update();
  for (Pivot piv : pivots) {
    piv.update();
  }

  //Draws
  for (Pivot piv : pivots) {
    piv.draw();
  }
  goal.draw();
  player.draw();

  //UI
}

void keyPressed() {
  if (player != null) {
    if (keyCode == 90) player.ApplyForce(); //Z
    if (keyCode == 32) player.DetachTether(); //Spacebar
  }
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime)/1000.0;
  prevTime = currTime;
}
