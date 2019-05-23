import processing.serial.*;
//import processing.video.*;

Serial myPort;
//Capture video;

float rectP;
float xspeed = 5;

int circleX, circleY;
int circleSize = 200;

color circleColor;
color baseColor;

boolean circleOver = false;

color from = color(204, 102, 0);
color to = color(0, 102, 153);
color interA = lerpColor(from, to, .80);

void setup() {
  size(640, 480);
  
  rectP = 0;
  myPort = new Serial(this, Serial.list()[0], 9600);
  //video = new Capture(this, 640, 480, 30);
//video.start();

  circleColor = color(255);
  
  circleX =100+circleSize/2+10;
  circleY = height/4;
  ellipseMode(CENTER);
  

}

void draw() {
  //video.read();
   background(0);
   fill(interA);
   noStroke();
   rect(rectP, 0, 100 , 640);
   
   rectP = rectP + xspeed;
   
   if (rectP > width-100) {
     xspeed = -5;
   }
   
   if (rectP < 0) {
     xspeed = 5;
   }
  update(mouseX, mouseY);
   
  //noStroke();
  //image(video, 0, 0, 640, 480);
 loadPixels();
 // for (int x = 0; x < width; x++){
 //   for (int y = 0; y < height; y++) {
 //     float noiseVal = noise((50+x), frameCount*0.1);
 //     pixels[x+y*width] = color(noiseVal*y, y/2, x/2);
 //   }
 // }
  
 updatePixels();
 
   
   
 
  stroke(255);
  stroke(0);
  noFill();
  ellipse(circleX, circleY, circleSize, circleSize);
}



void update(int x, int y) {
  myPort.write("CL");
  if( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    int i = mouseX+mouseY*width; //Color picking by mouse movement. Can be changed to average value.
    myPort.write(int(red(pixels[i])));
    myPort.write(int(green(pixels[i]))); 
    myPort.write(int(blue(pixels[i])));
  } else {
    circleOver = false;
    int i = 0;
    myPort.write(int(red(i)));
    myPort.write(int(green(i))); 
    myPort.write(int(blue(i)));
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
