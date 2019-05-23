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
      
      float b = brightness(krop.pixels[loc]);
      float g = map(mouseX, 0, width, 0, 255);
      if (b > g) {
        pixels[loc] = color (255);
      } else {
        pixels[loc] = color (0);
      }
      //float r = red(krop.pixels[loc]);
      //float g = green(krop.pixels[loc]);
      //float b = blue(krop.pixels[loc]);
      //float d = dist(mouseX, mouseY, x, y);
      //float factor = map(d, 0, 100, 2, 0);
      //pixels[loc] = color(r*factor, g*factor, b*factor);
    }
  }
  updatePixels();
}
