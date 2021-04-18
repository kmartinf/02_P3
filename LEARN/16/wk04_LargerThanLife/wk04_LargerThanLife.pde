//  GSD 6349 Mapping II : Geosimulation
//  Havard University Graduate School of Design
//  Professor Robert Gerard Pietrusko
//  <rpietrusko@gsd.harvard.edu>
//  (c) Fall 2017 
//  Please cite author and course 
//  when using this library in any 
//  personal or professional project.

//  WEEK 04 TEMPLATE



// GLOBAL VARIABLES ////////////////////////////////////////////////////////
// define all variables that we will use in both setup() and draw()

import controlP5.*;
Lattice lat1, lat2;         // our two lattices that hold our cellular environment
Kernel  neighborhood;       // our kernel function


int sliderB1 = 1;
int sliderB2 = 1;
int sliderT1 = 1;
int sliderT2 = 1;


ControlP5 cp5;
ControlP5 cp6;
ControlP5 cp7;
ControlP5 cp8;

float rectW = 0.0;
float rectH = 0.0;

int b1 = 4;
int b2 = 4;
int t1 = 14;
int t2 = 2;

int sizeOfNeighborhood = 2;

float prob = 0.2;






////////////////////////////////////////////////////////////////////////////

void setup() // runs once at the beginning 
{
  
  size( 800, 800);
  frameRate(12);
  
  lat1 = new Lattice (200 , 200, (int)0 , (int)1, prob);
  lat2 = new Lattice (200, 200, 0);
  
  neighborhood = new Kernel();
  neighborhood.isTorus();
  neighborhood.setNeighborhoodDistance ( sizeOfNeighborhood );
  
  rectW = width  / lat1.w;
  rectH = height / lat1.h;
  
    cp5 = new ControlP5 (this);
    cp5.addSlider("sliderB1").setPosition(650,25).setRange(0,20);
    
    cp6 = new ControlP5 (this);
    cp5.addSlider("sliderB2").setPosition(650,50).setRange(0,20);
    
    cp7 = new ControlP5 (this);
    cp5.addSlider("sliderT1").setPosition(650,75).setRange(0,20);
    
    cp8 = new ControlP5 (this);
    cp5.addSlider("sliderT2").setPosition(650,100).setRange(0,20);
  
}; // end of setup();


void draw() // loops over and over until we quit
{
 
  for   (int x = 0; x < lat1.w; x += 1){
    for (int y = 0; y < lat1.h; y += 1){
      
      float xScl = map (x, 0, lat1.w, 0, width);
      float yScl = map (y, 0, lat1.h, 0, height);
      
      
      
      int   cellValue      = (int) lat1.get( x, y);
      int   numOfNeighbors = (int) neighborhood.getSum (lat1, x, y);
      
      int nextValue = LTL(numOfNeighbors, cellValue );
      
      lat2.put( x, y, nextValue);
      
      
      if ( cellValue == 255);
      {
      fill (cellValue * 255);
      noStroke ();
      rect (xScl, yScl, rectW, rectH);
      }
    }
  }
  
  lat1.replaceWith ( lat2 );
  
}; // end of draw()


int conway ( int numberOfNeighbors, int currentVal)
{
  int nextVal = 0;
  
       if ( numberOfNeighbors == 0) { nextVal = 0; }
  else if ( numberOfNeighbors == 1)  { nextVal = 0; }
  else if ( numberOfNeighbors == 2)  { nextVal = currentVal; }
  else if ( numberOfNeighbors == 3)  { nextVal = 1; }
  else if ( numberOfNeighbors >= 4)  { nextVal = 0; }
  
  return nextVal;
  
  
  
}


int LTL (int numberOfNeighbors, int currentVal)
{
 
  int nextVal = 0;
  
  if ( (currentVal == 0) && (numberOfNeighbors >= sliderB1) && (numberOfNeighbors <= sliderB2)  ) {nextVal = 1;}
  if ( (currentVal == 1) && (numberOfNeighbors >= sliderT1) && (numberOfNeighbors <= sliderT2)  ) {nextVal = 1;}
  
  return nextVal;
  
  
}
