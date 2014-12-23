//Gradient Shapes on Paper
//Creates a circle/square filled with gradient
//Randomly selects a Hue and gradually changes Saturation & Lighting for the gradient
//Click/press 'R' to regenrate
//Use MouseX to control thickness of gradation, MouseY to control number of gradations
//Press '(space)' to save image
//Created by @rasagy

int shapeSize;
int gradLevels;
void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  smooth();
  noLoop();
  redraw();
}

void draw() {
  background(100);
  shapeSize=int(map(mouseX, 0, width, width/50, width/20)*2);
  gradLevels=int(map(mouseY, 0, height, 3, 8));
  fillRandomGradient(shapeSize, gradLevels);
  drawRandomShape(shapeSize*gradLevels);
  addTexture();
}

void mousePressed() {
  redraw();
}

void fillRandomGradient(int size, int level) {
  int change=random(2, 4)*2;
  int h=random(100);
  int s=random(30, 50);
  int b=random(80, 90);
  noStroke();
  for (int i=0; i<level; i++) {
    fill(h, s, b);
    rect(0, height/2-size*level/2+i*size, width, size+1);
    h=(h+random(2))%100;
    s+=change;
    b-=change;
  }
}

void drawRandomShape(int totalSize) {
  int r=(int)random(0, 2);

  strokeWeight(width);
  stroke(90);
  noFill();

  switch(r) {
  case 0:
    ellipse(width/2, height/2, totalSize+width, totalSize+width);
    break;
  case 1:
    rect(-totalSize/2, -totalSize/2, totalSize+width, totalSize+width);
    break;
  }
}
