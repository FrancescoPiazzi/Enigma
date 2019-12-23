public abstract class Rotor{

  char[] Input = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
  
  char[] Output1 = {'e', 'k', 'm', 'f', 'l', 'g', 'd', 'q', 'v', 'z', 'n', 't', 'o', 'w', 'y', 'h', 'x', 'u', 's', 'p', 'a', 'i', 'b', 'r', 'c', 'j'};
  char[] Output2 = {'e', 'k', 'm', 'f', 'l', 'g', 'd', 'q', 'v', 'z', 'n', 't', 'o', 'w', 'y', 'h', 'x', 'u', 's', 'p', 'a', 'i', 'b', 'r', 'c', 'j'};
  char[] Output3 = {'e', 'k', 'm', 'f', 'l', 'g', 'd', 'q', 'v', 'z', 'n', 't', 'o', 'w', 'y', 'h', 'x', 'u', 's', 'p', 'a', 'i', 'b', 'r', 'c', 'j'};
  
  char[] Output;
  int Pos;
  
  public abstract char convert(char cInput);
  public abstract void increaseCounter();
}

public class Rotor1 extends Rotor{

  Rotor1(){ 
    Output = Output1;  
    Pos = 1;
  }
  
  public char convert(char cInput){
    increaseCounter();
    int OutputIndex = Letters.getNumber(cInput)-65;  //-65 perchè getNumber mi dà il valore corrispondente alla tabella di codifica ascii, che può andare da 65 a 90
    
    if (OutputIndex >= 0 && OutputIndex < 26){ //<>//
      return Output[OutputIndex]; //<>//
    }
    else{
      return '0';
    }
  }
  
  public void increaseCounter(){
    if (Pos == 26) Pos = 0;
    else Pos++;
  }
}
