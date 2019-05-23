//import peasy.*;
import processing.sound.*;
import spout.*;
Spout spout;
AudioIn input;
Amplitude analyzer;
//PeasyCam cam;


float angle = 0;

PVector[] points = new PVector[8];
PVector[] pointsl = new PVector[8];

//PImage bg;

void setup() {
  size(600, 400, P3D);
  //bg = loadImage("effenaarklein.jpg");
  input = new AudioIn(this, 0);
  //cam = new PeasyCam(this, 600);
  spout = new Spout(this);
  spout.createSender("Spout Processing");
  input.start();
  
  analyzer = new Amplitude(this);
  
  analyzer.input(input);
  
  points[0] = new PVector(-0.7, -0.7, -0.7);
  points[1] = new PVector(0.7, -0.7, -0.7);
  points[2] = new PVector(0.7, 0.7, -0.7);
  points[3] = new PVector(-0.7, 0.7, -0.7);
  points[4] = new PVector(-0.7, -0.7, 0.7);
  points[5] = new PVector(0.7, -0.7, 0.7);
  points[6] = new PVector(0.7, 0.7, 0.7);
  points[7] = new PVector(-0.7, 0.7, 0.7);
  
  pointsl[0] = new PVector(-0.5, -0.5, -0.5);
  pointsl[1] = new PVector(0.5, -0.5, -0.5);
  pointsl[2] = new PVector(0.5, 0.5, -0.5);
  pointsl[3] = new PVector(-0.5, 0.5, -0.5);
  pointsl[4] = new PVector(-0.5, -0.5, 0.5);
  pointsl[5] = new PVector(0.5, -0.5, 0.5);
  pointsl[6] = new PVector(0.5, 0.5, 0.5);
  pointsl[7] = new PVector(-0.5, 0.5, 0.5);
  
}

void draw() {
  background(0);
  float vol = analyzer.analyze();
  translate(width/2, height/2);
  

  /* float[][] rotationZ = {
    { cos(angle), -sin(angle), 0},
    { sin(angle), cos(angle), 0},
    { 0, 0, 1}
  };
  
  

  float[][] rotationX = {
    { 1, 0, 0},
    { 0, cos(angle), -sin(angle)},
    { 0, sin(angle), cos(angle)}
  };
   */
   
  float[][] rotationY = {
    { cos(angle), 0, sin(angle)},
    { 0, 1, 0},
    { -sin(angle), 0, cos(angle)}
  };

  PVector[] projected = new PVector[8];
  PVector[] projectedsec = new PVector[8];

  int index = 0;
  int indexsec = 0;
  float distance = 2;

//BIG CUBE
  for (PVector v : points) {
    PVector rotated = matmul(rotationY, v);
    //rotated = matmul(rotationX, rotated);
    //rotated = matmul(rotationZ, rotated);
    
    
    float z = 1 / (distance - rotated.z);
    
    float[][] projection = {
      {z, 0, 0},
      {0, z, 0}
    };
    
    PVector projected2d = matmul(projection, rotated);
    projected2d.mult(200);
    projected[index] = projected2d;
    index++;
  }
  for (PVector v : projected) {
    stroke(255);
    strokeWeight(2);
    noFill();
    point(v.x, v.y);
  }

  // Connecting
  for (int i = 0; i < 4; i++) {
    connect(i, (i+1) % 4, projected);
    connect(i+4, ((i+1) % 4)+4, projected);
    connect(i, i+4, projected);
  }

//SMALL CUBE

  for (PVector v : pointsl) {
    PVector rotated = matmul(rotationY, v);
    
   
    float z = 1 / (distance - rotated.z);
    
    float[][] projection = {
      {z, 0, 0},
      {0, z, 0}
    };
    
    PVector projected2d = matmul(projection, rotated);
    projected2d.mult(20+vol*500);
    projectedsec[indexsec] = projected2d;
    
    indexsec++;
  }
  

for (PVector v : projectedsec) {
    stroke(255);
    strokeWeight(2);
    noFill();
    point(v.x, v.y);
  }

  // Connecting
  for (int i = 0; i < 4; i++) {
    connect(i, (i+1) % 4, projectedsec);
    connect(i+4, ((i+1) % 4)+4, projectedsec);
    connect(i, i+4, projectedsec);
  }
  angle += 0.02;
  spout.sendTexture();
}

//CONNECTION BIG CUBE

void connect(int i, int j, PVector[] points) {
  PVector a = points[i];
  PVector b = points[j];
  strokeWeight(2);
  stroke(255);
  line(a.x, a.y, b.x, b.y);
}

//CONNECTION SMALL CUBE

void connect2(int i, int j, PVector[] pointsl) {
  PVector a = pointsl[i];
  PVector b = pointsl[j];
  strokeWeight(2);
  stroke(255);
  line(a.x, a.y, b.x, b.y);
}
