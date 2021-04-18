class Agent{

      PVector loc;
      PVector vel;
      float nag;
      
  Agent()
  {

      init();
  }

  void init()
  {
      loc = new PVector (random (width), random(height) );
      vel = new PVector (random (-1,1),  random(-1,1)  );
      nag = random ( 2.0 );

  }

  void update( PVector target )
  {
    
      //loc.add( vel );
      
      float angle = calcRadians( target, loc);
      float xVel = cos( angle );
      float yVel = sin( angle );
      
  }
  
  
  
  void drawMe()
  {
      fill(255, 0,0);
      noStroke();
      rectMode(CENTER);
      rect (loc.x, loc.y, 10, 10 );
      
      
      noFill();
      stroke(255);
      ellipseMode(CENTER);
      ellipse(loc.x, loc.y, 100, 100);
  }


  float calcRadians( PVector target, PVector curr_loc )
  {
      float xDiff =   target.x  -   curr_loc.x;
      float yDiff = (-target.y) - (-curr_loc.y); // remember positive y on screen is opposite from mathematics
    
    // doing this in degrees to make it legible
    // SOH CAH TOA , we want TOA. Tan(angle_radians) = opposite/adjacent
    // therefore arctan, or atan(), to find angle
    // need if() statements to acount for all of the obtuse angles (>90_degrees)
    float angle_d = degrees(atan( yDiff / xDiff )); 
          angle_d = (xDiff < 0 ) ? 180+angle_d : (yDiff < 0 ) ? 360+angle_d : angle_d;
    
           return radians( angle_d );
  }



}
