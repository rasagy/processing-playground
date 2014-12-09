//Triangle Patterns
//Create triangles with one vertex using mouse coords()
//Press mouse & drag to create triangles
//Click on top bar to cycle colors (vary mouseX for Hue)
//Press 'R' for clearing (& choosing random color)
//Press 'Space' for a screenshot
//Created by @rasagy

color myColor;
boolean hit_edge=false;

void setup() {
  size(600, 500);
  colorMode(HSB, 100);
  background(98);  
  randomizeColor(random(100));
}
void draw() { 
  if (mousePressed && !hit_edge) {
    if (mouseX>0 && mouseX<width && mouseY>_getUiHeight() && mouseY<height) {
      //background(250,250,250,10);
      beginShape();
      fill(myColor, 5);
      noStroke();
      vertex(width/4, height/2);
      vertex(width*3/4, height/2);
      vertex(mouseX, mouseY);
      endShape();
    } else {
      hit_edge=true;
      println(hit_edge);
    }
  }
}

void randomizeColor(float hue) {
  myColor=color(random(5)+hue, random(30)+60, random(20)+70);  
  strokeWeight(10);
  stroke(myColor);
  int uiHeight = _getUiHeight();
  rect(0, 0, width, uiHeight);
}

void mousePressed() {
  //  setup();
  hit_edge=false;
  if (mouseY<10)
    randomizeColor(map(mouseX, 0, width, 0, 100));
}

void keyPressed() {
  if (key == ' ')
  {
    saveFrame("/print/prism"+int(random(100))+".png");
    //    setup();
  } else if (key == 'r' || key == 'R')
  {  
    setup();
  }
}

int _getUiHeight() {
  return 10;
}

