float angle = 0;
float w = 25;
float BPM = 126;
float millisPerBeat = 1000/(BPM/60.0);
float p = 0;
float diam = 0;
import spout.*;
Spout spout;


PShape cans;
PShape cans1;
PShape cans2;
PShape cans3;
PShape cans4;
PShape cans5;

void setup() {
  size(400, 400, P3D);
  cans = createCan(50, 25, 32);
  cans.translate(-20, 0, 0);
  cans1 = createCan(50, 25, 32);
  cans1.translate(62, 0, 0);
  cans2 = createCan(50, 25, 32);
  cans2.translate(145, 0, 0);
  cans3 = createCan(50, 25, 32);
  cans3.translate(223, 0, 0);
  cans4 = createCan(50, 25, 32);
  cans4.translate(305, 0, 0);
  cans5 = createCan(50, 25, 32);
  cans5.translate(385, 0, 0);
  spout = new Spout(this);
  spout.createSender("Spout Processing");
}

void draw() {
  background (0);
  //translate(0, 200, -50);
  //rotateX(-PI/8);
  
 
  cans.rotateX(angle);
  cans1.rotateX(angle);
  cans2.rotateX(angle);
  cans3.rotateX(angle);
  cans4.rotateX(angle);
  cans5.rotateX(angle);
  
  rectMode(CENTER);
  
  float r = millis() / millisPerBeat;
  r -= int(r);
  
 // as r goes from 0 to 1, diameter goes from 100 to 0
  
  p = lerp(0, 10,0.4);
  
  //for (int i = 0; i < cans.length; i++) {
  //  cans[i].display();
  //}
  float diam = map(r,0,1,p,0);
  
  //for (float j = 0;j < width; j++) {
  shape(cans);
  shape(cans1);
  shape(cans2);
  shape(cans3);
  shape(cans4);
  shape(cans5);
  
  //translate(j+80, 0, 0);
  //}
  
  
  float offset = 0;
  for (float x = 0; x < width; x+=80) {
    pushMatrix();
    float a = angle + offset;
    float h = map(sin(a), -1, 1, 150, 400);
    fill(255);
    translate(x+24, 0, 0);
    box(w, h, w);
    offset += 0.1 + 10;
    popMatrix();
  }
  angle += 0.1;
  spout.sendTexture();
}
      PShape createCan(float r , float t, int detail) {
      textureMode(NORMAL);
      PShape sh = createShape();
      sh.beginShape(QUAD_STRIP);
      //sh.noStroke();
      
      for (int i = 0; i <= detail; i++) {
        float angle = TWO_PI / detail;
        float x = sin(i * angle);
        float z = cos(i * angle);
        float u = float(i) / detail;
        sh.normal(x, 0, z);
        sh.vertex(-t, x * r, z * r, u, 0);
        sh.vertex(t, x * r, z * r, u, 1);
      }
      
      
      sh.endShape();
      return sh;
    

}
PShape createCan1(float r , float t, int detail) {
      textureMode(NORMAL);
      PShape sh = createShape();
      sh.beginShape(QUAD_STRIP);
      //sh.noStroke();
      
      for (int i = 0; i <= detail; i++) {
        float angle = TWO_PI / detail;
        float x = sin(i * angle);
        float z = cos(i * angle);
        float u = float(i) / detail;
        sh.normal(x, 0, z);
        sh.vertex(-t, x * r, z * r, u, 0);
        sh.vertex(t, x * r, z * r, u, 1);
      }
      
      
      sh.endShape();
      return sh;
    

}
PShape createCan2(float r , float t, int detail) {
      textureMode(NORMAL);
      PShape sh = createShape();
      sh.beginShape(QUAD_STRIP);
      //sh.noStroke();
      
      for (int i = 0; i <= detail; i++) {
        float angle = TWO_PI / detail;
        float x = sin(i * angle);
        float z = cos(i * angle);
        float u = float(i) / detail;
        sh.normal(x, 0, z);
        sh.vertex(-t, x * r, z * r, u, 0);
        sh.vertex(t, x * r, z * r, u, 1);
      }
      
      
      sh.endShape();
      return sh;
    

}
PShape createCan3(float r , float t, int detail) {
      textureMode(NORMAL);
      PShape sh = createShape();
      sh.beginShape(QUAD_STRIP);
      //sh.noStroke();
      
      for (int i = 0; i <= detail; i++) {
        float angle = TWO_PI / detail;
        float x = sin(i * angle);
        float z = cos(i * angle);
        float u = float(i) / detail;
        sh.normal(x, 0, z);
        sh.vertex(-t, x * r, z * r, u, 0);
        sh.vertex(t, x * r, z * r, u, 1);
      }
      
      
      sh.endShape();
      return sh;
    

}
PShape createCan4(float r , float t, int detail) {
      textureMode(NORMAL);
      PShape sh = createShape();
      sh.beginShape(QUAD_STRIP);
      //sh.noStroke();
      
      for (int i = 0; i <= detail; i++) {
        float angle = TWO_PI / detail;
        float x = sin(i * angle);
        float z = cos(i * angle);
        float u = float(i) / detail;
        sh.normal(x, 0, z);
        sh.vertex(-t, x * r, z * r, u, 0);
        sh.vertex(t, x * r, z * r, u, 1);
      }
      
      
      sh.endShape();
      return sh;
    

}

PShape createCan5(float r , float t, int detail) {
      textureMode(NORMAL);
      PShape sh = createShape();
      sh.beginShape(QUAD_STRIP);
      //sh.noStroke();
      
      for (int i = 0; i <= detail; i++) {
        float angle = TWO_PI / detail;
        float x = sin(i * angle);
        float z = cos(i * angle);
        float u = float(i) / detail;
        sh.normal(x, 0, z);
        sh.vertex(-t, x * r, z * r, u, 0);
        sh.vertex(t, x * r, z * r, u, 1);
      }
      
      
      sh.endShape();
      return sh;
    

}
//All cans after translate boxes
