import spout.*;

import KinectPV2.*;  
KinectPV2 kinect;  
Spout spout;

void setup() {   
  size(1920, 1080, P3D);  
  spout = new Spout(this);
  kinect = new KinectPV2(this);  
  
  spout.createSender("Spout Processing", 1920, 1080);
  kinect.enableDepthImg(true);   
  kinect.enableInfraredImg(true);   
  kinect.enableBodyTrackImg(true);   
  kinect.init();
}  
void draw() {   
  background(0);    
  image(kinect.getDepthImage(), 0, 0);   
  image(kinect.getBodyTrackImage(), 512, 0);   
  image(kinect.getInfraredImage(), 512*2, 0);
  spout.sendTexture();
} 
