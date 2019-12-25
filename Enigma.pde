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
    //TODO trovare un modo di scrivere meglio sta cosa
    if(RotorToChange == 3){
      if(keyboard.r1 instanceof Rotor1){
        keyboard.r1 = new Rotor2();
      }
      else if(keyboard.r1 instanceof Rotor2){
        keyboard.r1 = new Rotor3();
      }
      else if(keyboard.r1 instanceof Rotor3){
        keyboard.r1 = new Rotor4();
      }
      else if(keyboard.r1 instanceof Rotor4){
        keyboard.r1 = new Rotor5();
      }
      else{
        keyboard.r1 = new Rotor1();
      }
    }
     //<>//
    if(RotorToChange == 2){
      if(keyboard.r2 instanceof Rotor1){
        keyboard.r2 = new Rotor2();
      }
      else if(keyboard.r2 instanceof Rotor2){
        keyboard.r2 = new Rotor3();
      }
      else if(keyboard.r2 instanceof Rotor3){
        keyboard.r2 = new Rotor4();
      }
      else if(keyboard.r2 instanceof Rotor4){
        keyboard.r2 = new Rotor5();
      }
      else{
        keyboard.r2 = new Rotor1();
      }
    }
    
    if(RotorToChange == 1){
      if(keyboard.r3 instanceof Rotor1){
        keyboard.r3 = new Rotor2();
      }
      else if(keyboard.r3 instanceof Rotor2){
        keyboard.r3 = new Rotor3();
      }
      else if(keyboard.r3 instanceof Rotor3){
        keyboard.r3 = new Rotor4();
      }
      else if(keyboard.r3 instanceof Rotor4){
        keyboard.r3 = new Rotor5();
      }
      else{
        keyboard.r3 = new Rotor1();
      }
    }
    
    if(RotorToChange == 0){
      if(keyboard.ref instanceof Reflector1){
        keyboard.ref = new Reflector2();
      }
      else{
        keyboard.ref = new Reflector1();
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
    KPressed = false;
  }
}
