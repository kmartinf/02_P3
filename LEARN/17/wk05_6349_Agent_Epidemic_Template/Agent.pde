//  GSD 6349 Mapping II : Geosimulation
//  Havard University Graduate School of Design
//  Professor Robert Gerard Pietrusko
//  <rpietrusko@gsd.harvard.edu>
//  (c) Fall 2017
//  Please cite author and course 
//  when using this library in any 
//  personal or professional project.

//  WEEK 05 : SIMPLE EPIDEMIC MODEL
//            AGENT CLASS 


import java.util.Iterator;

class Agent{

  
  boolean alive = true;
  
  
 
      Agent()
      {

      }
      
      
      void update()
      {

      }
      
      void drawAgent()
      {
 
      }
      
      
      
      void getSick(int minDay, int maxDay)
      {

      }
      
      
}// end Agent class



//====================================================//
//====================================================//

void removeDead( ArrayList population )
{
    Iterator iter = population.iterator();
    Agent tempAgent;
    
    while( iter.hasNext() ){    
        tempAgent = (Agent)iter.next();
        if( tempAgent.alive == false ){
            iter.remove();
        }
    }
};
//====================================================//
