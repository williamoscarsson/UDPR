Button[] nrBtn = new Button[10];
int[] btnColorR = new int[10];
int[] btnColorG = new int[10];
int[] btnColorB = new int[10];

void setup(){
  size(800,800);

  for(int i=0; i<10; i++){
    btnColorR[i] = 200;
    btnColorG[i] = 255;
    btnColorB[i] = 200;
  }
}

void draw(){
  background(200,255,200);
  fill(255,255,255);
  stroke(0,0,0);
  rect(100,575,600,200,10);
  rect(200,10,400,100,10);
  textAlign(CENTER);

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
