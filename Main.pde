int speed, x, y;
int[] scale = {1, 1};
String level;
Character mc;
GradeBook grades;
Text text;

void setup() {
  size(1000, 600);
  background(200);
  level = "halway";
  speed = 1;
  x = width / 2;
  y = height / 2;
  mc = new Character(new PVector(x, y), scale, "happy", "walking", "mc", "mc");
  grades=new GradeBook();
  text=new Text();
}

void draw() {
  background(200);
  text.drawString("hello, welcome to clas",new PVector(300,100),mc);
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
  
  grades.drawIcon();
  if(level.equals("gradebook")){
    grades.draw();
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
    level="gradebook";
  }
  int a = x - mouseX;
  int b = y - mouseY;
  print("[" + "x-" + a + "," + "y-" + b + "]");
}
