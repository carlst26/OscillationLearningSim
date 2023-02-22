// Copyright Tyger Carlson 2023
// Visualization Tools - Oscillation




float dt, prevTime;
float time;

Scene gameState;

void setup() {
  size(800, 500);
  prevTime = 0;
  
}

void draw() {
  calcDeltaTime();
  background(240);
}

void mainMenu() {
  
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime)/1000.0;
  prevTime = currTime;
}
