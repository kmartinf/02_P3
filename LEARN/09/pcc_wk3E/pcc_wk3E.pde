Car fordBronco;
Car viper;


void setup()
{
  size(600,600); 
  
  
  fordBronco = new Car();
       viper = new Car();
}

void draw ()
{
  background(0); 
  
  fordBronco.drawCar();
  viper.drawCar();
}

void mousePressed()
{
  fordBronco.resetLocandVel();
       viper.resetLocandVel();
       
}
