class Piece{
  PImage img;
  PVector pos;
  int w;
  int h;
  int size;
  PVector imgPos;
  PVector correctPos;
  
  
  public Piece(PImage image, PVector position, PVector cPos, int newSize, int W, int H, PVector newImgPos){
    img=image;
    pos=position;
    size=newSize;
    imgPos=newImgPos;
    correctPos=cPos;
    w=W;
    h=H;
  }
  
  public void draw(){
    image(img, (int)pos.x, (int)pos.y, size,size, w,h, (int)imgPos.x, (int)imgPos.y);
  }
  
  public void setPos(PVector newPos){
    pos=newPos;
  }
  
  public PVector pos(){
    return pos;
  }
  
  boolean contains(float x, float y) {
    return x > pos.x && x < pos.x + size && y > pos.y && y < pos.y + size;
  }
  
  boolean isCloseToCorrect(float snapThreshold) {
    return PVector.dist(pos, correctPos) < snapThreshold;
  }

  void snapToCorrect() {
    pos = correctPos.copy();
  }

  boolean isInCorrectPlace() {
    return pos.equals(correctPos);
  }
  
}
