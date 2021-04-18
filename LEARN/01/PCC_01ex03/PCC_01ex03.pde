// SCI 6349 - Processing day 1 - September 5th -
//Martin Fernandez
//Chapter 01 - Exercise

//global

  PImage img;         //declare Lebron James
  PImage img2;        //declare Steph Curry
  PImage img3;        //declare Basketball
  float x, y; 
  boolean go=false;
  
  float r  = 0;             //random number generator up to 255 for colors
  float r1 = 0;             //random number generator up to 100 for size line
  float r2 = 0;             //random number generator up to 100 for size square
  float r3 = 0;             //random number generator up to 100 for size circle
  int   s1 = 0;             //speed of the ball
  
  
void setup() {
  size(600, 600);            //size of the screen
  background(255);           //set the background white
  smooth();                  //smooth line edge - it helps with anti-linesing 
  frameRate(6);              //frame rate for geometries to spam 
  
  img = loadImage("james.png");
  img2 = loadImage("curry.png");
  img3 = loadImage("ball.png");
  
}


void draw() {
 
  //background(255);           //set the background white
  s1 = 200;
  r  = random(255);
  r1 = random(600);
  r2 = random(150);
  r3 = random(200);
   
  //LINE MOVEMENT
  stroke( 200, 100, r, r);                    //random color and transparency generator
  strokeWeight (1);
  line(mouseX, mouseY, pmouseX, pmouseY); 
 
  
  noStroke();                                //no stroke for remaining geometries
  
  
  //CIRCLE NOTATING LOCATION
  fill( 0);                                 //random color and transparency generator
  ellipse(mouseX, mouseY, 5, 5);             //circle by mouse location + random number
  
  
  
  //PLAYERS HEADSHOTS!
  tint(255, r);  // Display at half opacity
  image(img, mouseX, mouseY, (r2/2), (r2/2));  
  image(img2, mouseX, mouseY, (r3/3), (r3/3));
  
  //TEXT
  textSize(10);
  text("Try to get the Ball, Click for Rematch, 'S' for Photo Shot", 10, 30);
  
  

//ADDED CODE, I DONT UNDERSTANDED FULLY, THIS CODE MAKES THE BALL MOVE AROUND! 
  PVector p = new PVector( mouseX-x, mouseY-y, 0);
  p.limit(300);
  if (go && dist(mouseX, mouseY, x, y)<500) {
    x-=p.x;
    y-=p.y;
  }
  x = constrain(x, s1 ,width-s1);
  y = constrain(y, s1 ,height-s1);
  image (img3, x, y, 30, 30);
//ADDED CODE, I DONT UNDERSTANDED FULLY, THIS CODE MAKES THE BALL MOVE AROUND!

   }





void mouseMoved() {  go=true; }

void mousePressed()  {
    background( 255 );
    println("GAME OVER!!!!  GAME OVER!!!!   GAME OVER!!!!  GAME OVER!!!!"); }

void keyReleased ()
 { if (key == 's') { }
  saveFrame();
  println( "SMILE, Picture Taken!" ); }
