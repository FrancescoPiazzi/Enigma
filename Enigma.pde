char CriptedKey;
boolean KPressed = false;

Keyboard keyboard = new Keyboard();

void setup(){
  size(840, 460);
  ellipseMode(CENTER);
  noStroke();
}

void draw(){
  background(200);
  keyboard.DrawGUI();
}

void mouseClicked(){
  int RotorToChange = keyboard.update(mouseX, mouseY);
  
    if(RotorToChange == 1){
      if(){
      }
    }
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
    KPressed = false; //<>//
  }
}
