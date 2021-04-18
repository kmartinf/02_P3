class Car{

//position and motion
float xLoc = 0;
float yLoc = 0;
float xVel = 0;
float yVel = 0;


//color
int r = 0;
int g = 0;
int b = 0;

//shape size
int sWidth = 0;
int sHeight = 0;

int drawType = 0;




Car()
{
  
  sWidth = 25;
  sHeight = 10;
  
  r = 100;
  g = 50;
  b = 200;
  
  xLoc = random ( 0, width);
  yLoc = random ( 0, height);
  xVel = random (-5, 5);
  yVel = random (0);
  
  drawType = (int)random(0,4);
}




Car( int rIn, int gIn, int bIn )
{
  
  r = rIn;
  g = gIn;
  b = bIn;
  
  sWidth = 25;
  sHeight = 10;
  
  xLoc = random ( 0, width);
  yLoc = random ( 0, height);
  xVel = random (-5, 5);
  yVel = random (0);
  
  drawType = (int)random(0,4);
}


void resetLocandVel()
{
  xLoc = random ( 0, width);
  yLoc = random ( 0, height);
  xVel = random (-5, 5);
  yVel = random (0);
}



void drawEmptyCar()
{
  stroke(255);
  fill(0);
  rect(xLoc, yLoc, sWidth, sHeight);
}

void drawBigCar()
{
  noStroke();
  fill(r, g, b);
  rect(xLoc, yLoc, sWidth, sHeight*3);
}

void drawCircleCar()
{
  noStroke();
  fill(r, g, b);
  ellipse(xLoc, yLoc, sWidth, sHeight);
}

void drawFullCar()
{
  noStroke();
  fill(r, g, b);
  rect(xLoc, yLoc, sWidth, sHeight);
}


void drawCar ()
{
  
  if(drawType == 0) 
  {drawFullCar (); }
  
  else if(drawType == 1) 
  {drawEmptyCar (); }
  
  else if(drawType == 2) 
  {drawCircleCar (); }
  
  else if(drawType == 3) 
  {drawBigCar (); }
   
  
  xLoc += xVel;
}



}
