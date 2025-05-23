class Text{
  PFont font;
  int margin=10;
  int gap=16;
  PVector pos;
  PVector end;
  
  
  public Text(){
    font=createFont("Georgia", 24);
    textFont(font);
  }
  
  public void drawString(String text,PVector newPos, Character person){
    textAlign((int)newPos.x,(int)newPos.y);
    pos=newPos;
    end=person.pos();
    triangle(pos.x-10+textWidth(text)/2, pos.y, pos.x+10+textWidth(text)/2, pos.y, end.x+30*person.getScale()[0], end.y-5);
    ellipse(pos.x+textWidth(text)/2,pos.y-8,textWidth(text)+20,40*textWidth(text)/80);
    fill(0);
    text(text, pos.x, pos.y);
  }
  
  
  
  
  
}
