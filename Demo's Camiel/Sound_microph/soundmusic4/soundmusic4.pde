import spout.*;
Spout spout;

float angle = 0;
float w = 24;
float ma;
float maxD;

void setup() {
  size(800, 600, P3D);
  ma = atan(cos(QUARTER_PI));
  maxD = dist(0, 0, 200, 200);
  spout = new Spout(this);
  spout.createSender("Spout Processing");
}

void draw() {
  lights();
  pointLight(250, 250, 250, 10, 30, 50);
  background(0);
  //ortho(-400, 400, 400, -400, -200, 1000);
  translate(400, 300, -200);
  rotateX(-ma);
  rotateY(-QUARTER_PI);
  //translate(width/2 + 75, height/2 - 75);

  for (int z = 0; z < 400; z += w) {
    for (int x = 0; x < 400; x += w) {
      pushMatrix();
      float d = dist(x, z, 400 / 2, 400 / 2);
      float offset = map(d, 0, maxD, -PI, PI);
      float a = angle + offset;
      float h = floor(map(sin(a), -1, 1, 100, 300));
      translate(x - 400 / 2, 0, z - 400 / 2);
      fill(100);
      box(w, h, w);
      //rect(x - width / 2 + w / 2, 0, w - 2, h);
      popMatrix();
    }
  }

  angle -= 0.1;
  spout.sendTexture();
}
