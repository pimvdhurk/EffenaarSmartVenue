import processing.serial.*;
Serial myPort;

int circleX, circleY;
int circleSize = 200;

color circleColor;
color baseColor;

boolean circleOver = false;

void setup() {
  size(640, 360);
  circleColor = color(255);
  background(0);
  myPort = new Serial(this, Serial.list()[0], 9600);
  circleX =100+circleSize/2+10;
  circleY = height/4;
  ellipseMode(CENTER);
}

void draw() {
  update(mouseX, mouseY);

  noStroke();
  loadPixels();
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++) {
      pixels[x+y*width] = color(y, y/2, x/2);
    }
  }
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
