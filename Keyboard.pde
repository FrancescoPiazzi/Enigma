public class Keyboard {

  final int ManButtonSize = 20;
  final int ManButtonDistance = 30;  //La distanza dei i bottoni per spostare i rotori a mano 

  final int RotorTopDistance = 80;
  final int RotorLeftDistance = 50;
  
  final int LineLength = 70;  //La lunghezza massima dell'output stampato
  
  final color DarkColor = color(20);  //TODO: creare una mini interfaccia per i colori perchè sono sia qui che in Button
  final color LightColor = color(255);

  private Button[][] buttons;
  private Rotor r1, r2, r3;
  private Reflector ref;
  private String CriptedText;
  private boolean[] TakenRotors;
  
  public Keyboard() {
    buttons = new Button[3][10];
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 10; j++){
        buttons[i][j] = new Button(j, i);
      }
    }
    r1 = new Rotor1();
    r2 = new Rotor2();
    r3 = new Rotor3();
    ref =  new Reflector1();
    CriptedText = "";
    TakenRotors = new boolean[5];
    TakenRotors[0] = true;
    TakenRotors[1] = true;
    TakenRotors[2] = true;
  }

  public void light(int k, boolean On) {
    char CharToLightUp = Letters.getLetter(k);
    buttons[Letters.getPosY(CharToLightUp)][Letters.getPosX(CharToLightUp)].pressed = On;
  }
  public void light(char CharToLightUp, boolean On) {
    buttons[Letters.getPosY(CharToLightUp)][Letters.getPosX(CharToLightUp)].pressed = On;
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
    ellipse(RotorLeftDistance*1, RotorTopDistance, ManButtonSize, ManButtonSize);
    fill(r3.Color);
    ellipse(RotorLeftDistance*2, RotorTopDistance, ManButtonSize, ManButtonSize);
    fill(r2.Color);
    ellipse(RotorLeftDistance*3, RotorTopDistance, ManButtonSize, ManButtonSize);
    fill(r1.Color);
    ellipse(RotorLeftDistance*4, RotorTopDistance, ManButtonSize, ManButtonSize);

    //Bottoni per spostare manualmente i rotori
    fill(DarkColor);
    for (int i = 1; i < 4; i++) {
      ellipse(RotorLeftDistance*(i+1), RotorTopDistance+ManButtonDistance, ManButtonSize, ManButtonSize);
      ellipse(RotorLeftDistance*(i+1), RotorTopDistance-ManButtonDistance, ManButtonSize, ManButtonSize);
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
          if (buttons[i][j].pressed) {
            fill(200, 200, 0);
            ellipse(buttons[i][j].getLeft(), buttons[i][j].getTop(), Button.ButtonSize, Button.ButtonSize);
            fill(DarkColor);
            text(Letters.getLetter(i, j), buttons[i][j].getLeft(), buttons[i][j].getTop());
          }
          else {
            fill(DarkColor);
            ellipse(buttons[i][j].getLeft(), buttons[i][j].getTop(), Button.ButtonSize, Button.ButtonSize);
            fill(LightColor);
            text(Letters.getLetter(i, j), buttons[i][j].getLeft(), buttons[i][j].getTop());
          }
        }
      }
    }
    
  }

  void update() {
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*1, 2) + Math.pow(mouseY-RotorTopDistance, 2) ) < ManButtonSize/2) { 
      if (ref instanceof Reflector1) { ref = new Reflector2(); }
      else { ref = new Reflector1(); }
    }
    
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*2, 2) + Math.pow(mouseY-RotorTopDistance+ManButtonDistance, 2) ) < ManButtonSize/2) {  r3.step(); }
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*2, 2) + Math.pow(mouseY-RotorTopDistance, 2) ) < ManButtonSize/2) { r3 = changeRotor(r3); }
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*2, 2) + Math.pow(mouseY-RotorTopDistance-ManButtonDistance, 2) ) < ManButtonSize/2) {  r3.stepBack(); }
    
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*3, 2) + Math.pow(mouseY-RotorTopDistance+ManButtonDistance, 2) ) < ManButtonSize/2) {  r2.step(); }
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*3, 2) + Math.pow(mouseY-RotorTopDistance, 2) ) < ManButtonSize/2) { r2 = changeRotor(r2); }
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*3, 2) + Math.pow(mouseY-RotorTopDistance-ManButtonDistance, 2) ) < ManButtonSize/2) {  r2.stepBack(); }
    
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*4, 2) + Math.pow(mouseY-RotorTopDistance+ManButtonDistance, 2) ) < ManButtonSize/2) {  r1.step(); }
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*4, 2) + Math.pow(mouseY-RotorTopDistance, 2) ) < ManButtonSize/2) { r1 = changeRotor(r1); }
    if (Math.sqrt(Math.pow(mouseX-RotorLeftDistance*4, 2) + Math.pow(mouseY-RotorTopDistance-ManButtonDistance, 2) ) < ManButtonSize/2) {  r1.stepBack(); }
    
    for(int i = 0; i < 3; i++){
      for (int j = 0; j < 10; j++){
        buttons[i][j].updateClickedButton();
      }
    }
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
  
  private void drawWires(){
  
  }
}
