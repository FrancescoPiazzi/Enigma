public class Plugboard{

  public char[][] plugs;  //TODO: renderle private con opportuni metodi get e set
  public boolean[][] pluggedKeys;
  
  Plugboard(){
    plugs = new char[3][10];
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 10; j++){
        plugs[i][j] = Letters.getLetter(j, i);
      }
    }
    pluggedKeys = new boolean[3][10];
  }
  
  public void plug(char plugStart, char plugEnd){
    //if(!pluggedKeys[Letters.getPosX(plugStart)][Letters.getPosY(plugStart)] && !pluggedKeys[Letters.getPosX(plugEnd)][Letters.getPosY(plugEnd)]){
      if(Letters.isLetter(plugStart) && Letters.isLetter(plugEnd)){
        plugs[Letters.getPosY(plugEnd)][Letters.getPosX(plugEnd)] = plugStart;
        plugs[Letters.getPosY(plugStart)][Letters.getPosX(plugStart)] = plugEnd;
        System.out.println(plugStart + " ---- " + plugEnd);
      }
 
      /*pluggedKeys[Letters.getPosX(plugStart)][Letters.getPosY(plugStart)] = true;
      pluggedKeys[Letters.getPosX(plugEnd)][Letters.getPosY(plugEnd)] = true;
    }
    else{
      pluggedKeys[Letters.getPosX(plugStart)][Letters.getPosY(plugStart)] = false;
      pluggedKeys[Letters.getPosX(plugEnd)][Letters.getPosY(plugEnd)] = false;
      
      keyboard.setClickedButton(Letters.getPosX(plugEnd), Letters.getPosY(plugEnd), true);
    }*/
  }
  
}
