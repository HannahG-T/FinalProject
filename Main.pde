int speed, x, y;
int[] scale = {1, 1};
String[] levels={"start", "hallway", "bookStack", "hallway", "memory", "hallway", "simon", "hallway", "puzzle", "end"};
int level;
boolean inGame=false;
boolean spoke=false;
PImage[] backgrounds=new PImage[10];
String pause;
Character mc;
Character[] teachers=new Character[4];
GradeBook grades;
Text text;

Puzzle puzzle;
Piece selected=null;
PVector offset;

Simon simon;



void setup() {
  size(1000, 600);
  background(200);
  levels[level] = "simon";
  speed = 1;
  x = width / 2;
  y = height / 2;
  mc = new Character(new PVector(x, y+100), scale, "happy", "walking", "mc", "mc");
  for(int i=0;i<teachers.length;i++){
    int[] temp={-1,1};
    teachers[i]=new Character(new PVector(700,400), temp, "happy", "standing", "teacher", "teacher");
  }
  for(int i=0;i<backgrounds.length;i++){
    String name="images/"+levels[i];
    if(levels[i].equals("hallway")){
      name+=(i+1)/2;
    }
    if(levels[i].equals("end")){
      name+=".jpeg";
    }
    else if(levels[i].equals("start")){
      name+=".jpg";
    }
    else{
      name+=".png";
    }
    backgrounds[i]=loadImage(name);
  }
  grades=new GradeBook();
  text=new Text();
  puzzle=new Puzzle();
  simon=new Simon();
}

void draw() {
  background(200);
  if(mc.pos().x <= 0){
    level--;
    mc.setPos(newPVector(width-10, y+100));
  }
  if(mc.pos().x>=width){
    level++;
    mc.setPos(newPvector(10, y+100));
  }

  if(!spoke && mc.pos().x>450){
    text.dialogue();
    if(text.cur()==0){
      spoke=false;
      inGame=true;
    }
    delay(5000);
  }

  image(backgrounds[level], width, height);
  if (levels[level].equals("start")) {
  }
  if (!inGame) {
    if (keyPressed == false) {
      mc.setAction("standing");
      mc.setDir(new PVector(0, 0));
    }
    mc.side();
    if (frameCount % speed == 0) {
      mc.animate();
    }
    teachers[(level-1)/2].side();
  }
  if(levels[level].equals("puzzle")&&inGame){
    puzzle.draw();
    if(puzzle.isComplete()){
      grades.addGrade("ELA", 95);
      grades.draw();
      puzzle.grade();
    }
  }
  
  if(levels[level].equals("gradebook")){
    grades.draw();
  }
  
  if(levels[level].equals("simon")&& inGame){
    simon.draw();
    if(simon.isCompleted()){
      grades.addGrade(simon.getGrade());
    }
  }
  
  translate(0,0);
  grades.drawIcon();
}

void keyPressed() {
  if (key == CODED) {
    if(!inGame){
      if (keyCode == LEFT) {
        mc.setAction("walking");
        mc.setDir(new PVector(-2, 0));
        scale[0] = -1;
        mc.setScale(scale);
      }
      if (keyCode == RIGHT) {
        mc.setAction("walking");
        mc.setDir(new PVector(2, 0));
        scale[0] = 1;
        mc.setScale(scale);
      }
    }
  }
}

void mouseClicked() {
  if(mouseX>20 && mouseY>20 && mouseX<60 && mouseY<75){
    pause=levels[level];
    levels[level]="gradebook";
  }
  if(levels[level].equals("gradebook")&&mouseX>width/2+260 && mouseY>height/2-190 && mouseX<width/2+290 && mouseY<width/2-160){ 
    levels[level]=pause;
  }
  if(inGame && levels[level].equals("puzzle") && puzzle.isComplete()&& mouseX>width/2-200 && mouseX<width/2+200 && mouseY>height/2+100 && mouseY<height/2+150){
    inGame=false;
  }
  
  if(levels[level].equals("simon") && inGame){
    simon.select(new PVector(mouseX, mouseY));
    if(simon.isCompleted()&& mouseX>width/2-200 && mouseX<width/2+200 && mouseY>height/2+100 && mouseY<height/2+150){
      inGame=false;
    }
  }
  
  int a =x- mouseX;
  int b =y-mouseY;
  print("[" + "x-" + a + "," + "y-" + b + "]");
}


void mousePressed() {
  if(inGame && levels[level].equals("puzzle")){
    selected = puzzle.getPieceAt(mouseX, mouseY);
    if (selected != null) {
      offset = PVector.sub(selected.pos, new PVector(mouseX, mouseY));
    }
  }
}

void mouseDragged() {
  if(inGame && levels[level].equals("puzzle")){
    if (selected != null) {
      selected.setPos(new PVector(mouseX, mouseY).add(offset));
    }
  }
}

void mouseReleased() {
  if(inGame && levels[level].equals("puzzle")){
    if (selected != null) {
      puzzle.trySnap(selected, 50);
      selected = null;
    }
  }
}
