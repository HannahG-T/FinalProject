class GradeBook{
  ArrayList<Grade> gradebook;
  
  public GradeBook(){
    gradebook=new ArrayList<Grade>();
  }
  
  public void addGrade(String subj, int grade){
    gradebook.add(new Grade(subj, grade));
  }
  
  public void draw(){
    pushMatrix();
    translate(width/2, height/2);
    fill(225);
    quad(-300,-200, 300,-200, 300,200, -300,200);
    square(230,-180,40);
    line(235,-175, 265, -125);
    line(275,-175, 225,-125);
    popMatrix();
  }
  
  public void drawIcon(){
    fill(225);
    rect(20,20,40,55);
    line(25,20, 25,75);
    rect(30,25,25,15);
  }
  
}
