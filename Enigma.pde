Keyboard keyboard = new Keyboard();

char CriptedKey;
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
  if (key != CODED){
    CriptedKey = keyboard.cript(keyCode, r1, r1, r1);
    keyboard.lightUp(CriptedKey); //<>//
  }
}

void keyReleased(){
  if (key != CODED){
    keyboard.lightDown(CriptedKey); //<>//
  }
}
