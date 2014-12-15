//Triangle Patterns
//Create triangles with one vertex using mouse coords()
//Press mouse & drag to create triangles
//Click on top bar to cycle colors (vary mouseX for Hue)
//Press 'R' for clearing (& choosing random color)
//Press 'Space' for a screenshot
//Created by @rasagy

color myColor;

void setup() {
  size(600, 500);
  colorMode(HSB, 100);
  background(98);  
  randomizeColor(random(100));
}

void randomizeColor(float hue) {
  myColor=color(random(5)+hue, random(30)+60, random(20)+70);  
  noStroke();
  fill(myColor);
  int uiHeight = _getUiHeight();
  rect(0, 0, width, uiHeight);
}

void mousePressed() {
  if (mouseY<10)
    randomizeColor(map(mouseX, 0, width, 0, 100));
}

void mouseDragged() {
  if (mouseX>0 && mouseX<width && mouseY>_getUiHeight() && mouseY<height) {
    beginShape();
    fill(myColor, 5);
    noStroke();
    vertex(width/4, height/2);
    vertex(width*3/4, height/2);
    vertex(mouseX, mouseY);
    endShape();
  }
}

//
// Basic Keyboard Interactions
//

void keyPressed() {
  switch(key){
     case ' ':
       saveFrame("/print/prism"+int(random(100))+".png");
       break;
     case 'r':
     case 'R':
       setup();  //Reset
       break;
  }
}

int _getUiHeight() {
  return 20;
}


