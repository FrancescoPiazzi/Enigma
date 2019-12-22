public class Buttons {

  private Button[][] buttons;
  
  public Buttons() {
    letters = new char[3][10];
    buttons = new Button[3][10];
    initletters();
  }
  
  public void lightUp(int k){
    color lightUpColor = color (200, 200, 0);
    
    switch (k){
    
      case 65:
        fill(lightUpColor);
        ellipse(LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance, ButtonSize, ButtonSize);
        fill(20);
        text(letters[i][j], LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
        break;
    }
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
          text(letters[i][j], LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
        }
      }
    }
  
  }
  
}

class Button{
  
  private boolean pressed;
  private char ch;
  
  int x, y;

  Button(char ch){
    this.ch = ch;
    pressed = false;
  }
  
  char getCh(){
    return ch;
  }
  
  boolean isPressed(){
    return pressed;
  }
}
