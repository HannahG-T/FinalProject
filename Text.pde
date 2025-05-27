class Text{
  PFont font;
  int margin=10;
  int gap=16;
  PVector pos;
  PVector end;
  
  
  public Text(){
    font=createFont("Serif", 24);
    textFont(font);
  }
  
  public Text(int size){
    font=createFont("Serif", size);
    textFont(font);
  }
  
  public void drawString(String text,PVector newPos, Character person){
    textAlign((int)newPos.x,(int)newPos.y);
    pos=newPos;
    end=person.pos();
    fill(255);
    triangle(pos.x-10+textWidth(text)/2, pos.y, pos.x+10+textWidth(text)/2, pos.y, end.x+40*person.getScale()[0], end.y);
    ellipse(pos.x+textWidth(text)/2,pos.y-8,textWidth(text)+20,40*textWidth(text)/80);
    fill(0);
    text(text, pos.x, pos.y);
  }
  
  public void draw(String text, PVector newPos){
    textAlign((int)newPos.x,(int) newPos.y);
    fill(0);
    text(text,newPos.x,newPos.y);
  }
  
  
  
  
  
}
