public static abstract class Rotor{

  char[] Input = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
  
  char[] Output1 = {'e', 'k', 'm', 'f', 'l', 'g', 'd', 'q', 'v', 'z', 'n', 't', 'o', 'w', 'y', 'h', 'x', 'u', 's', 'p', 'a', 'i', 'b', 'r', 'c', 'j'};
  char[] Output2 = {'a', 'j', 'd', 'k', 's', 'i', 'r', 'u', 'x', 'b', 'l', 'h', 'w', 't', 'm', 'c', 'q', 'g', 'z', 'n', 'p', 'y', 'f', 'v', 'o', 'e'};
  char[] Output3 = {'b', 'd', 'f', 'h', 'j', 'l', 'c', 'p', 'r', 't', 'x', 'v', 'z', 'n', 'y', 'e', 'i', 'w', 'g', 'a', 'k', 'm', 'u', 's', 'q', 'o'};
  /*char[] Output4 = ESOVPZJAYQUIRHXLNFTGKDCMWB
    char[] Output5 = VZBRGITYUPSDNHLXAWMJQOFECK*/
  
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

public class Rotor2 extends Rotor{

  Rotor2(){ 
    Output = Output2;  
    Pos = 1;
  }
  
  public char convert(char cInput){
    increaseCounter();
    int OutputIndex = Letters.getNumber(cInput)-65;  //-65 perchè getNumber mi dà il valore corrispondente alla tabella di codifica ascii, che può andare da 65 a 90
    
    if (OutputIndex >= 0 && OutputIndex < 26){
      return Output[OutputIndex];
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

public class Rotor3 extends Rotor{

  Rotor3(){ 
    Output = Output3;  
    Pos = 1;
  }
  
  public char convert(char cInput){
    increaseCounter();
    int OutputIndex = Letters.getNumber(cInput)-65;  //-65 perchè getNumber mi dà il valore corrispondente alla tabella di codifica ascii, che può andare da 65 a 90
    
    if (OutputIndex >= 0 && OutputIndex < 26){
      return Output[OutputIndex];
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
