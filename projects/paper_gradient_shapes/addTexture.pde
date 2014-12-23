// Basic paper-like texture

void addTexture() {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(85-10, 85+10), random(5, 10));
      rect(i, j, 2, 2);
    }
  }

  for (int k = 0; k<30; k++) {
    fill(random(40, 60), random(25, 30));
    rect(random(0, width-2), random(0, height-2), 2, 2);
  }
}
