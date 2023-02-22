// Copyright Tyger Carlson 2023
// Visualization Tools - Oscillation




float dt, prevTime;
Scene gameState;

void setup() {
  size(800, 500);
  prevTime = 0;

  gameState = new SceneTitle();
}

void draw() {
  calcDeltaTime();
  background(240);

  gameState.update();

  gameState.draw();
}

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime)/1000.0;
  prevTime = currTime;
}

void mousePressed() {
  gameState.mousePressed();
}

void keyPressed() {
  gameState.keyPressed();
}

// Thank you Quynh!
boolean isMouseHover(float x, float y, int w, int h) { // Button - put in Main class to be accessible from ANY CLASS
  if (mouseX >= x && mouseX <= ( x + w ) && mouseY >= y && mouseY <= ( y + h) ) { //When mouse over button:
    pushMatrix(); //just so it doesnt change the colors of stuff outside of the push Matrix (dont need push & popMatrices)
    fill(255, 100); //Alpha channel for transparency
    rect(x, y, w, h);
    popMatrix();
    return true;
  } else
    //returns false if it doesn't pass the check
    return false;
}
