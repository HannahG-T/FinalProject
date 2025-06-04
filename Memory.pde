class Memory{
 Tile[] tiles= new Tile[16];
 boolean completed;
 PVector[] pos= new PVector[16];
 Tile first;
 Tile second;
 int matched;
 Grade grade=new Grade("Math", 100);
 ArrayList<Integer> possible=new ArrayList<Integer>();
 
 int startTime=5000;
 int flipTime=1000;
 int flipStartTime=0;

  
  
 public Memory(){
  completed=false;
  matched=0;
  for(int i=0; i<8; i++){
   possible.add(1);
   possible.add(1);
  }
  for (int i=0; i<tiles.length; i++){
    int x=300+27*(i%4)+80*(i%4);
    int y=27*(i/4)+100+80*(i/4);
    pos[i]= new PVector(x,y);
    int value=possible.remove((int) random(possible.size()));
    PImage img= loadImage("images/tile"+value+".png");
    tiles[i]= new Tile(pos[i], img, value);
  }
 }

 
  
  public void draw(){
    fill(100);
    square(273,73,454);
    for(int i=0;i<tiles.length;i++){
      tiles[i].draw();
    }
    
    if(millis()>startTime){
      if(millis() - flipStartTime >= flipTime) {
          flipStartTime = millis();
          
      }
    }
    
  }
  
  
  
  
  
  
  
  
  
  
}
