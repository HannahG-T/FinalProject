class Simon{
  PImage[] images=new PImage[4];
  PImage[] selected=new PImage[4];
  PVector[] pos=new PVector[4];
  ArrayList<Integer> order;
  ArrayList<Integer> answers;
  int size;
  boolean sequence=true;
  int curOrder;
  int grade=100;
  int select=-1;

  int flashDuration=100;
  int flashTimer=0;
  
  boolean completed=false;


  public Simon(){
    size=100;
    images[0]=loadImage("images/simon0.png");
    images[1]=loadImage("images/simon1.png");
    images[2]=loadImage("images/simon2.png");
    images[3]=loadImage("images/simon3.png");

    selected[0]=loadImage("images/selectedSimon0.png");
    selected[1]=loadImage("images/selectedSimon1.png");
    selected[2]=loadImage("images/selectedSimon2.png");
    selected[3]=loadImage("images/selectedSimon3.png");

    pos[0]=new PVector(120,150);
    pos[1]=new PVector(340,150);
    pos[2]=new PVector(560,150);
    pos[3]=new PVector(780,150);

    order=new ArrayList<Integer>();
    answers=new ArrayList<Integer>();
    for (int i=0; i< 4;i++){
      order.add((int)random(4));
    }
    curOrder=0;
  }

  public void draw(){
    for(int i=0;i<4;i++){
      if(i==select){
        image(selected[i],pos[i].x,pos[i].y,size,size);
      }
      else{
        image(images[i],pos[i].x,pos[i].y, size, size);
      }
    }
    if(sequence){
      if(frameCount%flashDuration==0 && curOrder<=order.size()){
        select=order.get(curOrder);
        curOrder++;
        flashTimer=frameCount;
      }
      if(frameCount-flashTimer>=flashDuration/2){
        select=-1;
      }
      if(curOrder>=order.size()){
        sequence=false;
        curOrder=0;
        select=-1;
      }

    }
    if(completed){
      grade();
    }

  }

public void select(PVector clicked){
  int num=0;
  for (int i=0;i<4;i++){
    PVector p=pos[i];
    if(clicked.y>p.y && clicked.y<p.y+size && clicked.x>p.x && clicked.x<p.x+size){
      num=i;
      select=i;
      answers.add(i);
      delay(2000);
      select= -1;
      checkAnswer();
      break;
    }
  }
}

public void checkAnswer(){
  int index=answers.size()-1;
  if(answers.get(index)!=order.get(index)){
    grade-=10;
    grade();
    completed=true;
  }
  else if(answers.size()==order.size()){
    grade();
    completed=true;
  }
}


public void grade(){
  pushMatrix();
  translate(width/2, height/2);
  if(grade>65 &&answers.size()<order.size()){
    background(255,0,0);
    delay(2000);
    background(200);
    circle(0,0,200);
  }
  else if(grade<0){
    fill(0);
    rect(-300,-200, 600,400);
  }
  else{
    fill(100);
    rect(-300,-200,600,400);
  }
  popMatrix();
}

}
