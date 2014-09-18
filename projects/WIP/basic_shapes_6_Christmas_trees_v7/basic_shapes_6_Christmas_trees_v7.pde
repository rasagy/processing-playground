boolean isPaused=false;

int moonX, moonY, moonSize;

int shootingStar;
float shootingStarX, shootingStarY, shootingStarDir;

void setup() {  
  size(800, 600);
  background(27);
  frameRate(24);
  noStroke();
  init();
  //rect(100,100,100,100);
}

void draw() {    
  if (mousePressed) {
    if (mouseButton==LEFT)
    { 
      println(frameCount);
      //if(frameCount%3==0) saveFrame();
      isPaused=(isPaused)?false:true;      
    } 
    else if (mouseButton==RIGHT) {
      saveFrame("Trees-night-###.png");
    }
  } 
  else if (!isPaused) {
    noStroke();
    //Go dark or go light?
    //Darkness level (0-black,20-grey), fade (2-no fade, 20-quick fade)
    fill(15, random(5));    
    rect(0, 0, width, height);
    makeMoon();
    if (shootingStar>0) moveShootingStar();
    switch(int(random(5)))
    {
    case 0:
    case 1:
      //Put tree
      makeTree(int(width*0.05+random(width*0.9)), height-100, int(100+random(40)));
      //makeTree(int(width*0.05+random(width*0.9)), height-100, int(100+random(40)));
      //break;
    case 2:
      //Sketch Ground
      makeGround(2);
      break;    
    case 3:
      //Put star
      makeStar(int(width*0.05+random(width*0.9)), int(random(height-250)), int(random(3)+1));
      break;
    case 4:
      if (shootingStar==0 && random(25)<1) {
        shootingStar=-1;
        moveShootingStar();
      }
      break;
    default:    

      break;
    }
  }
}

void init() {
  moonX=int(random(width*0.7)+width*0.1);
  moonY=int(random(height-400)+100);
  moonSize=int(random(15));
  shootingStar=0;
}

void moveShootingStar() {
  if (shootingStar!=0) {
    if (shootingStar==-1) {
      shootingStar=50;
      shootingStarDir=random(4)-2;
      shootingStarX=random(width*0.5)+width*0.2;
      shootingStarY=random(height-400)+100;
//      println("Shooting:"+shootingStarX+","+shootingStarY);
    }

    pushMatrix();
    translate(shootingStarX, shootingStarY);
    if (shootingStar>40) stroke(150+(50-shootingStar)*10, 100);
    else if (shootingStar>5) stroke(250, 100);
    else stroke(shootingStar*40+50, shootingStar*16+20);
    strokeWeight(1);
    line(-1, -1, 1, 1);
    line(1, -1, -1, 1);
    popMatrix();
    shootingStarX+=(shootingStarDir>0)?2.5:-2.5;
    shootingStarY+=(abs(shootingStarDir)<1)?shootingStarDir:(shootingStarDir<0)?shootingStarDir+1:shootingStarDir-1;
    shootingStar--;
  }
}

void makeMoon() {
  noStroke();
  fill(250);
  ellipse(moonX, moonY, 50, 50);
  fill(25);
  ellipse(moonX-moonSize-3, moonY-moonSize-3, 55+moonSize*1.5, 55+moonSize*1.5);
}

void makeGround(int loopCount) {
  for (int i=0;i<loopCount;i++) {
    strokeWeight(2);
    stroke(80+random(50), 50+random(30), 10+random(20), 100+random(100));
    int groundX=int(random(width*0.6));
    int groundWidth=int(random(width*0.2)+width*0.2);
    int groundY=int(random(15)+1+height-100);
    line(groundX, groundY, groundX+groundWidth, groundY+random(4)-2);

    pushMatrix();
    int grassSize=int(random(6)+1);
    translate(int(width*0.05+ random(width*0.9)), height-100);
    stroke(30, 175, 30, 200);    
    line(-grassSize/2, -grassSize/2, 0, 0);
    line(-grassSize/3, -grassSize/1.5, 0, 0);
    line(0, -grassSize, 0, 0);
    line(-grassSize/3, -grassSize/1.5, 0, 0);
    line(grassSize/2, -grassSize/2, 0, 0);
    popMatrix();
  }
}

void makeStar(int starX, int starY, int starSize) {
  int starRotate=int(random(4));
  //println(starX+" "+starY+" Size:"+starSize+" R:"+starRotate);
  pushMatrix();
  translate(starX, starY);
  rotate(starRotate*PI/8);

  strokeWeight(1);
  stroke(250, random(100)+150);
  line(0, -starSize, 0, starSize);
  line(-starSize, 0, starSize, 0);
  popMatrix();
}

void makeTree(int treeX, int treeY, int treeSize) {
  //println("X="+treeX+",Y="+treeY+",S="+treeSize);
  int branchSize=treeSize/50;
  int branchHeight=treeSize/20;
  int branchTop;

  noStroke();
  fill(128, 64, 0, 150);  
  rect(treeX-2-treeSize/100, treeY-treeSize/2, treeSize/50+4, treeSize/2);
  strokeWeight(2);
  stroke(20, 50);
  line(treeX-1-treeSize/100, treeY-treeSize/2, treeX-1-treeSize/100, treeY-2);
  strokeWeight(1);
  stroke(30, 50);
  line(treeX+1+treeSize/100, treeY-treeSize/2, treeX+1+treeSize/100, treeY-2);

  noStroke();

  for (int counter=0;counter<10;counter++)
  {
    float jump=treeSize/100+random(treeSize/50);
    branchSize+=jump;
    branchHeight+=treeSize/80+random(treeSize/30);
    branchTop=counter*treeSize/20+int(noise(1+counter/10)*10);

    beginShape();
    fill(30, 175, 30, 220+counter*5);    
    //fill(30, 175, 30);
    vertex(treeX, treeY-treeSize+branchTop);
    vertex(treeX-branchSize, treeY-treeSize+branchTop+branchHeight);
    vertex(treeX+branchSize, treeY-treeSize+branchTop+branchHeight);
    endShape();    

    //println(branchSize+" / T:"+branchTop+" / H"+branchHeight);
  }
}
