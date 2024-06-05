import javax.swing.JOptionPane;
//global variables
int room = 0;
int colors[] = {255, 255, 255, 255, 255, 255};
int i = 0;
int posS = 0;
int f = 0;
String favFood;
//images
PImage bg;
PImage back;
PImage santa;

void setup()
{
  size(1000, 1000);
  surface.setTitle("The Gifts of Proggramming Fundementals");
  bg = loadImage("bg.jpg");    //loading images
  back = loadImage("back.png");
  santa = loadImage("santa.png");
  favHoliday();
  JOptionPane.showMessageDialog (null, "Correct", "Correct", JOptionPane.PLAIN_MESSAGE);
}

void draw()
{

  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Main Room
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  if (room == 0)
  {
    image(bg, 0, 0, width, height);
    //presents
    present(150, 700, 210, 4, 45, 255, 215, 0, 1);
    present(327, 820, 135, 206, 250, 255, 255, 255, 2);
    present(554, 820, 50, 205, 50, 178, 34, 34, 3);
    present(732, 700, colors[0], colors[1], colors[2], colors[3], colors[4], colors[5], 4);
    //christmas tree
    fill(92, 44, 6);
    rect(450, 670, 100, 130);
    fill(34, 139, 34);
    triangle(300, 670, 700, 670, 500, 350);
    triangle(350, 520, 650, 520, 500, 250);
    triangle(400, 370, 600, 370, 500, 200);
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Room 1
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  else if (room == 1)
  {
    background(255, 204, 203);
    backArrow();
    roomName("Gift of Shapes");
    //gingerbreadman
    fill(205, 133, 63);
    noStroke();
    rect(400, 290, 200, 350, 70);
    circle(500, 220, 200);
    rect(400, 530, 90, 350, 45);
    rect(510, 530, 90, 350, 45);
    rect(500, 290, 350, 90, 45);
    rect(150, 290, 350, 90, 45);
    fill(255);
    circle(463, 186, 30);
    circle(537, 186, 30);
    fill(210, 43, 43);
    arc(500, 240, 100, 100, 0, PI, CHORD);
    fill(205, 133, 63);
    arc(500, 245, 80, 80, 0, PI, CHORD);
    fill(218, 112, 214);
    square(480, 330, 40);
    ellipse(500, 420, 40, 60);
    triangle(500, 470, 480, 510, 520, 510);
    stroke(0);
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Room 2
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  else if (room == 2)
  {//randomness variables
    float ranX = random(0, 700);
    float ranY = random(200, 950);
    float ranS = random(10, 120);
    background(100, 149, 237);
    backArrow();
    roomName("Gift of Text");
    //hohoho text
    fill(0);
    textAlign(LEFT);
    textSize(ranS);
    text("HoHoHo", ranX, ranY);
    delay(400);
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Room 3
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  else if (room == 3)
  {
    background(144, 238, 144);
    backArrow();
    roomName("Gift of Strings");
    while (f==0) {
      favFood = (JOptionPane.showInputDialog ("What is your favourite Christmas Food", "Turkey"));
      f++;
    }
    textAlign(LEFT);
    fill(0);
    textSize(40);
    text("Your Favourite Christmas Food is: " + favFood, 20, 300);
    text("It's This Many Letters Long: " + favFood.length(), 20, 400);
    text("Your Favourite Christmas Food but ANGRY: " + favFood.toUpperCase(), 20, 500);
    text("Your Favourite Christmas Food but shy: " + favFood.toLowerCase(), 20, 600);
  }

  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Room 4
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  else if (room == 4)
  {
    background(255, 255, 153);
    backArrow();
    roomName("Gift of JOptionPane");
    fill(0);
    text("To Try Again Press r", 500, 350);
    present(440, 500, colors[0], colors[1], colors[2], colors[3], colors[4], colors[5]);
    while (i==0) {    //making present
      JOptionPane.showMessageDialog (null, "Here you can create your own present!", "Your Own Present", JOptionPane.PLAIN_MESSAGE);
      int reply = JOptionPane.showConfirmDialog (null, "Would You Like to Try?", "Your Own Present", JOptionPane.YES_NO_OPTION);
      if (reply == JOptionPane.YES_OPTION) {
        for (int j=0; j<2; j++)    //questions loop
        {
          colors[j*3] = Integer.parseInt(JOptionPane.showInputDialog ("Enter an r value (0-255)", "100"));
          colors[1+j*3] = Integer.parseInt(JOptionPane.showInputDialog ("Enter an g value (0-255)", "100"));
          colors[2+j*3] = Integer.parseInt(JOptionPane.showInputDialog ("Enter an b value (0-255)", "100"));
        }
      }
      i=1;  //this stops it from continiously sending questions
    }
  }
}

void keyPressed()
{  //resets present making
  if (key == 'r')
  {
    i=0;
    room=4;
  }
}

void mouseDragged()
{  //makes santa move across top
  posS++;
  image(santa, posS, 0, 300, 75);
  if (posS==1000)
  {
    posS=0;
  }
}

void mouseMoved()
{  //places lightbulbs on tree when mouse moves
  if (room == 0)
  {
    bulb(650, 650);
    bulb(600, 500);
    bulb(550, 320);
    bulb(475, 450);
    bulb(450, 350);
    bulb(400, 600);
  }
}



//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//My Methods
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void present( int x, int y, int r1, int g1, int b1, int r2, int g2, int b2, int rm) //creates a present, with selected colors and a hitbox
{
  fill(r1, g1, b1);
  square(x + 10, y, 100);
  rect(x, y, 120, 20);

  fill(r2, g2, b2);
  rect(x+50, y, 20, 100);

  stroke(r2, g2, b2);
  strokeWeight(7);
  noFill();
  ellipse(x+40, y, 40, 20);
  ellipse(x+80, y, 40, 20);

  stroke(0);
  strokeWeight(1);
  ellipse(x+40, y, 33, 13);
  ellipse(x+40, y, 47, 27);
  ellipse(x+80, y, 33, 13);
  ellipse(x+80, y, 47, 27);

  hitbox(x, y-18, 120, 118, rm);
}

void present( int x, int y, int r1, int g1, int b1, int r2, int g2, int b2)  //creates a present but with no hitbox
{
  fill(r1, g1, b1);
  square(x + 10, y, 100);
  rect(x, y, 120, 20);

  fill(r2, g2, b2);
  rect(x+50, y, 20, 100);

  stroke(r2, g2, b2);
  strokeWeight(7);
  noFill();
  ellipse(x+40, y, 40, 20);
  ellipse(x+80, y, 40, 20);

  stroke(0);
  strokeWeight(1);
  ellipse(x+40, y, 33, 13);
  ellipse(x+40, y, 47, 27);
  ellipse(x+80, y, 33, 13);
  ellipse(x+80, y, 47, 27);
}

void hitbox(int x, int y, int w, int h, int rm)  //creates an area that can be clicked on to go to another room
{
  if (((mouseX >= x)&&(mouseX <= x+w)) && ((mouseY >= y)&&(mouseY <= y+h)))
  {
    cursor(HAND);
    if (mousePressed == true)
    {
      room = rm;
    }
  } else {
    cursor(ARROW);
  }
}


void backArrow() //used in room to return to the christmas tree room
{
  image(back, 50, 900, 100, 67);
  hitbox(50, 900, 100, 67, 0);
}

void roomName(String name) //used to describe which room the user is currently in
{
  fill(135, 206, 250);
  rect(0, 0, width - 1, 100);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text(name, width/2, 70);
}

void bulb(int x, int y) //used to make bulbs flash
{
  int m = millis();
  if (m%2==0)
  {
    fill(255, 0, 0);
  } else {
    fill(255, 255, 255);
  }
  circle(x, y, 20);
}

void favHoliday() { //used to select favourite holiday
  String choices[] = {"Christmas", "Christmas", "Christmas", "Christmas", "Christmas", "Hint, it's Christmas"};

  JOptionPane.showInputDialog(
    null,
    "What is your favourite holiday?",
    "Your Favourite Holiday",
    JOptionPane.WARNING_MESSAGE,
    null,
    choices,
    choices[1]);
}
