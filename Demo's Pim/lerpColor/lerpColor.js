/*
 * @name Lerp Color
 * @description Loop random shapes,
 * lerp color from red to blue.
 */
function setup() {
  createCanvas(560, 400);
  background(0);
  noStroke();
}

function draw() {
  background(0);
  from = color(0, 255, 255, 0.2 * 255);
  to = color(0, 255, 0, 0.2 * 255);
  c1 = lerpColor(from, to, 0.33);
  c2 = lerpColor(from, to, 0.66);
  for (let i = 0; i < 1; i++) {
    
    
    fill(color(255, 0, 0));
    quad(
      random(0, 140), random(height),
      random(0, 140), random(height),
      random(0, 140), random(height)
    );
    fill(color(0, 255, 0));
    quad(
      random(140, 280), random(height),
      random(140, 280), random(height),
      random(140, 280), random(height)
    );
    fill(color(0, 0, 255));
    quad(
      random(280, 420), random(height),
      random(280, 420), random(height),
      random(280, 420), random(height)
    );
    fill(color(255, 255, 0));
    quad(
      random(420, 560), random(height),
      random(420, 560), random(height),
      random(420, 560), random(height)
      
      
    );
  }
  frameRate(0.5);   
}
