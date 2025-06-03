class Memory{
 Tile[] tiles= new Tile[16];
 boolean completed;
 PVector[] pos= new PVector[16];
 Tile first;
 Tile second;
 int matched;
 ArrayList<Integer> possible;

 public Memory(){
  completed=false;
  matched=0
  for(int i=0; i<8; i++){
   possible.add(i);
   possible.add(i);
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
 
  
  
  
  
  
  
  
  
  
  
  
  
}
