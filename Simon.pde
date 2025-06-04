class Simon {
  PImage[] images = new PImage[4];
  PImage[] selected = new PImage[4];
  PVector[] pos = new PVector[4];

  ArrayList<Integer> order;
  ArrayList<Integer> answers;

  int size = 100;
  int flashIndex = 0;
  int flashDuration = 1000;
  int flashStartTime = 0;
  int startTime=5000;
  boolean flashing = true;

  int select = -1;
  Grade grade = new Grade("Science", 100);
  boolean completed = false;
  boolean showGradeScreen = false;
  int gradeScreenTime = 0;
  int gradeDisplayDuration = 2000;

  Simon() {
    for (int i = 0; i < 4; i++) {
      images[i] = loadImage("images/simon" + i + ".png");
      selected[i] = loadImage("images/selectedSimon" + i + ".png");
    }

    pos[0] = new PVector(120, 150);
    pos[1] = new PVector(340, 150);
    pos[2] = new PVector(560, 150);
    pos[3] = new PVector(780, 150);

    order = new ArrayList<Integer>();
    answers = new ArrayList<Integer>();
    for (int i = 0; i < 4; i++) {
      order.add((int)random(4));
    }

    flashStartTime = millis();
  }

  void draw() {
    background(200);

    for (int i = 0; i < 4; i++) {
      if (i == select) {
        image(selected[i], pos[i].x, pos[i].y, size, size);
      } else {
        image(images[i], pos[i].x, pos[i].y, size, size);
      }
    }

    if (flashing) {
      if (flashIndex < order.size()) {
        if(millis()>startTime){
        if (millis() - flashStartTime >= flashDuration) {
          flashStartTime = millis();
          select = order.get(flashIndex);
          flashIndex++;
        } else if (millis() - flashStartTime >= flashDuration / 2) {
          select = -1;
        }
        }
      } else {
        flashing = false;
        select = -1;
      }
    }
    if(completed){
      showGrade();
    }

    else if (showGradeScreen) {
      if (millis() - gradeScreenTime > gradeDisplayDuration) {
        showGradeScreen = false;
        reset();
      } else {
        showGrade();
      }
    }
  }

  void select(PVector clicked) {
    if (flashing || completed || showGradeScreen) return;

    for (int i = 0; i < 4; i++) {
      PVector p = pos[i];
      if (clicked.x > p.x && clicked.x < p.x + size &&
          clicked.y > p.y && clicked.y < p.y + size) {
        select = i;
        answers.add(i);
        checkAnswer();
        return;
      }
    }
  }

  void checkAnswer() {
    int index = answers.size() - 1;
    if(answers.size()==order.size()){
      completed=true;
    }
    if (answers.get(index) != order.get(index)) {
      grade.minus(10);
      completed=false;
      showGradeScreen = true;
      gradeScreenTime = millis();
    }
    select = -1;
  }

  void showGrade() {
    pushMatrix();
    translate(width / 2, height / 2);
    rectMode(CENTER); 
    if(isCompleted()){
      fill(255);
      quad(-300,-200, 300,-200, 300,200, -300,200);
      Text text=new Text(60);
      if(grade.num()>65){
        text.draw("CONGRATS", new PVector(-180, -100));
        text.draw(grade.string(), new PVector(-150,0));
      }
      else{
        text.draw(":(", new PVector(-50, -100));
        text.draw(grade.string(), new PVector(-150,0));
      }
      fill(255);
      rect(0,130,400,50);
      Text smaller=new Text(40);
      smaller.draw("continue",new PVector(-80,140));
    }
    else{
      fill(255, 0, 0);
      rect(0, 0, 600, 400);
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(32);
      text("Grade: " + grade.num(), 0, 0);
    }
    rectMode(CORNER);
    popMatrix();
  }

  boolean isCompleted() {
    return completed;
  }
  
  void reset(){
    order = new ArrayList<Integer>();
    answers = new ArrayList<Integer>();
    for (int i = 0; i < 4; i++) {
      order.add((int)random(4));
    }

    flashStartTime = millis();
    flashIndex = 0;
    flashing = true;

    select = -1;
    completed = false;
    showGradeScreen = false;
    gradeScreenTime = millis();
    gradeDisplayDuration = 2000;
  }
  
  Grade getGrade(){
    return grade;
  }
}
