//bouncing ball parameters

float xLoc = 0;
float yLoc = 0;
float xVel = 0;
float yVel = 0;
float radius = 0;
float white  = 0;
float black  = 0;
float bounce = 0;
float r = 0;
float g = 0;
float b = 0;

// halo parameters
float haloXloc   = 0;
float haloYloc   = 0;
float haloRadius = 0;
float haloAlpha  = 0;
float haloRadiusVel = 0;
float haloAlphaVel = 0;

boolean drawTrail = true;
int myFrameCount = 0;

void setup () 
  { 
  size (600,600);
  background (black);
  xLoc = random(0, width);
  yLoc = random(0, height);
  xVel = random(-10, 10);
  yVel = random(-10, 10);
  radius = random( 4, 20);
  white  = 255;
  black  = 0;
  bounce = -0.9;
  haloRadiusVel = 1;
  haloAlphaVel =  2;

  }


void draw () 
  {
  
    myFrameCount = myFrameCount + 1;
    
  if (drawTrail)
  {
   alphaBackground (20);
  }
  
  if ( frameCount > 600 )
  {
    xVel = 0;
    yVel = 0;   
  }
  
  
  updateLocation();
  checkBounce();
  drawBall();
  drawHalo();
  
 
  }  



 void mousePressed()
   {
   xLoc = mouseX;
   yLoc = mouseY;
   xVel = random(-4, 4);
   yVel = random(-4, 4);
   
   triggerHalo( xLoc, yLoc );
   
   myFrameCount = 0;
   
   println( "the current frame number: " + frameCount);
   }
 
 
 
 void keyPressed()
 {
   if (key == 't' )
   {
     drawTrail = !drawTrail;
   }
 }
 
 void updateLocation()
   {
     xLoc = xLoc + xVel;
     yLoc = yLoc + yVel;
   }
 
 
 
 
 
 void checkBounce ()
 {  
   if ( xLoc < 0 )
     { xVel = xVel * bounce; 
       xLoc = 0;
       radius = random( 4, 20);
       triggerHalo (xLoc, yLoc);
     }
    
  if ( xLoc > width )
     { xVel = xVel * bounce;
       xLoc = width;
       radius = random( 4, 20);
       triggerHalo (xLoc, yLoc);
     }
  
  if ( yLoc < 0 )
     { yVel = yVel * bounce; 
       yLoc = 0;
       radius = random( 4, 20);
       triggerHalo (xLoc, yLoc);
     }
  
  if ( yLoc > height )
     { yVel = yVel * bounce; 
       yLoc = height;
       radius = random( 4, 20);
       triggerHalo (xLoc, yLoc);
     } 
 }
 
 
 
 
 
 void drawBall()
   {
  noStroke();
  r = map( xLoc, 0, width, 0, 255);
  b = map( yLoc, 0, height, 0, 255);
  g = 180;
  
  fill(r, g, b);
  ellipse( xLoc, yLoc, radius, radius); 
   }
 
 
 
 void triggerHalo( float xIn, float yIn ) 
  {
  haloXloc   = xIn;
  haloYloc   = yIn;
  haloRadius = 0;
  haloAlpha  = 255;
  }
 
 
 void drawHalo ()
  {
    
   if ( haloAlpha > 0 )
     {
     haloRadius = haloRadius + haloRadiusVel;
     haloAlpha = haloAlpha   - haloAlphaVel;
     r = map( xLoc, 0, width, 0, 255);
     b = map( yLoc, 0, height, 0, 255);
     g = 180;
     noFill();
     stroke( r , g , b , haloAlpha);
     ellipse( haloXloc, haloYloc, haloRadius, haloRadius);
     }
   }
 
 void alphaBackground ( int alpha)
 {
   noStroke ();
   fill(0, alpha);
   rect(0, 0, width, height);  
 }
 
 void myFrameCount (){}
 
