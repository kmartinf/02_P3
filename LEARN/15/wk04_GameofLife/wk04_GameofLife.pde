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

Lattice lat1, lat2;         // our two lattices that hold our cellular environment
Kernel  neighborhood;       // our kernel function



float rectW = 0.0;
float rectH = 0.0;

////////////////////////////////////////////////////////////////////////////

void setup() // runs once at the beginning 
{
  
  size( 1000, 1000);
  frameRate = 60;
  
  lat1 = new Lattice (100 , 100, (int)0 , (int)1, 0.2);
  lat2 = new Lattice (100, 100, 0);
  
  neighborhood = new Kernel();
  neighborhood.isTorus();
  
  rectW = width  / lat1.w;
  rectH = height / lat1.h;
  
}; // end of setup();


void draw() // loops over and over until we quit
{
 
  for   (int x = 0; x < lat1.w; x += 1){
    for (int y = 0; y < lat1.h; y += 1){
      
      float xScl = map (x, 0, lat1.w, 0, width);
      float yScl = map (y, 0, lat1.h, 0, height);
      
      int   cellValue      = (int) lat1.get( x, y);
      int   numOfNeighbors = (int) neighborhood.getSum (lat1, x, y);
      
      int nextValue = conway (numOfNeighbors, cellValue );
      
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
