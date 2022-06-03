private static final int nrButtons = 6;

Button[] nrBtn = new Button[nrButtons];

Button lock, food;
String errorMsg = "";

//Data
boolean catInside = true;
boolean catFeed = false;
int downPor = 0;
int temp = 0;
int time = 7;
int foodLeft = 0;
boolean doorloked = false;

void setup(){
  size(800,800);

  loadButtons();
}

void loadButtons(){
  color c = color(200, 255, 200);
  //cat home button
  nrBtn[0] = new Button(700,200,50,50,c);
  nrBtn[0].addIcons("Icons/CatHome.png","Icons/CatOute.png");
  //change temp button
  nrBtn[1] = new Button(700,300,50,50,"°C+",c);
  nrBtn[2] = new Button(700,360,50,50,"°C-",c);
  //change down por
  nrBtn[3] = new Button(700,460,50,50,"mm+",c);
  nrBtn[4] = new Button(700,520,50,50,"mm-",c);
  //cange time
  nrBtn[5] = new Button(700,620,50,50,"Time+",c);
  //lock icon
  lock = new Button (700,140,50,50,c);
  lock.addIcons("Icons/unloked.png","Icons/loked.png");
  food = new Button (200,200,300,300,c);
}

void draw(){
  handlData();
  drawUi();
}

void handlData(){
  door();
  food();
}

void food(){
  if(catInside && time > 7 && time < 23 && !catFeed){
    foodLeft = 3;
    catFeed = true;
  }
  if(time == 7 || time == 17){
    catFeed = false;
  }
  if(!catInside){
    foodLeft = 0;
  }
}

void door(){
  if(foodLeft < 2 && doorloked){
    doorloked = false;
    lock.changeIcon();
  }
  if((foodLeft > 1 || temp < -10 || downPor > 8) && !doorloked){
    doorloked = true;
    lock.changeIcon();
  }
}

void drawUi(){
  food.drawButton();
  background(43,134,195);
  lock.drawButton();
  
  drawFood();

  for(int i = 0; i < nrButtons; i++){
    textSize(15);
    nrBtn[i].drawButton();
  }
  //temp
  fill(200, 255, 200);
  rect(680,260,90,35);
  fill(0);
  textSize(30);
  text("°C = "+ temp,680,290);
  //down por
  fill(200, 255, 200);
  rect(620,420,170,35);
  fill(0);
  textSize(30);
  text("mm Rain = "+downPor,620,450);
  //time
  fill(200, 255, 200);
  rect(680,580,90,35);
  fill(0);
  textSize(30);
  text("T = "+time,690,610);

  fill(0);
  textSize(30);
  text(errorMsg,300,50);
}

void drawFood(){
  switch (foodLeft) {
    case 0:
      image (loadImage("Icons/empty.png"), 200, 200, 300, 300);
    break;
    case 1:
      image (loadImage("Icons/onethree.png"), 200, 200, 300, 300);
    break;
    case 2:
      image (loadImage("Icons/twothree.png"), 200, 200, 300, 300);
    break;
    case 3:
      image (loadImage("Icons/Full.png"), 200, 200, 300, 300);
    break;
    default :
      image (loadImage("Icons/Full.png"), 200, 200, 300, 300);
    break;	
  }
}

void mouseMoved(){
  //hover-färg på knappar
  for (int i = 0; i < nrButtons; i++){
    if(nrBtn[i].isOver()){
      nrBtn[i].changeCol(color(245,255,245));
    } else {
      nrBtn[i].changeCol();
    }
  }
}

void mousePressed(){
  errorMsg = "";

  if(food.isOver() && foodLeft > 0){
    foodLeft--;
  }

  for (int i = 0; i < nrButtons; i++){
    if(nrBtn[i].isOver()){
      switch (i) {
        case 0:
          if(!catInside || !doorloked){
            nrBtn[i].changeIcon();
            catInside = !catInside;
          }
          else{
            errorMsg = "DorLocked";
          }
        break;
        case 1:
          temp++;
        break;
        case 2:
          temp--;
        break;
        case 3:
          downPor++;
        break;
        case 4:
          if(downPor > 0){
            downPor--;
          }
        break;  
        case 5:
          if ( time < 24){
            time++;
          }else{
            time = 1;
          }
      }
    }
  }
}

