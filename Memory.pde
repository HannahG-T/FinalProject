class Memory{
 Tile[] tiles= new Tile[16];
 boolean completed;
 boolean show=true;;
 PVector[] pos= new PVector[16];
 Tile first;
 Tile second;
 int matched;
 Grade grade=new Grade("Math", 100);
 ArrayList<Integer> possible=new ArrayList<Integer>();
 
 int startTime=5000;
 int flipTime=10000;
 int flipStartTime;

 int tileTime =1000;
 int tileStartTime=0;
  
  
 public Memory(){
  completed=false;
  matched=0;
  for(int i=0; i<8; i++){
   possible.add(i+1);
   possible.add(i+1);
  }
  for (int i=0; i<tiles.length; i++){
    int x=300+27*(i%4)+80*(i%4);
    int y=27*(i/4)+100+80*(i/4);
    pos[i]= new PVector(x,y);
    int value=possible.remove((int) random(possible.size()));
    PImage img= loadImage("images/tile"+value+".png");
    tiles[i]= new Tile(pos[i], img, value);
  }
  flipStartTime=millis();
  startTime=millis()+6000;
 }
 
 public void start(){
   flipStartTime=millis();
  startTime=millis()+1000;
 }

 
  
  public void draw(){
    fill(100);
    square(273,73,454);
    for(int i=0;i<tiles.length;i++){
      tiles[i].draw();
    }
    
    if(show){
      if(millis()>startTime){
        for(Tile tile: tiles){
          tile.flip(true);
        }
        if(millis() - flipStartTime >= flipTime) {
            flipStartTime = millis();
            show=false;
            for(Tile tile: tiles){
              tile.flip(false);
            }
        }
      }
    }
    if(first!=null && second!=null){
      if(first.value()==second.value()){
        matched++;
        first=null;
        second=null;
      }
      else{
        if(millis()-tileStartTime>=tileTime){
          first.flip(false);
          second.flip(false);
          first=null;
          second=null;
          grade.minus(5);
        }
      }
    }
    if(matched>=8){
      drawGrade();
      completed=true;
    }
    
    
  }
  
  public void clicked(PVector clicked){
    for(int i=0;i<pos.length;i++){
      if(clicked.x>pos[i].x && clicked.x<pos[i].x+80 && clicked.y>pos[i].y && clicked.y<pos[i].y+80){
        if(first==null){
          first=tiles[i];
          tiles[i].flip(true);
        }
        else if(second==null){
          second=tiles[i];
          tiles[i].flip(true);
          tileStartTime=millis();
        }
      }
    }
    
  }
  
  public boolean isCompleted(){
    return completed;
  }
  
  public Grade getGrade(){
    return grade;
  }
  
  
  
  public void drawGrade(){
pushMatrix();
    translate(width / 2, height / 2);
    rectMode(CENTER); 
      fill(255);
      quad(-300,-200, 300,-200, 300,200, -300,200);
      Text text=new Text(60);
      if(grade.num()>65){
        text.draw("CONGRATS", new PVector(-180, -100));
        text.draw(grade.string(), new PVector(-150,0));
      }
      else{
        text.draw(":(", new PVector(-50, -100));
        text.draw(grade.string(), new PVector(-150,0));
      }
      fill(255);
      rect(0,130,400,50);
      Text smaller=new Text(40);
      smaller.draw("continue",new PVector(-80,140));
    rectMode(CORNER);
    popMatrix();
}
  
  
  
}
