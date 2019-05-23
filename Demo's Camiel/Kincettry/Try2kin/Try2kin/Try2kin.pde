import spout.*;

import KinectPV2.*;

Spout spout;
KinectPV2 kinect;

boolean foundUsers = false;

void setup() {
  size(513, 424, P3D);

  spout = new Spout(this);
  kinect = new KinectPV2(this);
  spout.createSender("Spout Processing", 1920, 1080);

  //kinect.enableDepthImg(true);
  kinect.enableBodyTrackImg(true);

  kinect.init();
}

void draw() {
  background(0);

  //image(kinect.getDepthImage(), 0, 0);
  image(kinect.getBodyTrackImage(), 0, 0);

    //raw body data 0-6 users 255 nothing
  int [] rawData = kinect.getRawBodyTrack();

  foundUsers = false;
  for(int i = 0; i < rawData.length; i+=5){
    if(rawData[i] != 255){
     //found something
     foundUsers = true;
     break;
    }

  }

  //display the number of users detected 
  fill(255, 0, 0);
  //text(kinect.getNumOfUsers(), 50, 50);
  //text("Found User: "+foundUsers, 50, 70);
  //text(frameRate, 50, 90);
  spout.sendTexture();
}

void mousePressed() {
  println(frameRate);
  ///saveFrame();
}
