void setup() { //<>//
  size(840, 460);
  ellipseMode(CENTER);
  noStroke();
}


void draw() {
  background(200);
  
  DrawGUI();
}

void DrawGUI(){
  
  final int ButtonSize = 40;
  
  final int TopDistance = 200;
  final int VerticalDistance = 70;
  final int LeftDistance = 100;
  final int HorizontalDistance = 70;

  for(int i = 0; i < 3; i++){
    for (int j = 0; j < 10; j++){
      if ((i != 1 || j != 9) && (i != 2 || j != 8) && (i != 2 || j != 9)){
        fill(30);
        ellipse(LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance, ButtonSize, ButtonSize);
        fill(250);
        text(Letters[i][j], LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
      }
    }
  }
  
}
