public class Keyboard {

  final int KeySize = 40;
  final int ButtonSize = 20;

  final int TopDistance = 200;
  final int VerticalDistance = 70;
  final int LeftDistance = 100;
  final int HorizontalDistance = 70;

  final int RotorTopDistance = 80;
  final int RotorLeftDistance = 50;

  final color DarkColor = color(20);
  final color LightColor = color(255);
  //final color DarkButtonColor = color(20);
  //inal color LightButtonColor = color(255);
  
  final int LineLength = 70;  //La lunghezza massima dell'output stampato

  private boolean[][] buttonsPressed;
  Rotor r1, r2, r3;
  Reflector ref;
  private String CriptedText;

  public Keyboard(Rotor r1, Rotor r2, Rotor r3, Reflector ref) {
    buttonsPressed = new boolean[3][10];
    this.r1 = r1;
    this.r2 = r2;
    this.r3 = r3;
    this.ref = ref;
    CriptedText = "";
  }
  
  public Keyboard() {
    buttonsPressed = new boolean[3][10];
    this.r1 = new Rotor1();
    this.r2 = new Rotor2();
    this.r3 = new Rotor3();
    this.ref =  new Reflector1();
    CriptedText = "";
  }

  public void light(int k, boolean On) {
    char CharToLightUp = Letters.getLetter(k);
    buttonsPressed[Letters.getPosY(CharToLightUp)][Letters.getPosX(CharToLightUp)] = On;
  }
  public void light(char CharToLightUp, boolean On) {
    buttonsPressed[Letters.getPosY(CharToLightUp)][Letters.getPosX(CharToLightUp)] = On;
  }

  public char cript(int k) {
    char CriptedChar;
    if (k != 32) {
      CriptedChar = Letters.getLetter(k);
      CriptedChar = r1.convert(CriptedChar);
      CriptedChar = r2.convert(CriptedChar);
      CriptedChar = r3.convert(CriptedChar);
      CriptedChar = ref.convert(CriptedChar);
      CriptedChar = r3.reverseConvert(CriptedChar);
      CriptedChar = r2.reverseConvert(CriptedChar);
      CriptedChar = r1.reverseConvert(CriptedChar);

      if (r1.increaseCounter()) {
        if (r2.increaseCounter()) {
          r3.increaseCounter();
        }
      }
    }
    else {
      CriptedChar = ' ';
    }
    
    if(CriptedChar != '0'){
      CriptedText = CriptedText + CriptedChar;
    }
    return CriptedChar;
  }

  void DrawGUI() {
    color btnColor = LightColor;
    color textColor = DarkColor;
    
    //Testo tradotto
    fill(textColor);
    if (CriptedText.length() < LineLength){
      text(CriptedText, 450-CriptedText.length()*2, 80);
    }
    else{
      CriptedText = CriptedText.substring(CriptedText.length()-LineLength, CriptedText.length());
      text(CriptedText, 450-CriptedText.length()*2, 80);
    }

    //Colore per identificare i rotori
    fill(ref.Color);
    ellipse(RotorLeftDistance*1, RotorTopDistance, ButtonSize, ButtonSize);
    fill(r1.Color);
    ellipse(RotorLeftDistance*2, RotorTopDistance, ButtonSize, ButtonSize);
    fill(r2.Color);
    ellipse(RotorLeftDistance*3, RotorTopDistance, ButtonSize, ButtonSize);
    fill(r3.Color);
    ellipse(RotorLeftDistance*4, RotorTopDistance, ButtonSize, ButtonSize);

    //Bottoni per spostare manualmente i rotori
    fill(btnColor);
    for (int i = 0; i < 4; i++) {
      ellipse(RotorLeftDistance*(i+1), RotorTopDistance+KeySize, ButtonSize, ButtonSize);
      ellipse(RotorLeftDistance*(i+1), RotorTopDistance-KeySize, ButtonSize, ButtonSize);
    }

    //Testo rotori
    fill(textColor);
    text(r1.getPos(), RotorLeftDistance*4, RotorTopDistance);
    text(r2.getPos(), RotorLeftDistance*3, RotorTopDistance);
    text(r3.getPos(), RotorLeftDistance*2, RotorTopDistance);
    text(ref.getID(), RotorLeftDistance*1, RotorTopDistance);

    //Tastiera
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 10; j++) {
        if ((i != 1 || j != 9) && (i != 2 || j != 8) && (i != 2 || j != 9)) {
          if (buttonsPressed[i][j]) {
            btnColor = color(200, 200, 0);
            textColor = DarkColor;
          } 
          else {
            btnColor = DarkColor;
            textColor = LightColor;
          }
          fill(btnColor);
          ellipse(LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance, KeySize, KeySize);
          fill(textColor);
          text(Letters.getLetter(i, j), LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
        }
      }
    }
  }

  int update(float x, float y) {
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*1, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { return 0; }
    
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*2, 2) + Math.pow(y-RotorTopDistance+KeySize, 2) ) < ButtonSize/2) {  r3.increaseCounter(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*2, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { return 3; }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*2, 2) + Math.pow(y-RotorTopDistance-KeySize, 2) ) < ButtonSize/2) {  r3.decreaseCounter(); }
    
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*3, 2) + Math.pow(y-RotorTopDistance+KeySize, 2) ) < ButtonSize/2) {  r2.increaseCounter(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*3, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { return 2; }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*3, 2) + Math.pow(y-RotorTopDistance-KeySize, 2) ) < ButtonSize/2) {  r2.decreaseCounter(); }
    
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*4, 2) + Math.pow(y-RotorTopDistance+KeySize, 2) ) < ButtonSize/2) {  r1.increaseCounter(); } //<>//
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*4, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { return 1; }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*4, 2) + Math.pow(y-RotorTopDistance-KeySize, 2) ) < ButtonSize/2) {  r1.decreaseCounter(); }
    
    return -1;
  }
  
}
