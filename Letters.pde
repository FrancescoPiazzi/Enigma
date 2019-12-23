public static class Letters{
  
  private static char[][] letters = {
    {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'}, 
    {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', '-'}, 
    {'z', 'x', 'c', 'v', 'b', 'n', 'm', ' ', '-', '-'}
  };

  public static char getLetter(int x, int y){  //Da coordinate tastiera a lettera
    if (x >= 0 && x < 3 && y >= 0 && y < 10)
      return letters[x][y];
    else
      return '0';
  }
  
  public static char getLetter(int Ascii){  //Da codice ascii a lettera
    
    switch (Ascii) {

    case 65:
      return 'a';
    case 66:
      return 'b';
    case 67:
      return 'c';
    case 68:
      return 'd';
    case 69:
      return 'e';
    case 70:
      return 'f';
    case 71:
      return 'g';
    case 72:
      return 'h';
    case 73:
      return 'i';
    case 74:
      return 'j';
    case 75:
      return 'k';
    case 76:
      return 'l';
    case 77:
      return 'm';
    case 78:
      return 'n';
    case 79:
      return 'o';
    case 80:
      return 'p';
    case 81:
      return 'q';
    case 82:
      return 'r';
    case 83:
      return 's';
    case 84:
      return 't';
    case 85:
      return 'u';
    case 86:
      return 'v';
    case 87:
      return 'w';
    case 88:
      return 'x';
    case 89:
      return 'y';
    case 90:
      return 'z';
    default:
      return ' ';
    }
  }
  
  public static int getNumber(char ch){  //Da lettera a codice ascii
    
    switch (ch) {

    case 'a':
      return 65;
    case 'b':
      return 66;
    case 'c':
      return 67;
    case 'd':
      return 68;
    case 'e':
      return 69;
    case 'f':
      return 70;
    case 'g':
      return 71;
    case 'h':
      return 72;
    case 'i':
      return 73;
    case 'j':
      return 74;
    case 'k':
      return 75;
    case 'l':
      return 76;
    case 'm':
      return 77;
    case 'n':
      return 78;
    case 'o':
      return 79;
    case 'p':
      return 80;
    case 'q':
      return 81;
    case 'r':
      return 82;
    case 's':
      return 83;
    case 't':
      return 84;
    case 'u':
      return 85;
    case 'v':
      return 86;
    case 'w':
      return 87;
    case 'x':
      return 88;
    case 'y':
      return 89;
    case 'z':
      return 90;
    default:
      return 0;
    }
  }
  
  public static int getPosX(char ch){
    
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 10; j++){
        if (ch == letters[i][j]){
          return i;
        }
      }
    }
    return -1;
  }
  
  public static int getPosY(char ch){
    
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 10; j++){
        if (ch == letters[i][j]){
          return j;
        }
      }
    }
    return -1;
  }
  
  
  /*private void initletters(){
    letters[0][0] = 'q';
    letters[0][1] = 'w';
    letters[0][2] = 'e';
    letters[0][3] = 'r';
    letters[0][4] = 't';
    letters[0][5] = 'y';
    letters[0][6] = 'u';
    letters[0][7] = 'i';
    letters[0][8] = 'o';
    letters[0][9] = 'p';
    letters[1][0] = 'a';
    letters[1][1] = 's';
    letters[1][2] = 'd';
    letters[1][3] = 'f';
    letters[1][4] = 'g';
    letters[1][5] = 'h';
    letters[1][6] = 'j';
    letters[1][7] = 'k';
    letters[1][8] = 'l';
    letters[2][0] = 'z';
    letters[2][1] = 'x';
    letters[2][2] = 'c';
    letters[2][3] = 'v';
    letters[2][4] = 'b';
    letters[2][5] = 'n';
    letters[2][6] = 'm';
  }*/
}
