// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/IKB1hWWedMk

import spout.*;
Spout spout;


PImage earth;
PShape tex;

int cols, rows;
int scl = 30;
int w = 2000;
int h = 1600;

float flying = 0;

float[][] terrain;

void setup() {
  size(600, 400, P3D);
  earth = loadImage("earth.jpg");
  cols = w / scl;
  rows = h/ scl;
  terrain = new float[cols][rows];
  spout = new Spout(this);
  spout.createSender("Spout Processing");
  //tex = createShape();
  //tex.setTexture(earth);
  textureMode(IMAGE);
}


void draw() {
  
  
  flying -= 0.1;

  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = flying;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.2;
    }
    yoff += 0.1;
  }



  background(0);
  stroke(255);
  //noFill();
  

  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    texture(earth);
    for (int x = 0; x < cols; x++) {
      
      vertex(x*scl, y*scl, terrain[x][y], 200, 200);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1], 200, 200);
      //rect(x*scl, y*scl, scl, scl);
    }
    
    endShape();
  }
  spout.sendTexture();
}
