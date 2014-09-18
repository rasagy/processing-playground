int counter;
int shapeSize=4;
void setup() {
  size(800, 600);
  background(250);
  fill(255, 0, 0, 50);
  strokeWeight(0);
  stroke(100);
  counter = 0;
}
void draw() {
  if(counter<16) {
    ellipse(200+cos(counter*TWO_PI/16)*100,200-sin(counter*TWO_PI/16)*100,30*shapeSize,30*shapeSize);
    counter++;
  } else {
    stop();
  }
}

