public static class Letters{
  
  private char[][] letters;

  public char getLetter(int x, int y){
    if (x >= 0 && x < 3 && y >= 0 && y < 10)
      return letters[x][y];
    else
      return '0';
  }
  
  private void initletters(){
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
  }
}
