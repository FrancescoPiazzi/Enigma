Keyboard keyboard = new Keyboard();

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
    //char CriptedKey = keyboard.cript(keyCode);
    keyboard.lightUp(keyCode);
  }
}

void keyReleased(){
  if (key != CODED){
    keyboard.lightDown(keyCode);
  }
}
