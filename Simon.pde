class Simon{
  PImage[4] images=new PImage[4];
  PImage[4] selected=new PImage[4];
  PVector[4] pos;
  ArrayList<Integer> order;
  ArrayList<Integer> answers;
  int size;
  boolean sequence=true;
  int curOrder;
  int grade=100;
  int select=-1;

  int flashDuration=30;
  int flashtimer=0;


  public Simon(){
    size=100;
    images[0]="images/simon0.jpeg";
    images[1]="images/simon1.jpeg";
    images[2]="images/simon2.jpeg";
    images[3]="images/simon3.jpeg";

    selected[0]="images/selectedSimon0.jpeg";
    selected[1]="images/selectedSimon1.jpeg";
    selected[2]="images/selectedSimon2.jpeg";
    selected[3]="images/selectedSimon3.jpeg";

    pos[0]=new PVector(120,150);
    pos[1]=new PVector(340,150);
    pos[2]=new PVector(560,150);
    pos[3]=new PVector(780,150);

    order=new ArrayList<Integer>();
    answers=new ArrayList<Integer>();
    for (int i=0; i< 12;i++){
      order.add(random(4));
    }
    curOrder=0;
  }

  public void draw(){
    for(int i=0;i<4;i++){
      if(i==select){
        image(selectedImages[i],pos[i].x,pos[i].y,size,size);
      }
      else{
        image(images[i],pos[i].x,pos[i].y, size, size);
      }
    }
    if(sequence){
      if(frameCount%flashDuration==0 && curOrder<order.size()){
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

  }

public void select(PVector clicked){
  int num=0;
  for (int i=0;i<4;i++){
    PVector p=pos[i]
    if(clicked.y>p.y && clicked.y<p.y+size && clicked.x>p.x && clicked.x<p.x+size){
      num=i;
      select=i;
      answers.add(i);
      delay(200);
      currentSelected= -1;
      checkAnswer();
      break;
    }
  }
}

public void checkAnswer(){
  int index=answers.size()-1;
  if(answers.get(index)!=order.get(index)){
    grade-=10;
    drawFail();
  }
  else if(answers.size()==order.size()){
    grade();
  }
}

public void drawFail(){
  if(grade>65){
    background(255,0,0);
    delay(200);
    background(200);
  }
  else{
    rect(-300,-200, 600,400);
  }
}

public void grade(){
  rect(-300,-200,600,400);
}

}
