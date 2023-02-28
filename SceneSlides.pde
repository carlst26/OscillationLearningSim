class SceneSlides extends Scene {
  int currentSlide;

  //slide0 square
  float objectPos, flip;

  //Pendulum
  PVector pv, origin;
  float r, ang, grav, accel, damp, vel, mass, startAng;

  //Buttons
  int buttonW, buttonH;
  Button nextButton, prevButton, playButton, exitButton;
  Button active1, active2;

  float titleFS;

  SceneSlides() {
    currentSlide = 0;
    buttonW = 80;
    buttonH = 50;

    objectPos = (height*2/3 + 120)/2;
    flip = 1;

    //Pendulum
    r = 150; //TetherLength
    startAng = PI/5;
    ang = startAng;
    grav = .4;
    accel = 0.0;
    damp = .997;
    vel = 0.0;
    mass = 1;
    pv = new PVector();
    origin = new PVector(width/2, height/2+60);

    titleFS = 50;

    prevButton = new Button(width*2/8, height*7/8, buttonW, buttonH, deeppurple, deepyellow, "<", 32);
    exitButton = new Button(width*1/8, height*7/8, buttonW, buttonH, deeppurple, violet, "Menu", 20);
    nextButton = new Button(width*6/8, height*7/8, buttonW, buttonH, deeppurple, deepyellow, ">", 32);
    playButton = new Button(width*7/8, height*7/8, buttonW*3/2, buttonH*3/2, orange, deeporange, "Play", 40);
  }

  public void update() {
  }

  public void draw() {
    background(deeppurple);

    //Check active Slide
    if (currentSlide == 0) slide0();
    else if (currentSlide == 1) slide1();
    else if (currentSlide == 2) slide2();
    else if (currentSlide == 3) slide3();

    //Buttons
    if (currentSlide == 0) active1 = exitButton;
    else active1 = prevButton;
    if (currentSlide == 3) active2 = playButton;
    else active2 = nextButton;

    active1.draw();
    active2.draw();
  }
  public void mousePressed() {
    if (active1 == exitButton && active1.isHovering) gameState = new SceneTitle();
    if (active2 == playButton && active2.isHovering) gameState = new SceneGame();

    if (active1 == prevButton && active1.isHovering) currentSlide--;
    if (active2 == nextButton && active2.isHovering) currentSlide++;
  }
  public void keyPressed() {
  }

  //What is Oscillation?
  void slide0() {
    textAlign(CENTER, CENTER);
    textFont(header);
    fill(255);
    text("What is Oscillation?", width/2, 50);

    textAlign(LEFT, TOP);
    textFont(body);
    textSize(20);
    fill(yellow);
    text("Oscillation is Periodic Motion in which an object moves \nback and forth from a fixed position.", 50, height/3 -50);

    textFont(body);
    textSize(20);
    fill(orange);
    text("What does this mean?", 50, height/2 - 40);

    textFont(body);
    fill(deeporange);
    text("Periodic motion is movement repeated in equal intervals of time. \nThis means oscillating objects must have an \"equilibrium point\" that \nthey pass through when moving to and fro, and move at a set pace.", 75, height/2 -10);

    //textAlign(L, CENTER);
    textFont(body);
    textSize(20);
    fill(yellow);
    text("Basically, oscillations are \"slow\" vibrations!", 50, height*3/4-30);

    if (objectPos >= height*2/3) flip = -1;
    if (objectPos <= 120) flip = 1;
    objectPos += dt * 120 * flip;
    
    strokeCap(SQUARE);
    strokeWeight(2);
    fill(violet);
    stroke(violet);
    line(width*7/8, height*2/3+20, width*7/8, 120+20);
    ellipse(width*7/8, (height*2/3 + 120)/2 + 20, 10, 10);

    strokeWeight(5);
    fill(red);
    stroke(red);
    rect(width*7/8-20, objectPos, 40, 40);
  }

  //What is NOT Oscillation?
  void slide1() {
    textAlign(CENTER, CENTER);
    textFont(header);
    fill(255);
    text("What is NOT Oscillation?", width/2, 50);

    textAlign(LEFT, TOP);
    textFont(body);
    textSize(20);
    fill(yellow);
    text("All oscillatory motion is periodic, but not \nall periodic motion is oscillatory.", 50, height/3 -50);

    textFont(body);
    fill(deeporange);
    text("A planet orbiting the sun is repetitive and has a \nregular interval, but does not move back and forth \nfrom a fixed point. Therefore, a planet is periodic \nbut not oscillatory motion.", 50, height/2 -10);

    PVector orbit = new PVector(110*cos(-time/3), 60*sin(-time/3));

    pushMatrix();
    translate(width*3/4, height/2 - 10);
    rotate(PI/5);
    strokeWeight(1);
    fill(yellow);
    stroke(yellow);
    ellipse(0, 0, 30, 30);


    noFill();
    stroke(violet);
    ellipse(0, 0, 220, 120);
    strokeWeight(5);
    fill(red);
    stroke(red);
    ellipse(orbit.x, orbit.y, 10, 10);
    popMatrix();
  }

  //Simple Harmonic Motion
  void slide2() {
    textAlign(CENTER, CENTER);
    textFont(header);
    text("Simple Harmonic Motion", width/2, 50);

    //Pendulum
    accel = -(mass * grav / r) * sin(ang);
    vel += accel;
    //no damping!
    ang += vel;
    pendulum();
    
    textFont(body);
    //text(vel*10, 50, height/2);
    //text(accel*10, 50, height/2 + 20);
    
    textAlign(LEFT, TOP);
    textFont(body);
    textSize(20);
    fill(yellow);
    text("SHM follows Hooke's Law: F = -kx", 50, height/3 -50);
    
    textFont(body);
    fill(orange);
    text("Hooke's Law states that the Force (F) moving the object will always push it toward the \nequilibrium position.", 75, height/3-20);
    
    fill(deeporange);
    text("In a pendulum, this force is its acceleration. This means a pendulum will always have the \nmost acceleration force at the top of the swing, and have no acceleration at the base of \nits swing when it is the fastest.", 50, height/2-40);

    

  }

  //Damped Harmonic Motion
  void slide3() {
    textAlign(CENTER, CENTER);
    textFont(header);
    text("Damped Harmonic Motion", width/2, 50);

    //Pendulum
    accel = -(mass * grav / r) * sin(ang);
    vel += accel;
    vel *= damp;
    ang += vel;
    pendulum();
    
    textAlign(LEFT, TOP);
    textFont(body);
    textSize(20);
    fill(yellow);
    text("Damping gradually reduces the magnitude of oscillations.", 50, height/3 -50);

    fill(orange);
    text("In this case, damping = friction!", 50, height/3);
    
    
  }

  //slides 2 and 3 handle the math
  void pendulum() { //Draws
    //Set bob position
    pv.set(r*sin(ang), r*cos(ang));
    pv.add(origin);
    
    //Motion "Silhouette"
    noFill();
    strokeWeight(2);
    stroke(violet);
    line(origin.x, origin.y, origin.x, origin.y+r); //Equilibrium Line
    arc(origin.x, origin.y, r*2, r*2, PI/2 - startAng, PI/2 + startAng); //Arc Path
    fill(violet);
    ellipse(origin.x, origin.y+r, 6, 6); //Equilibrium Point

    //Rod    
    strokeCap(SQUARE);
    strokeWeight(2);
    stroke(deeporange);
    line(origin.x, origin.y, pv.x, pv.y);

    noStroke();
    fill(yellow);
    ellipse(origin.x, origin.y, 8, 8); //Pivot Origin
    fill(red);
    ellipse(pv.x, pv.y, 30, 30); //Bob
  }
}
