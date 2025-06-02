int speed, x, y, r, c;
int[] scale = {1, 1};
String[] levels={"start", "hallway", "snake", "hallway", "memory", "hallway", "simon", "hallway", "puzzle", "end"};
int level;
boolean inGame=false;
boolean played=false;
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

Snake snake;


void setup() {
  size(1000, 600);
  background(200);
  level=8;
  speed = 1;
  x = width / 2;
  y = 150+height / 2;
  r=0;
  c=0;
  //create MC character
  mc = new Character(new PVector(x, y), scale, "happy", "walking", "mc", "mc");
  //create teachers
  for(int i=0;i<teachers.length;i++){
    int[] temp={-1,1};
    teachers[i]=new Character(new PVector(700,y), temp, "happy", "standing", "teacher", "teacher");
  }
  //load background images
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
  //initialize games and classes
  grades=new GradeBook();
  text=new Text();
  puzzle=new Puzzle();
  simon=new Simon();
  snake=new Snake();
}

void draw() {
  //background images
  image(backgrounds[level], 0,0,width, height);
  
  //move to next room
  if(mc.pos().x <= 0){
    level--;
    mc.setPos(new PVector(width-10, y));
  }
  if(mc.pos().x>=width){
    level++;
    mc.setPos(new PVector(10, y));
    spoke=false;
    played=false;
    c=0;
  }
  
  //dialogue
  if((!levels[level].equals("hallway") || level==1)&&level!=9){
    r=level;
  }
  if(level!=0 && level!=9 && !levels[level].equals("hallway") ){
    if(played){
      r++;
    }
  }
  
  if((!levels[level].equals("hallway") || level==1 )&&!spoke && mc.pos().x>450){
    text.dialogue(r,c);
  }

  //mc animation and teachers
  if (!inGame&& level!=0 ) {
    if (keyPressed == false) {
      mc.setAction("standing");
      mc.setDir(new PVector(0, 0));
    }
    mc.side();
    if (frameCount % speed == 0) {
      mc.animate();
    }
    if(!levels[level].equals("hallway")){
      teachers[(level-1)/2].side();
    }
  }

  //snake game
  if(levels[level].equals("snake") && inGame){
    snake.draw();
    if(snake.isCompleted()){
      grades.addGrade(snake.grade());
    }
  }
  
  //simon game
  if(levels[level].equals("simon")&& inGame){
    simon.draw();
    if(simon.isCompleted()){
      grades.addGrade(simon.getGrade());
    }
  }
  
  //puzzle game
  if(levels[level].equals("puzzle")&&inGame){
    puzzle.draw();
    if(puzzle.isComplete()){
      grades.addGrade("Ela", 95);
      grades.draw();
      puzzle.grade();
    }
  }
  
  //draw grade menu
  if(levels[level].equals("gradebook")){
    grades.draw();
  }
  grades.drawIcon();
  }

void keyPressed() {
  //forward dialogue
  if(key== ENTER){
      c++;
      if(c>=text.maxCur(r)){
        spoke=true;
        c=0;
        if(!played&&level>1){
          inGame=true;
        }
        if(levels[level].equals("start")){
          level++;
          spoke=false;
        }
      }
    }
  if (key == CODED) {
    
    //walk back and forth
    if(!inGame){
      if (keyCode == LEFT) {
        mc.setAction("walking");
        mc.setDir(new PVector(-5, 0));
        scale[0] = -1;
        mc.setScale(scale);
      }
      if (keyCode == RIGHT) {
        mc.setAction("walking");
        mc.setDir(new PVector(5, 0));
        scale[0] = 1;
        mc.setScale(scale);
      }
    }
  }
  if(levels[level].equals("snake") && inGame){
    if (key == CODED) {
    if (keyCode == UP) {
      snake.setDir(new PVector(0, -1));
    } else if (keyCode == DOWN ) {
      snake.setDir(new PVector(0, 1));
    } else if (keyCode == LEFT ) {
      snake.setDir(new PVector(-1, 0));
    } else if (keyCode == RIGHT ) {
      snake.setDir(new PVector(1, 0));
    }
  } 
  }
}

void mouseClicked() {
  //pause and open gradebook menu
  if(mouseX>20 && mouseY>20 && mouseX<60 && mouseY<75){
    pause=levels[level];
    levels[level]="gradebook";
  }
  //close grade menu
  if(levels[level].equals("gradebook")&&mouseX>width/2+260 && mouseY>height/2-190 && mouseX<width/2+290 && mouseY<width/2-160){ 
    levels[level]=pause;
  }

  //end snake
if(inGame && levels[level].equals("snake") && snake.isCompleted()&& mouseX>width/2-200 && mouseX<width/2+200 && mouseY>height/2+100 && mouseY<height/2+150){
  inGame=false;
  played=true;
  spoke=false;
  c=0;
}
  
  //end/play simon
  if(levels[level].equals("simon") && inGame){
    simon.select(new PVector(mouseX, mouseY));
    if(simon.isCompleted()&& mouseX>width/2-200 && mouseX<width/2+200 && mouseY>height/2+100 && mouseY<height/2+150){
      inGame=false;
      played=true;
      spoke=false;
      c=0;
    }
  }
  
  //end puzzle
  if(inGame && levels[level].equals("puzzle") && puzzle.isComplete()&& mouseX>width/2-200 && mouseX<width/2+200 && mouseY>height/2+100 && mouseY<height/2+150){
    inGame=false;
    played=true;
    spoke=false;
    c=0;
  }
  
  int a =x- mouseX;
  int b =y-mouseY;
  print("[" + "x-" + a + "," + "y-" + b + "]");
}


void mousePressed() {
  //puzzle game
  if(inGame && levels[level].equals("puzzle")){
    selected = puzzle.getPieceAt(mouseX, mouseY);
    if (selected != null) {
      offset = PVector.sub(selected.pos, new PVector(mouseX, mouseY));
    }
  }
}

void mouseDragged() {
  //puzzle game
  if(inGame && levels[level].equals("puzzle")){
    if (selected != null) {
      selected.setPos(new PVector(mouseX, mouseY).add(offset));
    }
  }
}

void mouseReleased() {
  //puzzle game
  if(inGame && levels[level].equals("puzzle")){
    if (selected != null) {
      puzzle.trySnap(selected, 50);
      selected = null;
    }
  }
}
