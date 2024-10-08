public class Button{

  static final int ButtonSize = 40;  //TODO: togliere il fatto che sia statico e fare in modo che il bottone premuto diventi leggermente più piccolo
  
  final int TopDistance = 200;
  final int RawDistance = 70;
  final int LeftDistance = 100;
  final int HorizontalDistance = 30;
  final int ColumnDistance = 70;
  
  final color LightColor = color(240);
  final color DarkColor = color(20);
  final color LightUpColor = color(200, 200, 0);
  final color ClickedColor = color (200, 0, 0);
  
  private boolean pressed;
  private boolean clicked;
  
  private char pluggedTo;
  
  private int XPos, YPos;
  
  private color BackColor;
  private color TextColor;
  
  private char Key;

  Button(int XPos, int YPos){
    pressed = false;
    clicked = false;
    
    pluggedTo = Letters.getLetter(XPos, YPos);
    
    this.XPos = LeftDistance + XPos*ColumnDistance + YPos*HorizontalDistance;
    this.YPos = RawDistance*YPos + TopDistance;
    
    BackColor = DarkColor;
    TextColor = LightColor;
    
    Key = Letters.getLetter(XPos, YPos);
  }
  
  public int getLeft(){
    return this.XPos;
  }
  public int getTop(){
    return this.YPos;
  }
  
  public color getBackColor(){
    return BackColor;
  }
  public color getTextColor(){
    return TextColor;
  }
  
  public char getKey(){
    return Key;
  }
  
  public boolean updateClickedButton(){
    if((Math.sqrt(Math.pow(mouseX-XPos, 2) + Math.pow(mouseY-YPos, 2) ) < ButtonSize/2) && Key != ' ') {
        clicked = true;
        return true;
    }
    else { 
      clicked = false;
      return false;
    }
  }
  
  public void updatePressedKey(){
    if(pressed){
      BackColor = LightUpColor;
      TextColor = DarkColor;
    }
    else if(clicked){
      BackColor = ClickedColor;
      TextColor = DarkColor;
    }
    else{
      BackColor = DarkColor;
      TextColor = LightColor;
    }
  }
  
  public void setPressed(boolean pressed){
    this.pressed = pressed;
  }
  
  public void setClicked(boolean clicked){
    this.clicked = clicked;
  }
  
  public boolean getClicked(){
    return clicked;
  }
  
  public void plugTo(char chToPlug){
    pluggedTo = chToPlug;
  }
  
  public char getPluggedTo(){
    return pluggedTo;
  }
  
  public void unplug(){
    pluggedTo = Key;
  }
}
