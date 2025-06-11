class Puzzle{
  PImage img;
  ArrayList<Piece> pieces;
  ArrayList<PVector> answer;
  int w, h;
  int size;
  boolean paused;
  
  public Puzzle(){
    img=loadImage("images/puzzle.jpg");
    w=4;
    h=5;
    size=100;
    pieces=new ArrayList<Piece>();
    for(int x=0;x<w;x++){
      for(int y=0;y<h;y++){
        PVector correctPos=new PVector(300+(x*size), 50+(y*size));
        pieces.add(new Piece(img, new PVector((int)random(width-size), (int)random(height-size)), correctPos, size, x*img.width/w, y*img.height/h, new PVector((x)*img.width/w+img.width/w, (y)*img.height/h+img.height/h)));
      }
    }
    
  }
  //
  public void draw(){
    rect(300,50, 400,500);
    for(Piece piece: pieces){
      piece.draw();
    }
  }
  
  public Piece getPieceAt(float x, float y) {
    for (int i = pieces.size() - 1; i >= 0; i--) {
      Piece p = pieces.get(i);
      if (p.contains(x, y)) {
        return p;
      }
    }
    return null;
  }

  public void trySnap(Piece p, float snapThreshold) {
    if (p.isCloseToCorrect(snapThreshold)) {
      p.snapToCorrect();
    }
  }

  public boolean isComplete() {
    for (Piece p : pieces) {
      if (!p.isInCorrectPlace()) return false;
    }
    return true;
  }
  
  public void grade(){
    pushMatrix();
    translate(width/2, height/2);
    fill(255);
    quad(-300,-200, 300,-200, 300,200, -300,200);
    Text text=new Text(60);
    text.draw("CONGRATS", new PVector(-180, -100));
    text.draw("A        95", new PVector(-150,0));
    fill(255);
    rect(-200,100,400,50);
    Text smaller=new Text(40);
    smaller.draw("continue",new PVector(-80,140));
    popMatrix();
  }
  
  
}
