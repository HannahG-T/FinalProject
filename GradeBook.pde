class GradeBook{
  ArrayList<Grade> gradebook;
  
  public GradeBook(){
    gradebook=new ArrayList<Grade>();
  }
  
  public void addGrade(String subj, int grade){
    if(gradebook.size()>0 && !(gradebook.get(gradebook.size()-1).subj().equals(subj))){
      gradebook.add(new Grade(subj, grade));
    }
    if(gradebook.size()<=0){
      gradebook.add(new Grade(subj, grade));
    }
  }
  
  public void addGrade(Grade grade){
    if(gradebook.size()>0 && !(gradebook.get(gradebook.size()-1).subj().equals(grade.subj()))){
      gradebook.add(grade);
    }
    if(gradebook.size()<=0){
      gradebook.add(grade);
    }
  }
  
  public void draw(){
    pushMatrix();
    translate(width/2, height/2);
    fill(225);
    quad(-300,-200, 300,-200, 300,200, -300,200);
    square(260,-190,30);
    line(265,-185, 285, -165);
    line(285,-185, 265,-165);
    
    rect(-250,-150, 200,300);
    rect(-50,-150, 300,300);
    
    line(-250,-75,250,-75);
    line(-250,0,250,0);
    line(-250,75,250,75);
    Text text=new Text();
    text.draw("Ela", new PVector(-230,-105));
    text.draw("Math", new PVector(-230,-30));
    text.draw("Sciece", new PVector(-230,45));
    text.draw("History", new PVector(-230,120));
    String[] order={"Ela", "Math", "Science", "History"};
    for(int i=0;i<4;i++){
      boolean written=false;
      for(int j=0;j<gradebook.size();j++){
        if(gradebook.get(j).subj().equals(order[i])){
          text.draw(gradebook.get(j).calcLetter()+"      "+gradebook.get(j).num(), new PVector(-30,-105+i*75));
          written=true;
        }
      }
      if(!written){
        text.draw("-----",new PVector(-30,-105+i*75));
      }
    }
    
    popMatrix();
  }
  
  public void drawFinal(){
    pushMatrix();
    translate(width/2, height/2);
    fill(225);
    
    rect(-250,-150, 200,300);
    rect(-50,-150, 300,300);
    
    line(-250,-75,250,-75);
    line(-250,0,250,0);
    line(-250,75,250,75);
    Text text=new Text();
    text.draw("Ela", new PVector(-230,-105));
    text.draw("Math", new PVector(-230,-30));
    text.draw("Sciece", new PVector(-230,45));
    text.draw("History", new PVector(-230,120));
    String[] order={"Ela", "Math", "Science", "History"};
    for(int i=0;i<4;i++){
      boolean written=false;
      for(int j=0;j<gradebook.size();j++){
        if(gradebook.get(j).subj().equals(order[i])){
          text.draw(gradebook.get(j).calcLetter()+"      "+gradebook.get(j).num(), new PVector(-30,-105+i*75));
          written=true;
        }
      }
      if(!written){
        text.draw("-----",new PVector(-30,-105+i*75));
      }
    }
    
    popMatrix();
    
  }
  
  public ArrayList<Grade> gradebook(){
    return gradebook;
  }
  
  public void drawIcon(){
    pushMatrix();
    translate(0,0);
    fill(225);
    rect(20,20,40,55);
    stroke(0);
    line(25,20, 25,75);
    rect(30,25,25,15);
    popMatrix();
  }
  
}
