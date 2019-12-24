public static abstract class Reflector{

  char[] Input = Letters.alphabeticLetters;
  
  char[] Output1 = {'y', 'r', 'u', 'h', 'q', 's', 'l', 'd', 'p', 'x', 'n', 'g', 'o', 'k', 'm', 'i', 'e', 'b', 'f', 'z', 'c', 'w', 'v', 'j', 'a', 't'};
  //char Output2 = FVPJIAOYEDRZXWGCTKUQSBNMHL
  
  char[] Output;
  
  public abstract char convert(char cInput);
  
}

public class Reflector1 extends Reflector{
  
  Reflector1(){
    Output = Output1;
  }
  
  public char convert(char cInput){
    int OutputIndex = Letters.getNumber(cInput)-65;  //-65 perchè getNumber mi dà il valore corrispondente alla tabella di codifica ascii, che può andare da 65 a 90
    
    if (OutputIndex >= 0 && OutputIndex < 26){
      return Output[OutputIndex];
    }
    else{
      return '0';
    }
  }
}
