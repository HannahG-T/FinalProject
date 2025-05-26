class Simon{
  PImage[4] images;
  PImage[4] selected;
  PVector[4] pos;
  ArrayList<int> order;
  ArrayList<int> answers;
  int size;
  String cur;
  int curOrder;
  int grade=100;
  int selected;

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
    order=new ArrayList<int>();
    for (int i=0; i< 12;i++){
      order.add(random(4));
    }
    cur="order";
    curOrder=0;
  }

  public void draw(){
    if(cur.equals("order")){
      for(int i=0;i<4;i++){
        if(i==order.get(curOrder)){
          image(selected[i],pos[i].x, pos[i].y, size, size);
        }
        else{
          image(selected[i],pos[i].x, pos[i].y, size, size);
        }
      }
      curOrder++;
      if(curOrder>order.size()){
        cur="answer";
      }
    }
    else{
       for(int i=0;i<4;i++){
         if(i==selected){
           image(selected[i],pos[i].x, pos[i].y, size, size);
         }
         else{
           image(selected[i],pos[i].x, pos[i].y, size, size);
         }
      }
    }

  }

public void select(int num){
  selected=num;
  answers.add(num);
}
  

}
