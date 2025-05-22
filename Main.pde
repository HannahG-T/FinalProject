int x,y,m,d,speed;
int[] scale={2,2};
PVector pos, dir;
String expression,action;
Character mc;
void setup(){
  background(200);
  size(1000,600);
  x=width/2;
  y=height/2;
  pos=new PVector(x,y);
  dir=new PVector(1,0);
  expression="happy";
  action="walking";
  m=20;
  d=-1;
  speed=1;
  mc=new Character(pos, scale, expression, action, "girl", "girl");
}

void draw(){
  background(200);
  if(keyPressed==false){
      mc.setAction("standing");
      mc.setDir(new PVector(0,0));
  }
  mc.MCSide();
  if(frameCount%speed==0){
    mc.animate();
  }

}





void MCFront(int x, int y,String expression, String action, int[] scale){
  pushMatrix();
  translate(x,y);
  scale(scale[0],scale[1]);
  //hair 
  fill(97,71,25);
  ellipse(0,17,70,100);
  //body
  fill(219,60,48);
  quad(-6,28, 6,28, 28,78, -28,78);
  //head
  fill(237,215,175);
  circle(0,0,50);
  fill(0);
  circle(-15,2,5);
  circle(15,2,5);
  if(expression=="happy"){
    noFill();
    arc(0,2,10,10,0,PI);
  }
  if(expression=="suprised"){
    circle(0,7,10);
  }
  if(expression=="sad"){
    noFill();
    arc(0,6,10,10,PI,TWO_PI);
  }
  if(expression=="angry"){
    noFill();
    arc(0,6,10,10,PI,TWO_PI);
    noStroke();
    fill(237,215,175);
    arc(-15,2,7,7,4.2,6.2,CHORD);
    arc(15,2,7,7,3.1,5.2,CHORD);
    
  }
  if(expression=="almost crying"){
    noFill();
    arc(0,6,10,10,PI,TWO_PI);
    fill(255);
    ellipse(-19,4,8,3);
    ellipse(19,4,8,3);
  }
  if(expression=="crying"){
    noFill();
    arc(0,6,10,10,PI,TWO_PI);
    fill(174,249,252);
    rect(-17,4,4,20);
    rect(13,4,4,20);
  }
  
  //hands
  stroke(0);
  fill(237,215,175);
  circle(-34,60,15);
  circle(34,60,15);
  //feet
  fill(255);
  arc(-10,100,15, 20, PI, TWO_PI);
  arc(10,100,15,20, PI, TWO_PI);
  
  popMatrix();
}



void keyPressed(){
  if(key==CODED){
    if(keyCode==LEFT){
      mc.setAction("walking");
      mc.setDir(new PVector(-2,0));
    }
    if(keyCode==RIGHT){
      mc.setAction("walking");
      mc.setDir(new PVector(2,0));
    }
  }
}


void mouseClicked(){
  int a=x-mouseX;
  int b=y-mouseY;
  print("["+"x-"+a+","+"y-"+b+"]");
}
