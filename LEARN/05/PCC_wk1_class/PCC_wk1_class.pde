//September 03th - Sunday
//SCI 6349 - in class week 01
//Martin Fernandez

//global variables
float xCoordinate  = 10;
float yCoordinate  = 10;
int rectWidth    = 200;
int rectHeight   = 150;
float r = 0;
float g = 0;
float b = 0;
float a = 0;


void setup() {
  size(600, 600);            //size of the screen
  background(0);             //set the background black
  smooth();                  //smooth line edge
  frameRate(30);
}

void draw() {
  
  xCoordinate  = random( width );
  yCoordinate  = random( height );
  r = random (180, 255);
  g = random (255);
  b = random (0, 50);
  a = random (255);
  rectWidth = round( random(2, 200));
  rectHeight = round( random(2, 200));
  
  
  fill(r, g, b, a);
  stroke(255);
  rectMode(CENTER);
  rect( xCoordinate, yCoordinate, rectWidth, rectHeight );
  
}

void keyPressed() {
background(0);
}


//NOTES

/*
rectMode(MODE)    rectMode(CORNERS)   rectMode(CENTER)   rectMode(RADIUS)

int xName = integral (full number) (any name)

frameRate is by default 60. 60 frame per second.
projector ideal to use 30

float = floating point = 1.0 , 1.23 , 2.394
int = integral = 1 , 2 , 3 , 
(int)(witdth * 0.5)
round(height * 0.5)

*/
