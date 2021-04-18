// SCI 6349 - Processing day 0 - September 01th - Martin Fernandez
//Chapter 01 - Exercise

void setup() {
  size(600, 600);            //size of the screen
  background(255);             //set the background white
  smooth();                  //smooth line edge - it helps with anti-linesing 
  frameRate(3);              //frame rate for geometries to spam 
}

void draw() {
  
  //random number generator, number to replace letter "r", "r1", r"2" and r"3"
  //i think the reason i need multiple r value for size, is so each geometry resize independently
  //having the same x and y value for the r in the size, creates perfect geometries 
  //square/circle instead of rectangle/ellipse
  
  float r = random(255);              //random number generator up to 255 for colors
  float r1 = random(600);             //random number generator up to 100 for size line
  float r2 = random(100);             //random number generator up to 100 for size square
  float r3 = random(100);             //random number generator up to 100 for size circle
  
   
  //Lines
  stroke( 200, 100, r, r);             //random color and transparency generator
  line(mouseX, mouseY, r1, r1); 
  
  noStroke();                        //no stroke for remaining geometries
   
  //Rectagles
  fill( 200, 100, r, r);              //random color and transparency generator
  rect(mouseX, mouseY, r2, r2);       //square by mouse location + random number
  
  //Circle
  fill( 200, 100, r, r);               //random color and transparency generator
  ellipse(mouseX, mouseY, r3, r3);     //circle by mouse location + random number
  
}
