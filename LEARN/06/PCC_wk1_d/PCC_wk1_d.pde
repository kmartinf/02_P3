//September 03th - Sunday
//SCI 6349 - in class D week 01
//Martin Fernandez


// global variables

int lineXcor0 = 0; //x Coordinate of line end 0
int lineYcor0 = 0; //y Coordinate of line end 0
int lineXcor1 = 0; //x Coordinate of line end 1
int lineYcor1 = 0; //y Coordinate of line end 1
int mouseYvelocity = 0;
int lineWeight = 0;
int lineWeightMin = 1;
int lineWeightMax = 10;
int r = 0;

String mousePressedText = "at the time the mouse was pressed, line weight was:";

void setup () {
   
  size ( 600, 600 );
  background ( 15 );
  frameRate ( 30 );
 
  
}

void draw () {
   
   
   lineXcor0 = pmouseX;
   lineYcor0 = pmouseY;
   lineXcor1 = mouseX;
   lineYcor1 = mouseY;
   
   lineWeight = abs( mouseX - pmouseX ); //magnitude of mouse velocity
    
   mouseYvelocity = abs ( mouseY - pmouseY );
   
   lineWeight = constrain( lineWeight, lineWeightMin, lineWeightMax );
   r = constrain( mouseYvelocity, 0, 256);
   

  
  stroke ( r, 100, 50, 76 );
  strokeWeight (lineWeight);
  line ( lineXcor0, lineYcor0, lineXcor1, lineYcor1);
  
  
}

void mousePressed() 
  {
    background( 15 );
    println("MOUSE WAS PRESSED. SCREEN WAS ERASED WITH BACKGROUND");
    println( mousePressedText + lineWeight );
  }

void keyReleased ()
{
 
  //do something
  
  if (key == 's')
  {
    
    
  }
  
  saveFrame();
  println( "Saved a Frame." );
}

/*


"=" assign value

"==" is it equivalent

pink = system variable

mousePressed

keyPressed

CONSTRAIN

  if (lineWeight < lineWeightMin ) 
  {
      lineWeight = lineWeightMin;
  }
  
  if(lineWeight > lineWeightMax)
  {
      lineWeight = lineWeightMax;
  }
  
  */
