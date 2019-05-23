PImage krop;

void setup() {
  size(500,316);
  krop = loadImage("krop.jpg");
}


void draw() {
  loadPixels();
  krop.loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int loc = x+y*width;
      float r = red(krop.pixels[loc]);
      float g = green(krop.pixels[loc]);
      float b = blue(krop.pixels[loc]);
      float d = dist(width/2, height/2, x, y);
      pixels[loc] = color(r + mouseX, g + mouseX, b + mouseX);
    }
  }
  updatePixels();
}
