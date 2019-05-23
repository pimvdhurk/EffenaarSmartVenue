import peasy.*;

float angle;

//float lon = 5.69;
//float lat = 50.85;
//50.8514° N, 5.6910° E maasjuuuh

Table table;
float r = 200;

PImage earth;
PShape globe;

PeasyCam cam;

void setup() {
  size (600, 600, P3D);
  cam = new PeasyCam(this, 600);
  earth = loadImage("earth.jpg");
  table = loadTable("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.csv", "header");

  noStroke();
  globe = createShape(SPHERE,r);
  globe.setTexture(earth);
  
}

void draw() {
  background(100);
  //translate(width*0.5, height*0.5);
  rotateY(angle);
  angle += 0.005;
  
  lights();
  fill(200, 30, 200);
  noStroke();
  
  //sphere(r);
  shape(globe);
  
  for (TableRow row : table.rows()) {
    float lat = row.getFloat("latitude");
    float lon = row.getFloat("longitude");
    float mag = row.getFloat("mag");
    
  //float theta = radians(lat) + PI/2;
  float theta = radians(lat);
  float phi = radians(lon) + PI;
  //float x = r * sin(theta) * cos(phi);
  //float y = r * sin(theta) * sin(phi);
  //float z = r * cos(theta);
  
  float x = r * cos(theta) * cos(phi);
  float y = -r * sin(theta);
  float z = -r * cos(theta) * sin(phi);
  
  float h = pow(10, mag);
  float maxh = pow(10, 6);
  h = map(h, 0, maxh, 10, 100);
  
  PVector pos = new PVector(x, y, z);
  
  PVector xaxis = new PVector(1, 0, 0);
  float angleb = PVector.angleBetween(xaxis, pos);
  PVector raxis = xaxis.cross(pos);
  
  
  pushMatrix();
  translate(x,y,z);
  rotate(angleb, raxis.x, raxis.y, raxis.z);
  fill(152, 244, 66);
  box(h, 10, 10);
  popMatrix();
  }
  
  
  
}
