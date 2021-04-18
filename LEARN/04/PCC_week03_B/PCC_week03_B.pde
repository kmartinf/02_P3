int stepSize = 0;
int maxStep = 0;

void setup (){

   size (600, 600);
}
void draw (){

   background(0);
   stepSize = (int)map(mouseX, 0, width, 2, 300);
   int currentStep = 0;
   
   stroke(255);
   noFill();
   
   while( currentStep < width)
   {
     line( currentStep, 0 , currentStep, height);
     currentStep = currentStep + stepSize;
   }
   
}
