
import processing.sound.*;
import spout.*;
Spout spout;
SoundFile file;
PImage img;
//void setup() {
//  size(1920, 1080);
//  img = loadImage("pipekleiner.png");
//}

//void draw() {
//  background(0);
  
  
//  image(img, 0, 0+bpm*200, width, height);
//}
float p = 0;
float diam = 0;
float BPM = 126;     // beats per minute
float millisPerBeat = 1000/(BPM/60.0);

void setup()
{
  size(640, 400, P2D);
  
  smooth();
  img = loadImage("pipekleiner.png");
  file = new SoundFile(this, "shortenedryo.aiff");
  println("Frames= " + file.frames() + " frames");
  //file.play();
  spout = new Spout(this);
  spout.createSender("Spout Processing");
}

void draw()
{
  background(0);

  // r goes from 0 - 1 during each beat
  
  
  
  //float d = dist(width/2, height/2, mouseX, mouseY);
  //float maxDist = dist(0, 0, width/2, height/2);
  //float gray = map(d, 0, maxDist, 0, 255);
  //ellipse(width/2, height/2, diam, diam);
  //int i = 0;
  //while (true) {
  //  delay(1000);
  //  if (file.isPlaying()) {
  //    i++;
  //    println("File is still playing after " + i + " seconds");
  //  } else {
  //    break;
  //  }
  //}
  update();
  spout.sendTexture();
  
}

void update(){
  
   float r = millis() / millisPerBeat;
  r -= int(r);
  
 // as r goes from 0 to 1, diameter goes from 100 to 0
  
  p = lerp(0, 10,0.4);
  
  
  float diam = map(r,0,1,p,0);
  
  
  
  image(img, 0, diam, width, height);
  
  
}

void mouseClicked() {
  //update();
  file.play();
}
