public class Button{

  static final int ButtonSize = 40;  //TODO: togliere il fatto che sia statico e fare in modo che il bottone premuto diventi leggermente più piccolo
  
  final int TopDistance = 200;
  final int RawDistance = 70;
  final int LeftDistance = 100;
  final int HorizontalDistance = 30;
  final int ColumnDistance = 70;
  
  final color DarkColor = color(20);
  final color LightColor = color(255);
  
  private boolean pressed;
  private boolean plugged;
  private int XPos, YPos;
  private color Color;

  Button(int XPos, int YPos){
    pressed = false;
    plugged = false;
    
    this.XPos = LeftDistance + XPos*ColumnDistance + YPos*HorizontalDistance;
    this.YPos = RawDistance*YPos + TopDistance;
    
    Color = DarkColor;
  }
  
  public int getLeft(){
    return this.XPos;
  }
  public int getTop(){
    return this.YPos;
  }
  public color getColor(){
    return this.Color;
  }
  
  public void updateClickedButton(){
    if((Math.sqrt(Math.pow(XPos-this.XPos, 2) + Math.pow(YPos-this.YPos, 2) ) < ButtonSize/2))  pressed = true;
    else pressed = false;
  }
}
