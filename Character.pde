class Character {
  PVector pos, dir;
  int angle, angleDir;
  int[] scale;
  String expression, action, hair, body;
  color hairColor, bodyColor;
  int speed,arm;
  boolean up;

  public Character(PVector newPos, int[] newScale, String newExp, String newAct, String newHair, String newBody) {
    pos = newPos;
    dir = new PVector(0, 0);
    scale = newScale;
    angle = 0;
    angleDir = 1;
    expression = newExp;
    action = newAct;
    hair = newHair;
    body = newBody;
    hairColor = color((int) random(255), (int) random(255), (int) random(255));
    bodyColor = color((int) random(255), (int) random(255), (int) random(255));
    if (hair.equals("mc")) {
      hairColor = color(97, 71, 25);
      bodyColor = color(219, 60, 48);
    }
    speed=5;
    arm=80;
    up=false;
  }
  
  public PVector pos(){
    return pos;
  }
  
  public void setX(int X){
    pos=new PVector(X,pos.y);
  }

  public void setPos(PVector newPos){
    pos=newPos;
  }
  
  public int[] getScale(){
    return scale;
  }
  
  public void up(){
    up=true;
  }
  

  public void setAction(String newAction) {
    action = newAction;
  }

  public void setDir(PVector newDir) {
    dir = newDir;
  }

  public void setScale(int[] newScale) {
    scale = newScale;
  }

  public void animate() {
    pos.add(dir);
    if (angleDir > 0) {
      angle+=3;
    }
    if (angleDir < 0) {
      angle-=3;
    }
    if (angle > 30 || angle < -30) {
      angleDir *= -1;
    }
  }
  
  
  void jump(){
    int jumpHeight=300;
    dir=new PVector(0,speed);
    pos.add(dir);
    if(pos.y<=360 || pos.y>=460){
      speed*=-1;
    }
    if(angleDir>0){
      arm++;
    }
    if(angleDir<0){
      arm--;
    }
    if(arm>=100 || arm<=70){
      angleDir*=-1;
    }
    
  }

  void side() {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale[0], scale[1]);
    //body

    if (action.equals("walking")) {
      //hands
      rotate(radians(angle));
      fill(237, 215, 175);
      circle(0, 60, 15);

      rotate(radians(-angle));
    }

    //body
    fill(bodyColor);
    if (body.equals("mc")) {
      quad(-6, 28, 6, 28, 15, 78, -15, 78);
    } else {
      quad(-6, 28, 6, 28, 6, 78, -6, 78);
    }

    //head
    fill(237, 215, 175);
    circle(0, 0, 50);
    fill(0);
    circle(17, 4, 5);
    if (expression.equals("almost crying")) {
      noFill();
      arc(22, 12, 7, 7, 3.1, 5.2);
      fill(255);
      ellipse(12, 7, 8, 5);
    }
    if (expression.equals("crying")) {
      noFill();
      arc(22, 12, 7, 7, 3.1, 5.2);
      fill(174, 249, 252);
      rect(15, 6, 4, 20);
    }
    if (expression.equals("happy")) {
      noFill();
      arc(19, 10, 10, 5, 1.5, 2.8);
    }
    if (expression.equals("sad")) {
      noFill();
      arc(19, 15, 8, 5, 3, 5.3);
    }
    if (expression.equals("angry")) {
      noFill();
      arc(19, 15, 8, 5, 3, 5.3);
      noStroke();
      fill(237, 215, 175);
      arc(17, 4, 7, 7, 4.2, 6.2, CHORD);
    }
    if (expression.equals("suprised")) {
      fill(200);
      noStroke();
      circle(22, 12, 7);
      stroke(0);
      arc(22, 12, 7, 7, 2.3, 5.2);
    }

    //hair
    stroke(0);
    fill(hairColor);
    if (hair.equals("mc") || hair.equals("girl")) {
      arc(0, 17, 70, 100, 1.8, TWO_PI - QUARTER_PI, PIE);
    } else {
      arc(0, 0, 60, 60, 1.8, TWO_PI - QUARTER_PI, PIE);
    }

    if (action.equals("standing")) {
      //hands
      fill(237, 215, 175);
      
      if(up){
        circle(0, 60-arm, 15);
      }
      else{
        circle(0, 60, 15);
      }
      //feet
      fill(255);
      arc(0, 100, 25, 20, PI, TWO_PI);
    }

    if (action.equals("walking")) {
      rotate(radians(-angle));
      fill(237, 215, 175);
      circle(0, 60, 15);
      //feet
      rotate(radians(2 * angle));
      rotate(radians(-1.5 * angle));
      fill(255);
      arc(0, 100, 25, 20, PI, TWO_PI);

      rotate(radians(angle));
      fill(255);
      arc(0, 100, 25, 20, PI, TWO_PI);
    }

    popMatrix();
  }

  void front() {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(scale[0], scale[1]);

    //hair 
    fill(hairColor);
    ellipse(0, 17, 70, 100);

    //body
    fill(bodyColor);
    quad(-6, 28, 6, 28, 28, 78, -28, 78);

    //head
    fill(237, 215, 175);
    circle(0, 0, 50);
    fill(0);
    circle(-15, 2, 5);
    circle(15, 2, 5);

    if (expression.equals("happy")) {
      noFill();
      arc(0, 2, 10, 10, 0, PI);
    }
    if (expression.equals("suprised")) {
      circle(0, 7, 10);
    }
    if (expression.equals("sad")) {
      noFill();
      arc(0, 6, 10, 10, PI, TWO_PI);
    }
    if (expression.equals("angry")) {
      noFill();
      arc(0, 6, 10, 10, PI, TWO_PI);
      noStroke();
      fill(237, 215, 175);
      arc(-15, 2, 7, 7, 4.2, 6.2, CHORD);
      arc(15, 2, 7, 7, 3.1, 5.2, CHORD);
    }
    if (expression.equals("almost crying")) {
      noFill();
      arc(0, 6, 10, 10, PI, TWO_PI);
      fill(255);
      ellipse(-19, 4, 8, 3);
      ellipse(19, 4, 8, 3);
    }
    if (expression.equals("crying")) {
      noFill();
      arc(0, 6, 10, 10, PI, TWO_PI);
      fill(174, 249, 252);
      rect(-17, 4, 4, 20);
      rect(13, 4, 4, 20);
    }

    //hands
    stroke(0);
    fill(237, 215, 175);
    circle(-34, 60, 15);
    circle(34, 60, 15);

    //feet
    fill(255);
    arc(-10, 100, 15, 20, PI, TWO_PI);
    arc(10, 100, 15, 20, PI, TWO_PI);

    popMatrix();
  }
  
  
  
}
