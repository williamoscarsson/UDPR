Button[] nrBtn = new Button[10];
int[] btnColorR = new int[10];
int[] btnColorG = new int[10];
int[] btnColorB = new int[10];
Img img;
boolean isRight = true;
boolean paused = false;
float rotateValue = 0.0;

enum PausedState{
  RIGHT,
  WRONG,
  PAUSED,
  GO
}

PausedState pausedState = PausedState.GO;

void setup(){
  size(800,800);

  for(int i=0; i<10; i++){
    btnColorR[i] = 200;
    btnColorG[i] = 255;
    btnColorB[i] = 200;
  }
}


void draw(){
  play();
  paused();
}

void play(){
  if(paused) return;
  drawUi();
  drawButton();
  drawImg();
  img.printImg(img.getNumbOfObjects());
}

void paused(){
  if(!paused) return;
    switch (pausedState){
      case RIGHT :
        drawUi();
        fill(0,0,0,50);
        rect(0, 0, 800, 800);
        image(loadImage("Imgs/o.png"),200,150,400,400);
        uppdateRotateValue();
        img.drawWinImg(rotateValue);
        isRight = true;
      break;	
      case WRONG :
        drawUi();
        fill(0,0,0,50);
        rect(0, 0, 800, 800);
        image(loadImage("Imgs/X.png"),200,150,400,400);
        
      break;	
    }

}

void uppdateRotateValue(){
 if(rotateValue < 360){
   rotateValue += 0.05;
 }else{
   rotateValue = 0.05;
 }
 
}

void drawImg(){
  if(!isRight) return; //returns om inte rätt svar har tryckts

  img = new Img();
  isRight = false;
}

void drawButton(){
  //text("Hur många ____ finns det?", 400, 60);
  //skriv logik för att fylla i vad som ritas, och fixa formatering

  textSize(50);

  //placera nrknappar
  for (int i = 0; i < 10; i++){
    if (i<5) {
      nrBtn[i] = new Button(165+100*i, 595, str(i+1), color(btnColorR[i],btnColorG[i],btnColorB[i]));
    } else {
      nrBtn[i] = new Button(165+100*(i-5), 685, str(i+1), color(btnColorR[i],btnColorG[i],btnColorB[i]));
    }
  }
}

void drawUi(){
  background(200,255,200);
  fill(255,255,255);
  stroke(0,0,0);
  rect(100,575,600,200,10);
  //rect(200,10,400,100,10);
  textAlign(CENTER);
}

void mouseMoved(){
  //hover-färg på knappar
  for (int i = 0; i < 10; i++){
    if(nrBtn[i].isOver()){
      btnColorR[i] = 245;
      btnColorB[i] = 245;
    } else {
      btnColorR[i] = 200;
      btnColorB[i] = 200;
    }
  }
}

void mousePressed(){
  unPause();
  checkNumber();
  activateButtons();
}

void checkNumber(){
  if(pausedState != PausedState.GO)return;
  for (int i = 0; i < 10; i++){
    if(nrBtn[i].isOver()){
      if(i == img.getNumbOfObjects()-1){
        paused = true;
        pausedState = PausedState.RIGHT;
      }else{
        paused = true;
        pausedState = PausedState.WRONG;
      }
    }
  }
}

void unPause(){
  paused = false;
  play();
}

void activateButtons(){
  if(paused) return;
  pausedState = PausedState.GO;
}
