public class Plugboard{

  private char[][] plugs;
  
  Plugboard(){
    plugs = new char[3][10];
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 10; j++){
        plugs[i][j] = Letters.getLetter(j, i);
      }
    }
  }
  
  public void plug(char plugStart, char plugEnd){
    if(Letters.isLetter(plugStart) && Letters.isLetter(plugEnd)){
      plugs[Letters.getPosY(plugEnd)][Letters.getPosX(plugEnd)] = plugStart;
      plugs[Letters.getPosY(plugStart)][Letters.getPosX(plugStart)] = plugEnd;
    }
  }
  
  public char getPlug(int PosX, int PosY){
    return plugs[PosY][PosX];
  }
}
