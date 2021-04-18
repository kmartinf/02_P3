// SCI 6349 - Processing day 0 - September 03th - Martin Fernandez
//Chapter 01 - Exercise 02

void setup() {
  size(600, 600);              //size of the screen
  background(255);             //set the background white
  smooth();                    //smooth line edge - it helps with anti-linesing 
  //frameRate(3);              //frame rate for geometries to spam 
}

void draw() {}
/*

This code, allows to create random rectangle, elipse, lines in a space by pressing the mouse.
If you pressed a key, it erases it all. The geometries are create by the mouse location as 
initial cordinate or point A. Than last place the mouse was minus a random number gives you
point B. The colors are aswell randomize, all in the scale of warm colors. The transparency is 
aswell randomize, allowing to display overlapts of geometries.

The one thing i dont understand, is why are all the geometries drawned in the top-left corner smaller,
and as they move toward the bottom-right corner, they get larger. I suppose is a coordinate 
pattern. Top-left being smaller numbers in the cartegean and larger number being in the bottom-right.
I imagine, i can move the 0,0 point to the center of the window, and therefore, the farther away
from the center, the large the geometry. While the closer to the center, the smaller???



*/
void mousePressed(){
  float r = random(255);                      //random number generator up to 255 for colors
  float r1 = random(600);                     //random number generator up to 100 for size line
  float r2 = random(100);                     //random number generator up to 100 for size square
  float r3 = random(100);                     //random number generator up to 100 for size circle
  
  //Lines
  stroke( 200, 100, r, r);                   //random color and transparency generator
  line(mouseX, mouseY, (pmouseX + r1), (pmouseY + r1)); 
  
  noStroke();                                  //no stroke for remaining geometries
 
  //Rectagles
  fill( 200, 100, r, r);                       //random color and transparency generator
  rectMode(CENTER);
  rect(mouseX, mouseY, (pmouseX - r2), (pmouseY - r3));      //square by mouse location + random number

  //Circle
  fill( 200, 100, r, r);                     //random color and transparency generator
  ellipse(mouseX, mouseY, (pmouseX - r3), (pmouseY - r2));           //circle by mouse location + random number
  
  
}

void keyPressed(){
  background(255);
}
