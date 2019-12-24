public static abstract class Reflector{
  
  char[] Output1 = {'y', 'r', 'u', 'h', 'q', 's', 'l', 'd', 'p', 'x', 'n', 'g', 'o', 'k', 'm', 'i', 'e', 'b', 'f', 'z', 'c', 'w', 'v', 'j', 'a', 't'};
  char[] Output2 = {'f', 'v', 'p', 'j', 'i', 'a', 'o', 'y', 'e', 'd', 'r', 'z', 'x', 'w', 'g', 'c', 't', 'k', 'u', 'q', 's', 'b', 'n', 'm', 'h', 'l'};
  
  char[] Output;
  
  public char convert(char cInput){
    int OutputIndex = Letters.getNumber(cInput)-65;  //-65 perchè getNumber mi dà il valore corrispondente alla tabella di codifica ascii, che può andare da 65 a 90
    
    if (OutputIndex >= 0 && OutputIndex < 26){
      return Output[OutputIndex];
    }
    else{
      return '0';
    }
  }
  
  public abstract int getID();
  public color Color;
}

public class Reflector1 extends Reflector{
  
  Reflector1(){
    Output = Output1;
    Color = color(0, 100, 255);
  }
  
  public int getID(){ return 1; }
}

public class Reflector2 extends Reflector{
  
  Reflector2(){
    Output = Output2;
    Color = color(255, 100, 0);
  }
  
  public int getID(){ return 2; }
}
