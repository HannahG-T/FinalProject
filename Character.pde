class Character{
 PVector pos, dir;
 int scale, angle, angleDir;
 String expression, action, hair, body;
 color hairColor, bodyColor;
 
 public Character(PVector newPos, int newScale, String newExp, String newAct, String newHair, String newBody){
   pos=newPos;
   dir=new PVector(0,0);
   scale=newScale;
   angle=0;
   angleDir=1;
   expression=newExp;
   action=newAct;
   hair=newHair;
   body=newBody;
   hairColor=color((int)random(255),(int) random(255),(int) random(255));
   bodyColor=color((int)random(255),(int) random(255),(int) random(255));
 }
 
 public void setAction(String newAction){
   action=newAction;
 }
 
 public void setDir(PVector newDir){
   dir=newDir;
 }
 
 
 public void animate(){
   pos.add(dir);
   if(angleDir>0){
     angle++;
   }
   if(angleDir<0){
     angle--;
   }
   if(angle>30 || angle<-30){
     angleDir*=-1;
   }
 }
  
  void MCSide(){
  pushMatrix();
  translate(pos.x,pos.y);
  if(dir.x !=0){
  scale(scale*(dir.x/Math.abs(dir.x)),scale);
  }
  else{
    scale(scale,scale);
  }
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
  rotate(radians(angle));
  fill(237,215,175);
  circle(0,60,15);
  
  rotate(radians(-angle));
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
  rotate(radians(-angle));
  fill(237,215,175);
  circle(0,60,15);
  //feet
  rotate(radians(2*angle));
  rotate(radians(-1.5*angle));
  fill(255);
  arc(0,100,25,20,PI, TWO_PI);
  
  rotate(radians(angle));
  fill(255);
  arc(0,100,25,20,PI, TWO_PI);
    
  }
  popMatrix();
  
}
  
  
  
  
}
