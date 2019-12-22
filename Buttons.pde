public static class Buttons {

  private char[][] Letters = new char[3][10];
  
  public Buttons() {
    initLetters();
  }
  
  private void initLetters(){
    Letters[0][0] = 'q';
    Letters[0][1] = 'w';
    Letters[0][2] = 'e';
    Letters[0][3] = 'r';
    Letters[0][4] = 't';
    Letters[0][5] = 'y';
    Letters[0][6] = 'u';
    Letters[0][7] = 'i';
    Letters[0][8] = 'o';
    Letters[0][9] = 'p';
    Letters[1][0] = 'a';
    Letters[1][1] = 's';
    Letters[1][2] = 'd';
    Letters[1][3] = 'f';
    Letters[1][4] = 'g';
    Letters[1][5] = 'h';
    Letters[1][6] = 'j';
    Letters[1][7] = 'k';
    Letters[1][8] = 'l';
    Letters[2][0] = 'z';
    Letters[2][1] = 'x';
    Letters[2][2] = 'c';
    Letters[2][3] = 'v';
    Letters[2][4] = 'b';
    Letters[2][5] = 'n';
    Letters[2][6] = 'm';
  }
  
}

class Button{
  
  private boolean pressed;
  private char ch;

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
