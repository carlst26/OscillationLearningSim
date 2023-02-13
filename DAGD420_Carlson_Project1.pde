// Copyright Tyger Carlson 2023
// Visualization Tools - Oscillation


Player player;
Pivot[] pivots;
Goal goal;

float dt, prevTime;
float time;
int pivotSpacing;


  PVector pv = new PVector(), origin = new PVector(width/2, height/3);
  float R = 40;
  float ang = PI/4;
  float grav = .4;
  float accel = 0.0;
  float damp = .995;
  float vel = 0.0;

  float pacer = width*2/3;
  float pace = 1;
  
void setup() {
  size(800, 500);
  prevTime = 0;
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
  println(time);
  float wave = 60*cos(time*2) + height/3;
  ellipse(width/2, wave, 20, 20);
  
  if((int)time % 2 == 0) pace *= -1;
  pacer += 2 * pace;
  ellipse(pacer, height/8, 10, 10);

  //Daniel Shiffman Pendulum
  accel = (-1 * grav / R) * sin(ang);
  vel += accel;
  vel *= damp;
  ang += vel;

  pv.set(R*sin(ang), R*cos(ang), 0);
  pv.add(origin);
  fill(#AAAA00);
  line(origin.x, origin.y, pv.x, pv.y);
  ellipse(pv.x, pv.y, 20, 20);






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
