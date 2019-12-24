Keyboard keyboard = new Keyboard();

char CriptedKey;
boolean KPressed = false;
Rotor1 r1 = new Rotor1();

void setup() {
  size(840, 460);
  ellipseMode(CENTER);
  noStroke();
}


void draw() {
  background(200);
  
  keyboard.DrawGUI();
}

void keyPressed(){
  if (key != CODED && !KPressed){
    CriptedKey = keyboard.cript(keyCode, r1, r1, r1);
    keyboard.light(CriptedKey, true); //<>//
    KPressed = true;
  }
}

void keyReleased(){
  if (key != CODED){
    keyboard.light(CriptedKey, false); //<>//
    KPressed = false;
  }
}
