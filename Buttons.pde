public class Keyboard {

  final int ButtonSize = 40;

  final int TopDistance = 200;
  final int VerticalDistance = 70;
  final int LeftDistance = 100;
  final int HorizontalDistance = 70;

  private boolean[][] buttonsPressed;

  public Keyboard() {
    buttonsPressed = new boolean[3][10];
  }

  public void lightUp(int k) {
    char CharToLightUp = Letters.getLetter(k);
    buttonsPressed[Letters.getPosX(CharToLightUp)][Letters.getPosY(CharToLightUp)] = true;
  }
  
  public void lightDown(int k) {
    char CharToLightUp = Letters.getLetter(k);
    buttonsPressed[Letters.getPosX(CharToLightUp)][Letters.getPosY(CharToLightUp)] = false;
  }



  void DrawGUI() {
    
    color btnColor;
    color textColor;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 10; j++) {
        if ((i != 1 || j != 9) && (i != 2 || j != 8) && (i != 2 || j != 9)) {
          if (buttonsPressed[i][j]){
            btnColor = color(200, 200, 0);
            textColor = color(20);
          }
          else {
            btnColor = color(30);
            textColor = color(250);
          }
          fill(btnColor);
          ellipse(LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance, ButtonSize, ButtonSize);
          fill(textColor);
          text(Letters.getLetter(i, j), LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
        }
      }
    }
  }
}
