import java.util.Iterator;

class Agent{

  PVector loc;
  PVector vel;
  boolean alive = true;
      int haloGrowth = 0;
      float fatality = 0.7;


      Agent()
      {
            loc = new PVector( random(0, width)  , random(0, height)  );
            vel = new PVector( random( -5, 5)    , random (-5,5)      );
            
              
      }
      
       Agent( float x, float y)
      {
            loc = new PVector(x , y);
            vel = new PVector( random( -5, 5)    , random (-5,5)      );
            
      }
      
      void update()
      {
            loc.add( vel );
            
            //check for bounce!
            
            if (loc.x < 0 || loc.x >= width  ) {vel.x *= -1;}
            if (loc.y < 0 || loc.y >= height ) {vel.y *= -1;}
      }
      
      void checkEnvironment(PImage deathHole )
      {
          int   pixelValue = deathHole.get( (int)loc.x, (int)loc.y );
          float deathValue = red(pixelValue);
          float deathProbability = map( deathValue, 0, 255, 0.0, 1.0);
          
          if (random (1.0) <= deathProbability )
          {
            alive = false;
          }
      }
      
      void drawAgent()
      {
           if (alive) 
           {
             fill( 0, 255, 0);
             noStroke();
             ellipse( loc.x, loc.y, 3, 3);
             drawHalo(); 
           }
           
           else 
           { 
              fill(255,0,0);
              noStroke();
              ellipse( loc.x, loc.y, 10, 10);
              drawHalo(); 
            }
           
         
      }

      void drawHalo()
      {

          if( haloGrowth <= 48 )
          {
              float radius = haloGrowth;
              float alpha  = map(haloGrowth, 0, 48, 255, 0 );
              
              noFill();
              stroke(255, alpha);
              ellipse( loc.x, loc.y, radius, radius ); 
              
              haloGrowth += 1;
          }
      }
}



void removeDead()
{
    Iterator iter = population.iterator();
    Agent tempAgent;
    
    while( iter.hasNext() )
    {    
        tempAgent = (Agent)iter.next();
        if( !tempAgent.alive )
        {
            iter.remove();
        }
    }
}
