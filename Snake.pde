/**
 * SNAKE GAME
 * Rules:
 *     Eat the food
 *     Do not bite your own tail
 *     Do not hit a wall
 * Specifications:
 *     The snake grows when eat food
 *     The speed increases when the snake grows
 *     Food is displayed randomly
 *     Food and parts of the snake body are squares
 */
class Snake{
// global variables
ArrayList<PVector> snake = new ArrayList<PVector>(); // snake body (not included the head)
PVector pos; // snake position (position of the head)
color snakeColor;

StringList mode_list = new StringList(new String[] {"border", "no_border"}); // if you implement both functionalities
int mode_pos = 0; // mode 1 by default - if hits wall wraps around
String actual_mode = mode_list.get(mode_pos); // current mode name

PVector food; // food position
color foodColor;
PVector dir = new PVector(0, 0); // snake direction (up, down, left right)

int size = 40; // snake and food square size
int w, h; // how many snakes can be allocated

int spd = 20; // reverse speed (smaller spd will make the snake move faster)
int len = 4; // snake body

boolean completed= false;
Grade grade=new Grade("Ela", 100);
boolean showGradeScreen = false;
int gradeScreenTime = 0;
int gradeDisplayDuration = 2000;

public Snake() {
  w = width/size;
  h = height/size;
  snakeColor=color(33, 196, 50);
  
  pos = new PVector(w/2, h/2); // Initial snake position
  newFood(); // create 2D vector
  
  noStroke();
  fill(0);
}

void draw() {
  background(200);
  int c=0;
  if (len>10){
    completed=true;
  }

  for(int i=0;i<w;i++){
    for(int j=0;j<h;j++){
      if((j+i)%2==0){
        fill(34,92,40);
      }
      else{
        fill(44,148,55);
      }
      square(i*size,j*size,size);
      c++;
    }
  }
  if (!completed){
  drawSnake();
  drawFood();
  
  
  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();   
  }
  }
  if(completed){
    drawGrade();
  }

  if (showGradeScreen) {
      if (millis() - gradeScreenTime > gradeDisplayDuration) {
        showGradeScreen = false;
        reset();
      } else {
        drawGrade();
      }
    }
}

boolean isCompleted(){
  return completed;
}

Grade grade(){
  return grade;
}

void drawGrade(){
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

// draw the food item (square) which size is tha variable size
void drawFood() {
  //YOUR CODE HERE
  fill(foodColor);
  square(food.x * size, food.y * size, size);
}

//declare a new pVector (random) for ood
void newFood() {
  foodColor=color(int(random(256)),int(random(256)),int(random(256)));
  food = new PVector(int(random(w)), int(random(h)));
  //food = new PVector...
}

// draw snake, consider the snake array size (each square of size size) + square of the current pos
void drawSnake() {
  fill(snakeColor);
  for (PVector coord : snake) {
    square(coord.x * size, coord.y * size, size);
  }
  fill(snakeColor); 
  square(pos.x * size, pos.y * size, size);
  /// YOUR CODE HERE
}

void updateSnake() {
  // Add current position(head) to snake ArrayLIst
  snake.add(pos.copy());

  // Check the size of snake. Remove some items from snake ArrayList if needed
  while (snake.size() > len) {
    snake.remove(0);
  }

  // Calculate new position of snake (head). You must use the direction vector for this calculation
  pos.add(dir.copy());

    // If snake (head) hits food, add +1 to the snake size and create a new food
  if (pos.equals(food)) {
    len++;
    if (spd > 1){
      spd--;
    }
    snakeColor=foodColor;
    newFood();
  }

  // If snake (head) eats itself, gameover, reset()
  for (PVector coord : snake) {
    if (coord.equals(pos) && (dir.x!=0 || dir.y!=0)) {
      grade.minus(5);
      showGradeScreen=true;
      gradeScreenTime=millis();
      reset();
    }
  }

  // If mode 'no_border', snake is out of screen, wraps around
  // If mode 'border', when snake hit a border, gameover, reset()
  if (actual_mode.equals("border")) {
    if (pos.x < 0 || pos.x >= w || pos.y < 0 || pos.y >= h) {
      grade.minus(5);
      showGradeScreen=true;
      gradeScreenTime=millis();
      reset();
    }
  } else if (actual_mode.equals("no_border")) {
    if (pos.x < 0){ 
      pos.x = w - 1;
    }
    if (pos.x >= w){
      pos.x = 0;
    }
    if (pos.y < 0){
      pos.y = h - 1;
    }
    if (pos.y >= h) {
      pos.y = 0;
    }
  }
}

void reset() {
  spd = 20;
  len = 5;
  pos = new PVector(w / 2, h / 2);
  dir = new PVector(0, 0);
  snake = new ArrayList<PVector>();
  newFood();
  snakeColor=color(33, 196, 50);
  gradeScreenTime = millis();
  gradeDisplayDuration = 2000;
}

void setDir(PVector newDir){
  dir=newDir;
}


void keyPressed() {
  // if UP is pressed => dir = new PVector(...)
  // same thing for DOWN, LEFT, RIGHT
  // UP (0, -1)
  // DOWN(0, 1)
  // LEFT(-1,0)
  // RIGHT(1,0)
  if (key == CODED) {
    if (keyCode == UP && !(dir.y == 1)) {
      dir = new PVector(0, -1);
    } else if (keyCode == DOWN && !(dir.y == -1)) {
      dir = new PVector(0, 1);
    } else if (keyCode == LEFT && !(dir.x == 1)) {
      dir = new PVector(-1, 0);
    } else if (keyCode == RIGHT && !(dir.x == -1)) {
      dir = new PVector(1, 0);
    }
  } else {
    if (key == 'm') {
      mode_pos = (mode_pos + 1) % mode_list.size();
      actual_mode = mode_list.get(mode_pos);
      showGradeScreen=true;
      gradeScreenTime=millis();
    }
    if (key == '+') {
      size += 5;
      w = width / size;
      h = height / size;
      showGradeScreen=true;
      gradeScreenTime=millis();
    }
    if (key == '-' && size > 10) {
      size -= 5;
      w = width / size;
      h = height / size;
      showGradeScreen=true;
      gradeScreenTime=millis();
    }
  }
}
}

// EXTRA FOR STUDENTS WHO FINISH WITH THE REQUIRED TASKS
// if '+' is pressed, increase the size of the squares (and recalculate w and h)
// same thing for '-'
// when 'm' is pressed, change the mode -> ONLY IF YOU IMPLEMENT BOTH MODES
// add colors: 
//     1. make the food colorful and when the snake eats the food, it adopts that color
//     2. make the backgroud looks like a grid adding colorsp
