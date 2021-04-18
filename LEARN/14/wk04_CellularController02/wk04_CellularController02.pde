//MARTIN FERNANDEZ
//SOURCE CREDIT AT THE END

import controlP5.*;

Lattice lat1, lat2;    
Kernel  neighborhood; 

ControlP5 cp5;
ControlP5 cp6;
ControlP5 cp7;
ControlP5 cp8;
//ControlP5 cp9;
ControlP5 cp10;

int sliderB1 = 1;
int sliderB2 = 4;
int sliderT1 = 3;
int sliderT2 = 13;
//float sliderProb = 0.2;

float prob = 0.8;

boolean recording = true;

float rectW = 0.0;
float rectH = 0.0;
int sizeOfNeighborhood = 1;


////////////////////////////////////////////////////////////////////////////

void setup() // runs once at the beginning 
{
  
    size( 800, 800);
    frameRate(12);
  
    lat1 = new Lattice (200 , 200, (int)0 , (int)1,  prob);
    lat2 = new Lattice (200, 200, 0);
  
    neighborhood = new Kernel();
    neighborhood.isTorus();
    neighborhood.setNeighborhoodDistance ( sizeOfNeighborhood );
  
    rectW = width  / lat1.w;
    rectH = height / lat1.h;
    
  
    cp5 = new ControlP5 (this);
    cp5.addSlider("sliderB1").setPosition(25,20).setRange(00,20);
    
    cp6 = new ControlP5 (this);
    cp5.addSlider("sliderB2").setPosition(175,20).setRange(00,20);
    
    cp7 = new ControlP5 (this);
    cp5.addSlider("sliderT1").setPosition(325,20).setRange(00,20);
    
    cp8 = new ControlP5 (this);
    cp5.addSlider("sliderT2").setPosition(475,20).setRange(00,20);
    
    //THIS BUTTON DOESNT WORK BECAUSE THE VARIABLE IS IN SETUP AND NOT IN DRAW
    //cp9 = new ControlP5 (this);
    //cp5.addSlider("sliderProb").setPosition(475,40).setRange(0,1);
    
    cp10 = new ControlP5(this);
    cp5.addButton("record").setValue(0).setPosition(640,17).setSize(135,15);   
  
};

void draw()
{
 
    for (int x = 0; x < lat1.w; x += 1){
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
  
  if  (recording) {
       saveFrame("output/"+ sliderB1 + '-' + sliderB2 + '-' + sliderT1 + '-' + sliderT2 +"/cel_####.png");
       fill (255,0, 0);}
 else {fill (0, 255, 0);} 
  
  ellipse(width/2, height-50, 20, 20);
  
  fill(0, 0, 0, 220);
  rect (0, 0, width, 40);
};

int LTL (int numberOfNeighbors, int currentVal)
{
  int nextVal = 0;
  if ( (currentVal == 0) && (numberOfNeighbors >= sliderB1) && (numberOfNeighbors <= sliderB2)  ) {nextVal = 1;}
  if ( (currentVal == 1) && (numberOfNeighbors >= sliderT1) && (numberOfNeighbors <= sliderT2)  ) {nextVal = 1;}
  return nextVal;
}

public void record(){
 {recording = !recording;}
}



//  GSD 6349 Mapping II : Geosimulation
//  Havard University Graduate School of Design
//  Professor Robert Gerard Pietrusko
//  <rpietrusko@gsd.harvard.edu>
//  (c) Fall 2017 
//  Please cite author and course 
//  when using this library in any 
//  personal or professional project.
