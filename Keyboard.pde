public class Keyboard {

  final int KeySize = 40;
  final int ButtonSize = 20;

  final int TopDistance = 200;
  final int VerticalDistance = 70;
  final int LeftDistance = 100;
  final int HorizontalDistance = 70;

  final int RotorTopDistance = 80;
  final int RotorLeftDistance = 50;

  private boolean[][] buttonsPressed;

  public Keyboard() {
    buttonsPressed = new boolean[3][10];
  }

  public void light(int k, boolean On) {
    char CharToLightUp = Letters.getLetter(k);
    buttonsPressed[Letters.getPosY(CharToLightUp)][Letters.getPosX(CharToLightUp)] = On;
  }
  public void light(char CharToLightUp, boolean On) {
    buttonsPressed[Letters.getPosY(CharToLightUp)][Letters.getPosX(CharToLightUp)] = On;
  }


  public char cript(int k, Rotor r1, Rotor r2, Rotor r3, Reflector ref) {

    char CriptedChar = Letters.getLetter(k);

    CriptedChar = r1.convert(CriptedChar);
    CriptedChar = r2.convert(CriptedChar);
    CriptedChar = r3.convert(CriptedChar); //<>//
    CriptedChar = ref.convert(CriptedChar);
    CriptedChar = r3.reverseConvert(CriptedChar);
    CriptedChar = r2.reverseConvert(CriptedChar);
    CriptedChar = r1.reverseConvert(CriptedChar);

    if (r1.increaseCounter()) {
      if (r2.increaseCounter()) {
        r3.increaseCounter(); //<>//
      }
    }

    return CriptedChar;
  }

  void DrawGUI(Rotor r1, Rotor r2, Rotor r3, Reflector ref) {

    color btnColor = color(255);
    color textColor = color(20);

    fill(ref.Color);
    ellipse(RotorLeftDistance*1, RotorTopDistance, ButtonSize, ButtonSize);
    fill(r1.Color);
    ellipse(RotorLeftDistance*2, RotorTopDistance, ButtonSize, ButtonSize);
    fill(r2.Color);
    ellipse(RotorLeftDistance*3, RotorTopDistance, ButtonSize, ButtonSize);
    fill(r3.Color);
    ellipse(RotorLeftDistance*4, RotorTopDistance, ButtonSize, ButtonSize);
    
    fill(btnColor);
    for(int i = 0; i < 4; i++){
      ellipse(RotorLeftDistance*(i+1), RotorTopDistance+KeySize, ButtonSize, ButtonSize);
      ellipse(RotorLeftDistance*(i+1), RotorTopDistance-KeySize, ButtonSize, ButtonSize);
    }
    
    fill(textColor);
    text(r1.getPos(), RotorLeftDistance*4, RotorTopDistance);
    text(r2.getPos(), RotorLeftDistance*3, RotorTopDistance);
    text(r3.getPos(), RotorLeftDistance*2, RotorTopDistance);
    text(ref.getID(), RotorLeftDistance*1, RotorTopDistance);
    
    
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 10; j++) {
        if ((i != 1 || j != 9) && (i != 2 || j != 8) && (i != 2 || j != 9)) {
          if (buttonsPressed[i][j]) {
            btnColor = color(200, 200, 0);
            textColor = color(20);
          } else {
            btnColor = color(20);
            textColor = color(250);
          }
          fill(btnColor);
          ellipse(LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance, KeySize, KeySize);
          fill(textColor);
          text(Letters.getLetter(i, j), LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
        }
      }
    }
  }

  void update(float x, float y) {
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*1, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { System.out.println("Reflector"); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*2, 2) + Math.pow(y-RotorTopDistance+KeySize, 2) ) < ButtonSize/2) { r3.increaseCounter(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*2, 2) + Math.pow(y-RotorTopDistance-KeySize, 2) ) < ButtonSize/2) { r3.decreaseCounter(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*3, 2) + Math.pow(y-RotorTopDistance+KeySize, 2) ) < ButtonSize/2) { r2.increaseCounter(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*3, 2) + Math.pow(y-RotorTopDistance-KeySize, 2) ) < ButtonSize/2) { r2.decreaseCounter(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*4, 2) + Math.pow(y-RotorTopDistance+KeySize, 2) ) < ButtonSize/2) { r1.increaseCounter(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*4, 2) + Math.pow(y-RotorTopDistance-KeySize, 2) ) < ButtonSize/2) { r1.decreaseCounter(); }
  }
}
