// Copyright Tyger Carlson 2023
// Visualization Tools - Oscillation




float dt, prevTime;
float time;
color purple, violet, deepred, red, deeporange, orange, yellow;
Scene gameState;

void setup() {
  size(800, 500);
  prevTime = 0;
  
  assignColors();
  gameState = new SceneTitle();
}

void draw() {
  time = (float)millis()/1000;
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
    fill(255, 50); //Alpha channel for transparency
    rect(x, y, w, h);
    popMatrix();
    return true;
  } else
    //returns false if it doesn't pass the check
    return false;
}

//Dusk color palette
void assignColors() {
  purple = #432967;
  violet = #782D65;
  deepred = #C3305D;
  red = #F0445E;
  deeporange = #D86349;
  orange = #FD9367;
  yellow = #FDCD83;
}
