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

Lattice lat1;       // our two lattices that hold our cellular environment
Kernel  k;          // our kernel function

////////////////////////////////////////////////////////////////////////////

void setup() // runs once at the beginning 
{
  
  size( 600, 600);
  
  lat1 = new Lattice (600 , 600, (int)0 , (int)1, 0.9 );
  
  
}; // end of setup();


void draw() // loops over and over until we quit
{
 
  for (int x = 0; x < lat1.w; x += 1){
    for (int y = 0; y < lat1.h; y += 1){
      
      float cellValue = lat1.get( x, y);
      
      fill (cellValue * 255);
      noStroke ();
      rect (x, y, 1, 1);
    }
  }
  
}; // end of draw()
