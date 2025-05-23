int speed, x, y;
int[] scale = {1, 1};
String level;
Character mc;
Text text;

void setup() {
  size(1000, 600);
  background(200);
  level = "halway";
  speed = 1;
  x = width / 2;
  y = height / 2;
  mc = new Character(new PVector(x, y), scale, "happy", "walking", "teacher", "teacher");
  text=new Text();
}

void draw() {
  background(200);
  text.drawString("hello, welcome to clas",new PVector(300,100),new PVector(502,340));
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
  int a = x - mouseX;
  int b = y - mouseY;
  print("[" + "x-" + a + "," + "y-" + b + "]");
}
