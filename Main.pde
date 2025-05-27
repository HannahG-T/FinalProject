int speed, x, y;
int[] scale = {1, 1};
String level;
String pause;
Character mc;
GradeBook grades;
Text text;
Puzzle puzzle;
Simon simon;

Piece selected=null;
PVector offset;
void setup() {
  size(1000, 600);
  background(200);
  level = "simon";
  speed = 1;
  x = width / 2;
  y = height / 2;
  mc = new Character(new PVector(x, y), scale, "happy", "walking", "mc", "mc");
  grades=new GradeBook();
  text=new Text();
  puzzle=new Puzzle();
  simon=new Simon();
}

void draw() {
  background(200);
  if (level.equals("start")) {
  }
  if (level.equals("halway")) {
    if (keyPressed == false) {
      mc.setAction("standing");
      mc.setDir(new PVector(0, 0));
    }
    mc.side();
    if (frameCount % speed == 0) {
      mc.animate();
    }
  }
  if(level.equals("puzzle")){
    puzzle.draw();
    if(puzzle.isComplete()){
      grades.addGrade("ELA", 95);
      grades.draw();
      puzzle.grade();
    }
  }
  
  grades.drawIcon();
  if(level.equals("gradebook")){
    grades.draw();
  }
  
  if(level.equals("simon")){
    simon.draw();
  }
}

void keyPressed() {
  if (key == CODED) {
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

void mouseClicked() {
  if(mouseX>20 && mouseY>20 && mouseX<60 && mouseY<75){
    pause=level;
    level="gradebook";
  }
  if(level.equals("gradebook")&&mouseX>width/2+260 && mouseY>height/2-190 && mouseX<width/2+290 && mouseY<width/2-160){
    level=pause;
    print(level);
  }
  if(level.equals("puzzle") && mouseX>width/2-200 && mouseX<width/2+200 && mouseY>height/2+100 && mouseY<height/2+150){
    level="halway";
  }
  
  if(level.equals("simon")){
    simon.select(new PVector(mouseX, mouseY));
  }
  
  int a =x- mouseX;
  int b =y-mouseY;
  print("[" + "x-" + a + "," + "y-" + b + "]");
}


void mousePressed() {
  if(level.equals("puzzle")){
    selected = puzzle.getPieceAt(mouseX, mouseY);
    if (selected != null) {
      offset = PVector.sub(selected.pos, new PVector(mouseX, mouseY));
    }
  }
}

void mouseDragged() {
  if(level.equals("puzzle")){
    if (selected != null) {
      selected.setPos(new PVector(mouseX, mouseY).add(offset));
    }
  }
}

void mouseReleased() {
  if(level.equals("puzzle")){
    if (selected != null) {
      puzzle.trySnap(selected, 50);
      selected = null;
    }
  }
}
