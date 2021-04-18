//  GSD 6349 Mapping II : Geosimulation
//  Havard University Graduate School of Design
//  Professor Robert Gerard Pietrusko
//  <rpietrusko@gsd.harvard.edu>
//  (c) Fall 2017
//  Please cite author and course 
//  when using this library in any 
//  personal or professional project.

//  WEEK 05 : SIMPLE POPULATION MODEL TEMPLATE
// 
// stats: https://www.cdc.gov/nchs/fastats/
// US 2014 stats
// Birth rate:  62.5 births per   1,000 women
// Death rate: 823.7 deaths per 100,000 population
// 0.031250 births per person
// 0.008237 deaths per person


int initialPopulationSize = 1000;
ArrayList<Agent> population;
int yearCounter = 0;
int framesPerYear = 24;
int currentPopulationSize = 0;

float deathRate = 0.008237;
float birthRate = 0.031250;

PImage deathHole;


void setup()
{
      size(600,600);
      frameRate (24);
      population = new ArrayList<Agent>();
      deathHole = loadImage ( "sourceSickness.png" );
  
      for( int i = 0; i < initialPopulationSize; i += 1)
        {
          population.add( new Agent()  );
        }
  
}

void draw()
{
     //background( 0 );
     image ( deathHole, 0, 0);
     
     for (Agent a : population )
       {
         a.update();
         a.checkEnvironment(deathHole);
         a.drawAgent();
       }
       
       ///////  YEARLY COUNTER    ///////
       
       
       if( frameCount % framesPerYear == 0)
         {
           currentPopulationSize = population.size();
           removeDead();
           //deaths();
           births();
           println( "YEAR "  + yearCounter + " POP:" + currentPopulationSize);
           yearCounter += 1;
         }
}

void deaths()
{

         int numberToDie = round(deathRate * currentPopulationSize);
  
         while( numberToDie > 0 )
          {
            population.remove(0);
            numberToDie -= 1;
          }
}


void births()
{
         int numberToBeBorn = round(birthRate * currentPopulationSize);
  
         while( numberToBeBorn > 0 )
          {
            
            Agent parent = population.get( (int) random(population.size() ) );
            Agent child = new Agent();
            
            child.vel = new PVector( parent.vel.x, parent.vel.y);
            
            
            population.add( child );
            numberToBeBorn -= 1;
          }
    
}
