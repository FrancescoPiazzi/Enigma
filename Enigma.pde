//{'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''}


Keyboard keyboard = new Keyboard();

char CriptedKey;
boolean KPressed = false;

Rotor2 r1 = new Rotor2();
Rotor1 r2 = new Rotor1();
Rotor3 r3 = new Rotor3();
Reflector2 reflector = new Reflector2();

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
    CriptedKey = keyboard.cript(keyCode, r1, r2, r3, reflector);
    keyboard.light(CriptedKey, true);
    KPressed = true;
  }
}

void keyReleased(){
  if (key != CODED){
    keyboard.light(CriptedKey, false);
    KPressed = false;
  }
}
