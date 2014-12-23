// Basic Keyboard Interactions for saving frame & reset

void keyPressed() {
  switch(key){
     case ' ':
       saveFrame("/print/"+int(random(10000))+".png");
       break;
     case 'r':
     case 'R':
       setup();  //Reset
       break;
  }
}

