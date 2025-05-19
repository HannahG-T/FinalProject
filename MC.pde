int x,y,m,d,speed;
int[] scale={2,2};
String expression,action;
void setup(){
  background(200);
  size(400,600);
  x=width/2;
  y=height/2;
  expression="happy";
  action="walking";
  m=20;
  d=-1;
  speed=1;
  MCSide(x,y,expression,action,scale,m);
}

void draw(){
  background(200);
  MCSide(x,y,expression,action,scale,m);
  if(frameCount%speed==0){
    if(d>0){
      m++;
    }
    if(d<0){
      m--;
    }
    if(m<-30 || m>30){
      d*=-1;
    }
  }

}


void MCSide(int x, int y,String expression, String action, int[] scale,int m){
  pushMatrix();
  translate(x,y);
  scale(scale[0],scale[1]);
  //body
  
  
  if(action=="standing"){
    fill(219,60,48);
  quad(-6,28, 6,28, 15, 78, -15,78);
  //head
  fill(237,215,175);
  circle(0,0,50);
  fill(0);
  circle(17,4,5);
  if(expression=="almost crying"){
    noFill();
    arc(22,12,7,7,3.1,5.2);
    fill(255);
    ellipse(12,7,8,5);
    
  }
  if(expression=="crying"){
    noFill();
    arc(22,12,7,7,3.1,5.2);
    fill(174,249,252);
    rect(15,6,4,20);
  }
  if(expression=="happy"){
    noFill();
    arc(19,10,10,5,1.5,2.8);
  }
  if(expression=="sad"){
    noFill();
    arc(19,15,8,5,3,5.3);
  }
  if(expression=="angry"){
    noFill();
    arc(19,15,8,5,3,5.3);
    noStroke();
    fill(237,215,175);
    arc(17,4,7,7,4.2,6.2,CHORD);
  }
  if(expression=="suprised"){
    fill(200);
    noStroke();
    circle(22,12,7);
    stroke(0);
    arc(22,12,7,7,2.3,5.2);
  }
  //hair
  stroke(0);
  fill(97,71,25);
  arc(0,17,70,100, 1.8, TWO_PI-QUARTER_PI,PIE);
  //hands
  fill(237,215,175);
  circle(0,60,15);
  //feet
  fill(255);
  arc(0,100,25,20,PI, TWO_PI);
  }
  
  if(action=="walking"){
  //hands
  rotate(radians(m));
  fill(237,215,175);
  circle(0,60,15);
  
  fill(219,60,48);
  quad(-6,28, 6,28, 15, 78, -15,78);
  //head
  fill(237,215,175);
  circle(0,0,50);
  fill(0);
  circle(17,4,5);
  if(expression=="almost crying"){
    noFill();
    arc(22,12,7,7,3.1,5.2);
    fill(255);
    ellipse(12,7,8,5);
    
  }
  if(expression=="crying"){
    noFill();
    arc(22,12,7,7,3.1,5.2);
    fill(174,249,252);
    rect(15,6,4,20);
  }
  if(expression=="happy"){
    noFill();
    arc(19,10,10,5,1.5,2.8);
  }
  if(expression=="sad"){
    noFill();
    arc(19,15,8,5,3,5.3);
  }
  if(expression=="angry"){
    noFill();
    arc(19,15,8,5,3,5.3);
    noStroke();
    fill(237,215,175);
    arc(17,4,7,7,4.2,6.2,CHORD);
  }
  if(expression=="suprised"){
    fill(200);
    noStroke();
    circle(22,12,7);
    stroke(0);
    arc(22,12,7,7,2.3,5.2);
  }
  //hair
  stroke(0);
  fill(97,71,25);
  arc(0,17,70,100, 1.8, TWO_PI-QUARTER_PI,PIE);
  rotate(radians(-2*m));
  fill(237,215,175);
  circle(0,60,15);
  //feet
  rotate(radians(2*m));
  rotate(radians(-1.5*m));
  fill(255);
  arc(0,100,25,20,PI, TWO_PI);
  
  rotate(radians(m));
  fill(255);
  arc(0,100,25,20,PI, TWO_PI);
    
  }
  popMatrix();
  
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






void mouseClicked(){
  int a=x-mouseX;
  int b=y-mouseY;
  print("["+"x-"+a+","+"y-"+b+"]");
}
