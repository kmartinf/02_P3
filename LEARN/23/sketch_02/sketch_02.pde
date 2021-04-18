import controlP5.*; //import ControlP5 library
import processing.serial.*;

Serial port;
ControlP5 cp5;                           //create ControlP5 object
PFont font;

void setup(){                            //same as arduino program

  size(300, 450);                        //window size, (width, height)
  printArray(Serial.list());             //prints all available serial ports
  port = new Serial(this, "/dev/cu.usbmodem621", 9600);  //i have connected arduino to com3, it would be different in linux and mac os
  
  cp5 = new ControlP5(this);
  font = createFont("calibri light bold", 20);    // custom fonts for buttons and title
  
  cp5.addButton("red")        //"red" is the name of button
    .setPosition(100, 50)     //x and y coordinates of upper left corner of button
    .setSize(120, 70)         //(width, height)
    .setFont(font)
  ;   

  cp5.addButton("yellow")     //"yellow" is the name of button
    .setPosition(100, 150)    //x and y coordinates of upper left corner of button
    .setSize(120, 70)         //(width, height)
    .setFont(font)
  ;

  cp5.addButton("blue")       //"blue" is the name of button
    .setPosition(100, 250)    //x and y coordinates of upper left corner of button
    .setSize(120, 70)         //(width, height)
    .setFont(font)
  ;
  
  cp5.addButton("alloff")     //"alloff" is the name of button
    .setPosition(100, 350)    //x and y coordinates of upper left corner of button
    .setSize(120, 70)         //(width, height)
    .setFont(font)
  ;
}

void draw(){  //same as loop in arduino

  background(0, 0 , 0); // background color of window (r, g, b) or (0 to 255)
}

void red(){
  port.write('r');
}

void yellow(){
  port.write('y');
}

void blue(){
  port.write('b');
}

void alloff(){
  port.write('f');
}
