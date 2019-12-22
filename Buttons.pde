public class Buttons {
  
  final int ButtonSize = 40;
  
  final int TopDistance = 200;
  final int VerticalDistance = 70;
  final int LeftDistance = 100;
  final int HorizontalDistance = 70;

  private Button[][] buttons;
  
  public Buttons() {
    buttons = new Button[3][10];
  }
  
  public void lightUp(int k){
    
    char CharToLightUp = 'a';
    color lightUpColor = color (200, 200, 0);
    fill(lightUpColor);
    
    switch (k){
    
      case 65:
        CharToLightUp = 'b';

    }
    
    ellipse(LeftDistance + Letters.getPosX(CharToLightUp)*20 + Letters.getPosY(CharToLightUp)*HorizontalDistance, VerticalDistance*Letters.getPosX(CharToLightUp) + TopDistance, ButtonSize, ButtonSize);
    fill(20);
    text(Letters.getPosX(CharToLightUp), LeftDistance + Letters.getPosX(CharToLightUp)*20 + Letters.getPosY(CharToLightUp)*HorizontalDistance, VerticalDistance*Letters.getPosX(CharToLightUp) + TopDistance);

  }
  
  
  
void DrawGUI(){

    for(int i = 0; i < 3; i++){
      for (int j = 0; j < 10; j++){
        if ((i != 1 || j != 9) && (i != 2 || j != 8) && (i != 2 || j != 9)){
          fill(30);
          ellipse(LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance, ButtonSize, ButtonSize);
          fill(250);
          text(Letters.getLetter(i, j), LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
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
