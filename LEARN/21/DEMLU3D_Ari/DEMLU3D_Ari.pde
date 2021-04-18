//  GSD 6349 Mapping II : Geosimulation
//  Havard University Graduate School of Design
//  Professor Robert Gerard Pietrusko
//  <rpietrusko@gsd.harvard.edu>
//  (c) Fall 2017 
//  Please cite author and course 
//  when using this library in any 
//  personal or professional project.

//  WEEK 09 : DEM IN 3D WITH LAND COVER


import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;



// DEM in 3D

ASCgrid dem;
ArrayList <PVector> demPts;
int stepSize = 2;
float demMin;
float demMax;

//here is our camera

PeasyCam cam;


void setup()
{
    size(1000,1000, P3D);
    frameRate(30);
    
    // initialize peasyCam here
    cam = new PeasyCam(this, 500);
    cam.setMinimumDistance(50);
    cam.setMaximumDistance(1000);
    
    cam.setPitchRotationMode();
    //cam.setSuppressRollRotationMode();
    
    
    //
    dem = new ASCgrid ( "azdem.asc" );
    dem.fitToScreen();
    dem.updateImage();
    demMin = dem.minValue;
    demMax = dem.maxValue;
    
    demPts = new ArrayList<PVector>();
    
    for ( int x = 0; x < dem.w; x += stepSize){
      for ( int y = 0; y < dem.h; y += stepSize){
        
        float elevation = dem.get(x,y);
        demPts.add( new PVector ( x, y, elevation));
      }
    }
 
}

void draw()
{

  //noCursor();
  fill(255);
  cursor(CROSS);
  
  background(0);
  
  pushMatrix();
    translate(-width/2,-height/2);
    //image (dem.getImage(), 0, 0);
    
    for ( PVector pt : demPts)
    {
      noStroke();
      float scaledValue = map(pt.z, demMin, demMax, 10, 255);
      
      //fill(scaledValue*2, scaledValue, 255-scaledValue, 100);
      fill(255, scaledValue);
     
      pushMatrix ();
       translate(pt.x,pt.y, pt.z / 30.0);
       //rect(0,0, stepSize, stepSize);
       ellipse(0,0, stepSize, stepSize);
      popMatrix();
      
    }
    
    
  popMatrix();
  
  
  
}
