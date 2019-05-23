import processing.serial.*;

Serial myPort;

Cell[][] grid;

// Number of columns and rows in the grid
int cols = 20;
int rows = 1;

float xspeed = 5;

float rectP = 0;

boolean rectOver = false;

void setup() {
  
  size(512,316);
  background(0);
  myPort = new Serial(this, Serial.list()[0], 9600);
  ellipseMode(CENTER);
  
  
}


void draw() {
 
 grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*(width/cols),j*rows,width/cols,height/rows, i);
    }
  }
  background(0);
  noStroke();
   rect(rectP, 0, 25 , 316);
   
   rectP = rectP + xspeed;
   
   if (rectP > width-25) {
     xspeed = -5;
   }
   
   if (rectP < 0) {
     xspeed = 5;
   }
 
 loadPixels();
 updatePixels();
 
 for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].display();
    }
  }
 
 fill(255);
 //ellipse(mouseX, mouseY, 100, 100);
 
}

class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
     // width and height
float x,y;   // x,y location
 float w,h;
 int p;
  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, int tempP) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    p = tempP;
  } 
  
  void display() {
    stroke(255);
    strokeWeight(5);
    noFill();
    rect(x,y,w,h);
    update(x, y, w, h, p);
  }
}

void update(float x, float y, float w, float h, int p)  
{
 if( overRect(x, y, w, h) ) {
   myPort.write("CL");
    rectOver = true;
    int t = p;
    myPort.write("B"+ int(t));
    float f = x*y*w;
 int i = (int)f;
 myPort.write(int(red(pixels[i])));
 myPort.write(int(green(pixels[i]))); 
 myPort.write(int(blue(pixels[i]))); 
 } else {
   rectOver = false;
   int i = 0;
 myPort.write(int(red(pixels[i])));
 myPort.write(int(green(pixels[i]))); 
 myPort.write(int(blue(pixels[i]))); 
 }
 
 
}

boolean overRect(float x, float y, float w, float h) {
  return true;
  //float disX = x - rectP;
  //if( disX < w/2 ) {
  //  return true;
  //} else {
  //  return false;
  //}
}
