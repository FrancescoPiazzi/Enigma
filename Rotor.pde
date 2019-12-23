public abstract class Rotor{

  char[] Input; = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
  char[] Output;
  int Pos = 1;
  
  public abstract char convert(char cInput);
}

public class Rotor1 extends Rotor{

  Rotor1(){
    Output = {'e', 'k', 'm', 'f', 'l', 'g', 'd', 'q', 'v', 'z', 'n', 't', 'o', 'w', 'y', 'h', 'x', 'u', 's', 'p', 'a', 'i', 'b', 'r', 'c', 'j'};
  }
  
  public char convert(char cInput){
    if (Pos = 26) Pos = 0;
    else Pos++;
    return Output[Letters.getNumber(cInput)-65];  //-65 perchè getNumber mi dà il valore corrispondente alla tabella di codifica ascii, che può andare da 65 a 90
  }
}
