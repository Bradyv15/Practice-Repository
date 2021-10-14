
//Initialize all of the variables for the code//
float circleX; 
float circleY=0;
int pgap;
int CSIZE=20; //ball size
int radius=CSIZE/2;
float xspeed=random(-2, 2);
float yspeed=2;
int score=0;
boolean winning=true;
int pheight=20;
int pwidth=100;

void setup() {
  size(700, 700);
  
  //Place the paddle and ball in their starting positions//
  circleX=width/2; 
  pgap=height-30;
}

void draw() {

  //Make the background plain while the mouse is not pressed and the game is being played//
  if (!mousePressed && winning) {
    background(255);
  }

//Make the Game Over Text Appear on the Screen//
  if (!winning) {
    textSize(100);
    fill(200, 0, 0);
    text("GAME OVER", 50, 350);
    textSize(50);
    text("Press any key to Start Over", 25, 400);
//Set the points system when the game is running//
  } else {
    //"Points:" Text//
    fill(#78DBE5);
    textSize(25);
    text("points:", 550, 25);
    textSize(20);
    text(score, 640, 25);


    //Create The Paddle for the Game//
    fill(#49FACC);
    rect(mouseX, pgap, pwidth, pheight);

  //Keep the paaddle from going off the right side//
    if (mouseX>width-(pwidth/2)) {
      rect(width-pwidth, pgap, pwidth, pheight);
    }

  //Make it so the ball changes color randomly//
    fill(random(0, 255), random(0, 255), random(0, 255));

  //Set the ball's starting position//
    circle(circleX, circleY, CSIZE);

  //The ball's movement
    circleX=circleX+xspeed;
    circleY=circleY+yspeed;

  // Make the ball bounce off the left and right wall//
    if (circleX<1) {
      xspeed=xspeed*-1;
    } else if (circleX>700) {
      xspeed=xspeed*-1;
    }

    //Make the ball hit the paddle//
    if ((circleX>=mouseX) && (circleX<=mouseX+pwidth) && (circleY+radius>=pgap) && (circleY+radius<=pgap+pheight))
    {
      //Change the speed in both directions//
      xspeed=(xspeed*-1); 
      yspeed=(yspeed*-1);
      xspeed=xspeed+3; //Make the ball speed up//
      println(xspeed);

      //Increase the score by One//
      score=score+1;

    }

    // Get the ball to bounce back down when it hits the top//
    if ((circleY<0)) {
      xspeed=xspeed*-1;
      yspeed=yspeed*-1;
    }


//If the ball goes off the screen, end the game//
    if (circleY>700) {
      winning=false;
    }
  }
}

//Make all the variables reset to their initial values//
void keyPressed() {
  if (!winning) {
    circleY=0;
    xspeed=random(-2, 2);
    yspeed=2;
    score=0;
    winning=true;
  }
}
