float counter;
int shapeSize=4;
void setup() {
  size(800, 600);
  frameRate(24);
  background(250);  
  strokeWeight(0);
  stroke(150,100,50);
  counter = 100;
}
void draw() {
  int r1,r2;
  r1=int(random(20));
  r2=int(random(20));
  line(counter+r1-10,height-50,counter+r2-10,50);
  if(counter>700) {
    saveFrame("Wood-"+int(random(100))+".png");
    stop();
  } else {
    counter+=0.75;
  }
}
