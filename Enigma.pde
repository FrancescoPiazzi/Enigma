char CriptedKey;
String CriptedText = new String();
boolean KPressed = false;

Rotor2 r1 = new Rotor2();
Rotor5 r2 = new Rotor5();
Rotor4 r3 = new Rotor4();
Reflector2 reflector = new Reflector2();

Keyboard keyboard = new Keyboard(r1, r2, r3, reflector);

void setup(){
  size(840, 460);
  ellipseMode(CENTER);
  noStroke();
}

void draw(){
  background(200);
  keyboard.DrawGUI(CriptedText);
}

void mouseClicked(){
  keyboard.update(mouseX, mouseY);
}

void keyPressed(){
  if (key != CODED && !KPressed){
    if(keyCode == 32){
      CriptedText = CriptedText + ' ';
    }
    else{
      CriptedKey = keyboard.cript(keyCode, r1, r2, r3, reflector);
      keyboard.light(CriptedKey, true);
      CriptedText = CriptedText + CriptedKey;
      KPressed = true;
    } //<>//
  }
}

void keyReleased(){
  if (key != CODED){
    keyboard.light(CriptedKey, false);
    KPressed = false;
  }
}
