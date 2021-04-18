//  GSD 6349 Mapping II : Geosimulation
//  Havard University Graduate School of Design
//  Professor Robert Gerard Pietrusko
//  <rpietrusko@gsd.harvard.edu>
//  (c) Fall 2017 
//  Please cite author and course 
//  when using this library in any 
//  personal or professional project.

//  WEEK 09 : MAKE AN AGENT CHASE A POINT template

PVector target;
Agent a;

void setup()
{

    size(1000,1000);
    frameRate(30);
    
    a = new Agent ();
    target = new PVector (width/2, height/2);
}


void draw()
{

  background(0);
  
  fill(255, 0, 0);
  noStroke();
  ellipse( target.x, target.y, 10, 10);
  
  
  
  a.update( target );
  a.drawMe();
  
  noFill();
  stroke(100);
  strokeWeight (3);
  line(a.loc.x, a.loc.y,target.x,target.y);
  
}


void mousePressed()
{

}
