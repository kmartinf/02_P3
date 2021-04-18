class Cell extends PVector{

// we can build classes on top of other classes.
// in this case, we want to use PVector and have all of the functionality
// of a PVector, but we're frustrated that a PVector doesn't let us store
// a color value in addition to x,y,z. Not to worry, make a new class
// that "extends" PVector. we can add any new variables we want. In this
// case, only a color variable. Our new class, "Cell" functions like PVector
// but has color too. 
  
  
    color c;
    
    Cell( float x, float y, float z)
    {
        // super() calls the PVector constructor
        super( x,y,z );
    }
    
    Cell( float x, float y, float z, color cIn )
    {
        // super() calls the PVector constructor
        super( x,y,z );
        c = cIn;
    }
    
    void setColor( color cIn )
    {
        c = cIn;
    }
    
    color getColor()
    {
        return c;
    }
    
}
