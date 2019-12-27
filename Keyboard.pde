public class Keyboard {

  final int KeySize = 40;
  final int ButtonSize = 20;

  final int TopDistance = 200;
  final int VerticalDistance = 70;
  final int LeftDistance = 100;
  final int HorizontalDistance = 70;
  
  final int ManButtonDistance = 30;  //La distanza dei i bottoni per spostare i rotori a mano 

  final int RotorTopDistance = 80;
  final int RotorLeftDistance = 50;

  final color DarkColor = color(20);
  final color LightColor = color(255);
  //final color DarkButtonColor = color(20);
  //inal color LightButtonColor = color(255);
  
  final int LineLength = 70;  //La lunghezza massima dell'output stampato

  private boolean[][] buttonsPressed;
  private Rotor r1, r2, r3;
  private Reflector ref;
  private String CriptedText;
  private boolean[] TakenRotors = new boolean[5];

  /*public Keyboard(Rotor r1, Rotor r2, Rotor r3, Reflector ref) {
    buttonsPressed = new boolean[3][10];
    this.r1 = r1;
    this.r2 = r2;
    this.r3 = r3;
    this.ref = ref;
    CriptedText = "";
  }*/
  
  public Keyboard() {
    buttonsPressed = new boolean[3][10];
    this.r1 = new Rotor1();
    this.r2 = new Rotor2();
    this.r3 = new Rotor3();
    this.ref =  new Reflector1();
    CriptedText = "";
    TakenRotors[0] = true;
    TakenRotors[1] = true;
    TakenRotors[2] = true;
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

      if (r1.step()) {
        if (r2.step()) {
          r3.step();
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
    
    //Testo tradotto
    fill(DarkColor);
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
    fill(r3.Color);
    ellipse(RotorLeftDistance*2, RotorTopDistance, ButtonSize, ButtonSize);
    fill(r2.Color);
    ellipse(RotorLeftDistance*3, RotorTopDistance, ButtonSize, ButtonSize);
    fill(r1.Color);
    ellipse(RotorLeftDistance*4, RotorTopDistance, ButtonSize, ButtonSize);

    //Bottoni per spostare manualmente i rotori
    fill(DarkColor);
    for (int i = 1; i < 4; i++) {
      ellipse(RotorLeftDistance*(i+1), RotorTopDistance+ManButtonDistance, ButtonSize, ButtonSize);
      ellipse(RotorLeftDistance*(i+1), RotorTopDistance-ManButtonDistance, ButtonSize, ButtonSize);
    }

    //Testo rotori
    fill(DarkColor);
    text(r1.getPos(), RotorLeftDistance*4, RotorTopDistance);
    text(r2.getPos(), RotorLeftDistance*3, RotorTopDistance);
    text(r3.getPos(), RotorLeftDistance*2, RotorTopDistance);
    text(ref.getID(), RotorLeftDistance*1, RotorTopDistance);

    //Tastiera
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 10; j++) {
        if ((i != 1 || j != 9) && (i != 2 || j != 8) && (i != 2 || j != 9)) {
          if (buttonsPressed[i][j]) {
            fill(200, 200, 0);
            ellipse(LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance, KeySize, KeySize);
            fill(DarkColor);
            text(Letters.getLetter(i, j), LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
          }
          else {
            fill(DarkColor);
            ellipse(LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance, KeySize, KeySize);
            fill(LightColor);
            text(Letters.getLetter(i, j), LeftDistance + i*20 + j*HorizontalDistance, VerticalDistance*i + TopDistance);
          }
        }
      }
    }
  }

  void update(float x, float y) {
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*1, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { 
      if (ref instanceof Reflector1) { ref = new Reflector2(); }
      else { ref = new Reflector1(); }
    }
    
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*2, 2) + Math.pow(y-RotorTopDistance+ManButtonDistance, 2) ) < ButtonSize/2) {  r3.step(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*2, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { r3 = changeRotor(r3); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*2, 2) + Math.pow(y-RotorTopDistance-ManButtonDistance, 2) ) < ButtonSize/2) {  r3.stepBack(); }
    
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*3, 2) + Math.pow(y-RotorTopDistance+ManButtonDistance, 2) ) < ButtonSize/2) {  r2.step(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*3, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { r2 = changeRotor(r2); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*3, 2) + Math.pow(y-RotorTopDistance-ManButtonDistance, 2) ) < ButtonSize/2) {  r2.stepBack(); }
    
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*4, 2) + Math.pow(y-RotorTopDistance+ManButtonDistance, 2) ) < ButtonSize/2) {  r1.step(); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*4, 2) + Math.pow(y-RotorTopDistance, 2) ) < ButtonSize/2) { r1 = changeRotor(r1); }
    if (Math.sqrt(Math.pow(x-RotorLeftDistance*4, 2) + Math.pow(y-RotorTopDistance-ManButtonDistance, 2) ) < ButtonSize/2) {  r1.stepBack(); }
    
  }
  
  private Rotor changeRotor(Rotor r){
    
    if (r instanceof Rotor1){
      r = firstRotorAvailable(2);
      TakenRotors[0] = false;
    }
    else if (r instanceof Rotor2){
      r = firstRotorAvailable(3);
      TakenRotors[1] = false;
    }
    else if (r instanceof Rotor3){
      r = firstRotorAvailable(4);
      TakenRotors[2] = false;
    }
    else if (r instanceof Rotor4){
      r = firstRotorAvailable(5);
      TakenRotors[3] = false;
    }
    else if (r instanceof Rotor5){
      r = firstRotorAvailable(1);
      TakenRotors[4] = false;
    }
      
    return r;  //In teoria non dovrei mai arrivarci ma se non lo metto processing mi insulta
  }
  
  private Rotor firstRotorAvailable(int firstPossibleRotor){
   firstPossibleRotor--;    //I rotori possibili vanno da 1 a 5 ma lo uso come indice di un array con celle che vanno da 0 a 4
    while (TakenRotors[firstPossibleRotor]){
      if(firstPossibleRotor == 4){
        firstPossibleRotor = 0;
      }
      else{
        firstPossibleRotor++;
      }
    }
    
    switch (firstPossibleRotor){
      case 0:
        TakenRotors[0] = true;
        return new Rotor1();
      case 1:
        TakenRotors[1] = true;
        return new Rotor2();
      case 2:
        TakenRotors[2] = true;
        return new Rotor3();
      case 3:
        TakenRotors[3] = true;
        return new Rotor4();
      case 4:
        TakenRotors[4] = true;
        return new Rotor5();
      default:
        return new Rotor1();  //In teoria non dovrei mai arrivarci ma se non lo metto processing mi insulta pt.2
    }
      
  }
  
}
