class Text{
  PFont font;
  int margin=10;
  int gap=16;
  PVector pos;
  PVector end;
  String[][] dialogue= { {"Once upon a time there was a little girl (press enter to continue)", "This little girl just so happened to go to a very rigorous school...", "And at this rigorous school teachers just so happened to love final projects...", "...", "OH MY GOD I HAVE SO MANY FINAL PROJECTS!", "...", "ehem", "...","sorry","...", "anyways...", "Now this little girl had four projects in four different subjects", "Now it is your job to help her with them", "each teacher will give you instructions when you get to their room", "good luck :)"}, 
                          {"Use the arrow keys to move forward and back", "to go to the next room walk all the way to the right"}, 
                          {"Good day! Welcome to english class!", "Our final project isn't that hard, I just need you to feed my pet snake", "use your arrow keys to move the snake towards the colorful foods", "Successfully eat 10 foods to pass!", "be careful not to hurt my snake by running him into himself or the edges :(", "God speed! :)"},
                          {"Now that you've finished you should go to your next class", "The door to the hallway is just behind me", "If you want to see your grade you can click the gradebook icon in the upper left corner", "Goodbye!"},
                          {"Hello", "Hope you're memory is good because it's time to play memory :)", "A grid of tiles will show up shortly, try and memorize the positions of pairs", "Next they will flip over, use your mouse to reveal them two at a time", "Each time they don't match your grade will drop by two points so be careful", "Good luck"},
                          {"You're free!", "I hope you don't forget everyting during the summer"},
                          {"??", "Why...", "OH RIGHT THE FINAL", "Sorry I'm a little all over the place", "Soon you will see 4 beakers", "Due to mysterious chemical reactions those beakers will flash different colors", "After the sequence click the beakers in the order they flashed", "Don't worry you'll do fine"},
                          {"Good job", "Now you should probably go...", "Some teachers are pretty strict about lateness"},
                          {"You're late", "Use your mouse to click and drag the pieces to their place", "I've even been so nice to give you an outline", "GET STARTED"},
                          {"Oh you're done", "Pray that you passed"}};
  int cur=0;
  int room=0;
  
  
  public Text(){
    font=createFont("Serif", 24);
    textFont(font);
  }
  
  public Text(int size){
    font=createFont("Serif", size);
    textFont(font);
  }
  
  public void drawString(String text,PVector newPos, Character person){
    textAlign((int)newPos.x,(int)newPos.y);
    pos=newPos;
    end=person.pos();
    fill(255);
    triangle(pos.x-10+textWidth(text)/2, pos.y, pos.x+10+textWidth(text)/2, pos.y, end.x+40*person.getScale()[0], end.y);
    ellipse(pos.x+textWidth(text)/2,pos.y-8,textWidth(text)+20,40*textWidth(text)/80);
    fill(0);
    text(text, pos.x, pos.y);
  }
  
  public void draw(String text, PVector newPos){
    textAlign((int)newPos.x,(int) newPos.y);
    fill(0);
    text(text,newPos.x,newPos.y);
  }
  
  public void dialogue(int r, int c){
    rect(200,100,600,200);
    fill(0);
    textSize(30);
    text(dialogue[r][c],250,150,500,200);
    room=r;
    cur=c;
  }

  public int cur(){
    return cur;
  }

  public int room(){
    return room;
  }
  int maxCur(int r){
    return dialogue[r].length;
  }

  
  
}
