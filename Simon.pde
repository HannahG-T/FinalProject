class Simon{
  PImage[4] images;
  PVector[4] pos;
  ArrayList<int> order;
  ArrayList<int> answers;
  int size;
  String cur;
  int curOrder;

  public Simon(){
  size=100;
    images[0]="images/simon0.jpeg";
    images[1]="images/simon1.jpeg";
    images[2]="images/simon2.jpeg";
    images[3]="images/simon3.jpeg";
    pos[0]=new PVector(120,150);
    pos[1]=new PVector(340,150);
    pos[2]=new PVector(560,150);
    pos[3]=new PVector(780,150);
    order=new ArrayList<int>();
    for (int i=0; i< 12;i++){
      order.add(random(4));
    }
  }



}
