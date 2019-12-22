Buttons buttons = new Buttons();

void setup() {
  size(840, 460);
  ellipseMode(CENTER);
  noStroke();
}


void draw() {
  background(200);
  
  buttons.DrawGUI();
}

void keyPressed(){
  if (key != CODED){
    buttons.lightUp(keyCode);
  }
}
