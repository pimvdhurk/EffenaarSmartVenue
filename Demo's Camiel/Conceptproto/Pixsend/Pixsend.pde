import processing.serial.*;

//PImage img;  
PShape square;
Serial myPort;

void setup() {
  
  size(512,316);
  background(0);
 
 // img = loadImage("specturm.jpg");
  myPort = new Serial(this, Serial.list()[0], 9600);
  square = createShape(RECT, 0, 0, 50, 50);
  square.setFill(false);
  square.setStroke(color(255, 255, 255));
  
}


void draw() {
  
  //image(img,0,0);
 // img.loadPixels();
 
 //for (int i = 0; i < pixels.length;  i++) {
 //  pixels[i] = color(random(255), 0, random(50, 200));
 //}
 
 loadPixels();
 for (int x = 0; x < width; x++){
  for (int y = 0; y < height; y++) {
    pixels[x+y*width] = color(0, y/2, x/2);
  }
 }
 updatePixels();
 shape(square, 50, 50);
}

void mouseMoved() 
{
  
  float r = 0;
 //myPort.write("CL");
 //myPort.write(int(red(img.pixels[mouseX+mouseY*img.width])));
 //myPort.write(int(green(img.pixels[mouseX+mouseY*img.width]))); 
 //myPort.write(int(blue(img.pixels[mouseX+mouseY*img.width]))); 
 myPort.write("CL");
 if (r < 200){
 int i = mouseX+mouseY*width;
 myPort.write(int(red(pixels[i])));
 myPort.write(int(green(pixels[i]))); 
 myPort.write(int(blue(pixels[i]))); 
 } else {
   int i = 0;
 myPort.write(int(red(pixels[i])));
 myPort.write(int(green(pixels[i]))); 
 myPort.write(int(blue(pixels[i]))); 
 }
 
 
 
}
