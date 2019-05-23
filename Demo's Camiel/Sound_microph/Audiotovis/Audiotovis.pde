  
import processing.sound.*;

PImage img;
FFT fft;
AudioIn in;
int bands = 512;
float sum = 0;
float[] spectrum = new float[bands];

void setup() {
  size(1920, 1080);
  //background(255);
  img = loadImage("pipe.png");
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
}      

void draw() { 
  background(0);
  
  fft.analyze(spectrum);
  sum = 0;
  for(int i = 0; i < 5; i++){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  sum += spectrum[i]/5;
  
  //line(20, height, 20, height - sum*height*5 );
 //ellipse(width/2, height/2, 10+sum*height*5, 10+sum*height*5);
 image(img, 0, 0+sum*200, width, height);
 
  } 
  
}
