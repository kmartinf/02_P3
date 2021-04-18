int stepsize = 10;

void setup()
{
 size (600, 600); 
}

void draw()
{
  background(0);
  stroke(255);
  noFill();
  
  stepsize = (int)map(mouseX, 0, width, 2, width/2);
  
  for(int currentStep = 0; currentStep < width; currentStep += stepsize )
  {
    line( 0, currentStep, width - currentStep, 0);
  }
}
