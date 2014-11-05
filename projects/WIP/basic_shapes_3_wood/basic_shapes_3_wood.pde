float counter;
int shapeSize=4;
void setup() {
  size(800, 600);
  frameRate(36);
  background(200,180,120);
  strokeWeight(0);
  stroke(150,100,50);
  counter = 5;
}
void draw() {
  int r1,r2;
  r1=int(random(20));
  r2=int(random(25));
  line(counter+r1-10,height-5,counter+r2-10,5);
  if(counter>width-5*2) {
    saveFrame("Export/Wood-"+int(random(1000))+".png");
    stop();
  } else {
    counter+=0.75;
  }
}
