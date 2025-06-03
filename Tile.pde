class Tile{
  PVector pos;
  int size;
  boolean revealed;
  boolean matched;
  PImage front;
  PImage back;
  int value;
  
  public Tile(PVector pos, PImage front, int value){
    this.pos=pos;
    this.front=front;
    this.value=value;
    back=loadImage("images/tile.png");
    size=80;
  }
  
  public int value(){
    return value;
  }
  
  public void draw(){
    if(revealed||matched){
      image(front, pos.x,pos.y,size,size);
    }
    else{
      image(back, pos.x,pos.y,size,size);
    }
  }
  
  
  
  
  
}
