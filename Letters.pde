public static class Letters {

  private static char[][] keyboardLetters = {
    {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'}, 
    {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', '-'}, 
    {'z', 'x', 'c', 'v', 'b', 'n', 'm', ' ', '-', '-'}
  };

  static char[] plainLetters = {'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm'};
  static char[] alphabeticLetters = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

  public static boolean isLetter(char ch) {

    for (char i : plainLetters) {
      if (i == ch) {
        return true;
      }
    }
    return false;
  }


  public static char getLetter(int x, int y) {  //Da coordinate tastiera a lettera
    if (x >= 0 && x < 10 && y >= 0 && y < 3)
      return keyboardLetters[y][x];
    else
      return '0';
  }

  public static char getLetter(int Ascii) {  //Da codice ascii a lettera

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

  public static int getNumber(char ch) {  //Da lettera a codice ascii

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

  public static int getPosX(char ch) {

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 10; j++) {
        if (ch == keyboardLetters[i][j]) {
          return j;
        }
      }
    }
    return 7;  //coordinata X del tasto di "errore"
  }

  public static int getPosY(char ch) {

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 10; j++) {
        if (ch == keyboardLetters[i][j]) {
          return i;
        }
      }
    }
    return 2;  //coordinata Y del tasto di "errore"
  }
}
