class Grade{
  int numGrade;
  String subject;
  char letterGrade;
  
  public Grade(String subj, int grade){
    subject=subj;
    numGrade=grade;
    calcLetter();
  }
  
  public void minus(int num){
    numGrade-=num;
  }
  
  public void add(int num){
    numGrade+=num;
  }
  
  public String toString(){
    return subject+":"+letterGrade;
  }
  
  public String string(){
    return letterGrade+"         "+numGrade;
  }
  
  public int num(){
    return numGrade;
  }
  
  public String subj(){
    return subject;
  }
  
  public char calcLetter(){
    if(numGrade>90){
      letterGrade='A';
    }
    else if(numGrade>80){
      letterGrade='B';
    }
    else if(numGrade>70){
      letterGrade='C';
    }
    else if(numGrade>65){
      letterGrade='D';
    }
    else{
      letterGrade='F';
    }
    return letterGrade;
  }
  
  
}
