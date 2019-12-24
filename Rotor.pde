public static abstract class Rotor {

  char[] Output1 = {'e', 'k', 'm', 'f', 'l', 'g', 'd', 'q', 'v', 'z', 'n', 't', 'o', 'w', 'y', 'h', 'x', 'u', 's', 'p', 'a', 'i', 'b', 'r', 'c', 'j'};
  char[] Output2 = {'a', 'j', 'd', 'k', 's', 'i', 'r', 'u', 'x', 'b', 'l', 'h', 'w', 't', 'm', 'c', 'q', 'g', 'z', 'n', 'p', 'y', 'f', 'v', 'o', 'e'};
  char[] Output3 = {'b', 'd', 'f', 'h', 'j', 'l', 'c', 'p', 'r', 't', 'x', 'v', 'z', 'n', 'y', 'e', 'i', 'w', 'g', 'a', 'k', 'm', 'u', 's', 'q', 'o'};
  /*char[] Output4 = ESOVPZJAYQUIRHXLNFTGKDCMWB
   char[] Output5 = VZBRGITYUPSDNHLXAWMJQOFECK*/

  char[] Output;
  int Pos;

  public char convert(char cInput) {
    int OutputIndex = Letters.getNumber(cInput)-65;  //-65 perchè getNumber mi dà il valore corrispondente alla tabella di codifica ascii, che può andare da 65 a 90

    if (OutputIndex >= 0 && OutputIndex < 26) {
      return Output[OutputIndex];
    } else {
      return '0';
    }
  }
  
  public char reverseConvert(char cInput) {
    int InputIndex = -1;

    for (char i : Letters.alphabeticLetters) {
      if (convert(i) == cInput) {
        InputIndex = Letters.getNumber(i)-65;
        break;
      }
    }

    if (InputIndex >= 0 && InputIndex < 26) {
      return Letters.alphabeticLetters[InputIndex];
    } else {
      return '0';
    }
  }
  
  public boolean increaseCounter() {
    Rotate();
    if (Pos == 26){
      Pos = 1;
      return true;
    }
    else{
      Pos++;
      return false;
    }
  }
  
  private void Rotate(){
    char LastCh = Output[Output.length-1];
    for (int i = Output.length-2; i >= 0; i--){
      Output[i+1] = Output[i];
    }
    Output[0] = LastCh;
  }

  public char getFirstLetter(){
    return Output[Output.length-1];
  }
}

public class Rotor1 extends Rotor {

  Rotor1() { 
    Output = Output1;  
    Pos = 1;
  }

}

public class Rotor2 extends Rotor {

  Rotor2() { 
    Output = Output2;  
    Pos = 1;
  }
}

public class Rotor3 extends Rotor {

  Rotor3() { 
    Output = Output3;  
    Pos = 1;
  }
}
