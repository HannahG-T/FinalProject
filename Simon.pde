class Simon {
  PImage[] images = new PImage[4];
  PImage[] selected = new PImage[4];
  PVector[] pos = new PVector[4];

  ArrayList<Integer> order;
  ArrayList<Integer> answers;

  int size = 100;
  int flashIndex = 0;
  int flashDuration = 500;
  int flashStartTime = 0;
  boolean flashing = true;

  int select = -1;
  int grade = 100;
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
        if (millis() - flashStartTime >= flashDuration) {
          flashStartTime = millis();
          select = order.get(flashIndex);
          flashIndex++;
        } else if (millis() - flashStartTime >= flashDuration / 2) {
          select = -1;
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
    if (answers.get(index) != order.get(index)) {
      grade -= 10;
      completed = true;
      showGradeScreen = true;
      gradeScreenTime = millis();
    } else if (answers.size() == order.size() && answers.get(index) != order.get(index)) {
      completed = true;
    }
    select = -1;
  }

  void showGrade() {
    pushMatrix();
    translate(width / 2, height / 2);
    rectMode(CENTER);
    if (grade < 0) {
      fill(0);
      rect(0, 0, 600, 400);
    } else if (grade > 65 && answers.size() < order.size()) {
      fill(255, 0, 0);
      rect(0, 0, 600, 400);
    } else {
      fill(100);
      rect(0, 0, 600, 400);
    }
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("Grade: " + grade, 0, 0);
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
}
