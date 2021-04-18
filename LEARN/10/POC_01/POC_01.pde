// SCI 6349 - Processing day 0 - August 30th
//Chapter 01

void setup() {
  size(600, 300);            //size of the screen
  
  smooth();                  //smooth line edge - it helps with anti-linesing 
}

void draw() {
  
  background(0, 0, 0);       //set the background black
  
  // line section
  
  stroke(154 , 44, 198);    //set line value to white
  strokeWeight(4);          //set line width 4 pixels 
  line (10, 80, 30, 40);    //left line
  line (20, 80, 40, 40); 
  line (30, 80, 50, 40);    //middle line
  stroke(8, 201, 45);        //set line value to red
  strokeWeight(2);          //set line width 2 pixels
  line (40, 80, 60, 40);
  line (50, 80, 70, 40);    //right line
  
  // rectangle section
  
  // noStroke();
  fill( 146, 250, 204 ) ; 
  // noFill();
  rect( 100, 50, 200, 100 );
  
  fill( 233, 27, 245, 100);
  stroke ( 233, 27, 245, 255);
  rect( 160, 23, 75, 234 );
  
}
