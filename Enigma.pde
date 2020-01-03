Keyboard keyboard = new Keyboard();

//Colors colors = new Colors();
char CriptedKey;
boolean KPressed = false;

void setup(){
  size(840, 460);
  ellipseMode(CENTER);
  noStroke();
}

void draw(){
  keyboard.DrawGUI();
}

void mouseClicked(){
  keyboard.update();
}

void keyPressed(){
  if (key != CODED && !KPressed){
    CriptedKey = keyboard.cript(keyCode);
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
