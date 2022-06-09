import http.requests.*;
import processing.sound.*;
Amplitude amp;

Button[] nrBtn = new Button[10];
int[] btnColorR = new int[10];
int[] btnColorG = new int[10];
int[] btnColorB = new int[10];

    color c = color(200, 255, 200);
    color cD = color(230, 255, 230);

float mouseSens = 100;
float mouseXs = 400;
float mouseYs = 400;
int dir = 0;
int user = 0;
boolean soundVolume = false;

int moth = 50;


Timeget timeget;

AudioIn in;
int[][] colo=new int[300][3];

String time;
int lastCallTime = 0;
int interval = 1000;

//AudioIn in;

//sets up audio input
void setup()
{
  size(800, 800);
  background(43,134,195);
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  for(int i=0; i<10; i++){
    btnColorR[i] = 200;
    btnColorG[i] = 255;
    btnColorB[i] = 200;
  }
  
  timeget = new Timeget();
  
}
 
void draw()
{   
    int timeSinceLastCall = millis() - lastCallTime;

    if(user == 0){
        background(43,134,195);
        color c = color(200, 255, 200);
        color cD = color(230, 255, 230);
        nrBtn[0] = new Button(100,400,50,50,"user",c);
        nrBtn[1] = new Button(650,400,50,50,"admin",c);
        
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseXs,mouseYs)){
            nrBtn[0] = new Button(100,400,50,50,"user",cD);
        } 
        else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseXs,mouseYs)){
            nrBtn[1] = new Button(650,400,50,50,"admin",cD);
        }
    }else{
        Admin();
        WDraw();
    }
    if(soundVolume){
        fill(255,255,255);
        rect(680,680,50,50);
        fill(0,0,0);
        text("AMP\n"+nf(amp.analyze()*mouseSens,2,2), 700, 700);
    }
        
    moveMouse();
    fill(255,255,255);
    rect(50,700,140,20);
    fill(0,0,0);
    if(timeSinceLastCall > interval){
        time = timeget.getTime();
        lastCallTime = millis();
    }
        text(time,50, 710);
}

void Admin(){
    if(user != 1) return;
    background(43,134,195);
    fill(255,255,255);
    rect(200, 200, 400, 100);
    fill(0,0,0);
    textSize(72);
    text("Admin",300, 260);
    textSize(10);

        nrBtn[0] = new Button(100,400,50,50,"user1",c);
        nrBtn[1] = new Button(100,500,50,50,"user2",c);
        nrBtn[2] = new Button(650,400,50,50,"showAMP",c);
        nrBtn[3] = new Button(650,500,50,50,"+ Sens",c);
        nrBtn[4] = new Button(550,500,50,50,"- Sens",c);
        
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseXs,mouseYs)){
            nrBtn[0] = new Button(100,400,50,50,"user1",cD);
        }
         else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseXs,mouseYs)){
            nrBtn[1] = new Button(100,400,50,50,"user2",cD);
        }
        else if(nrBtn[2].isOver() || nrBtn[2].isOverSounde(mouseXs,mouseYs)){
            nrBtn[2] = new Button(650,400,50,50,"showAMP",cD);
        }else if(nrBtn[3].isOver() || nrBtn[3].isOverSounde(mouseXs,mouseYs)){
            nrBtn[3] = new Button(650,500,50,50,"+ Sens",cD);
        }else if(nrBtn[4].isOver() || nrBtn[4].isOverSounde(mouseXs,mouseYs)){
            nrBtn[4] = new Button(550,500,50,50,"- Sens",cD);
        }
}

void WDraw(){
    if(user != 2) return;
  
  

  background(43,134,195);
  stroke(0);
  translate(400, 400);
    //head
    fill(255,192,203);
    ellipse(0,0,200,200);
    //eyes
    fill(255,255,255);
    ellipse(-50,-50,110,150);
    ellipse(50,-50,110,150);
    //mouth
    fill(0,0,0);
    if(mouseXs >= 200 && mouseXs <= 600 && mouseYs >= 200 && mouseYs <= 600 && moth < 50) moth += 2;
    else if (moth > 10) moth -= 1;     
    
    ellipse(0,50,100, moth);


    fill(0,0,0);
    stroke(255);

  float eyeDirx = mouseXs-400;
  float eyeDiry = mouseYs-350;
  
  if( eyeDirx > 30) eyeDirx = 30;
  else if( eyeDirx < -30) eyeDirx = -30;
  if( eyeDiry > 30) eyeDiry = 30;
  else if ( eyeDiry < -30) eyeDiry = -30;   
  
  ellipse(-50 + eyeDirx, -50+ eyeDiry, 30, 30);
  ellipse(50 + eyeDirx, -50+ eyeDiry, 30, 30);
  translate(-400,-400);
  
  fill(255,255,255);
  
  rect(600,470,150,20);
  fill(0);
  text("Change TimeZone",620,480);

  nrBtn[0] = new Button(650,500,50,50,"STHLM",c);
  nrBtn[1] = new Button(650,560,50,50,"LDN",c);
  nrBtn[2] = new Button(650,620,50,50,"ATH",c);

  if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseXs,mouseYs)){
            nrBtn[0] = new Button(650,500,50,50,"STHLM",cD);
        }
         else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseXs,mouseYs)){
            nrBtn[1] = new Button(650,560,50,50,"LDN",cD);
        }
        else if(nrBtn[2].isOver() || nrBtn[2].isOverSounde(mouseXs,mouseYs)){
            nrBtn[2] = new Button(650,620,50,50,"ATH",cD);
        }
  
}



//moves the mise in the curent direction
void moveMouse(){
    switch (dir) {
        case 0:
            mouseXs += reduseNoiceAndGetAmp();
            if(mouseXs > 800) mouseXs = 800;
            triangle(mouseXs, mouseYs, mouseXs-12, mouseYs-5, mouseXs-12, mouseYs+5);

        break;
        case 1:
            mouseYs += reduseNoiceAndGetAmp();
            if(mouseYs > 800) mouseYs = 800;
            triangle(mouseXs, mouseYs, mouseXs-5, mouseYs-12, mouseXs+5, mouseYs-12);
        break;
        case 2:
            mouseXs -= reduseNoiceAndGetAmp();
            if(mouseXs < 0) mouseXs = 0;
            triangle(mouseXs, mouseYs, mouseXs+12, mouseYs+5, mouseXs+12, mouseYs-5);
        break;
        case 3:
            mouseYs -= reduseNoiceAndGetAmp();
            if(mouseYs < 0) mouseYs = 0;
            triangle(mouseXs, mouseYs, mouseXs+5, mouseYs+12, mouseXs-5, mouseYs+12);
        break;
    }

    

}

//changes the direction or selects a object
void mouseClicked() {
  if(dir != 3){
      dir++;
  }else {
      dir = 0;
  }

  if(user == 0){
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseXs,mouseYs)){
            user = 2;
        }else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseXs,mouseYs)){
            user = 1;
        }
    }

    else if(user == 1){
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseXs,mouseYs)){
            user = 2;
        }else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseXs,mouseYs)){
            user = 3;
        }else if(nrBtn[2].isOver() || nrBtn[2].isOverSounde(mouseXs,mouseYs)){
            soundVolume ^= true;
        }else if(nrBtn[3].isOver() || nrBtn[3].isOverSounde(mouseXs,mouseYs)){
            mouseSens += 10;
        }else if(nrBtn[4].isOver() || nrBtn[4].isOverSounde(mouseXs,mouseYs)){
            if(mouseSens != 10){
                mouseSens -= 10;
            }
        }
    }
    else if(user == 2){
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseXs,mouseYs)){
            timeget.timegetStockholm();
            time = timeget.getTime();
        }else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseXs,mouseYs)){
            timeget.timegetLondon();
            time = timeget.getTime();
        }else if(nrBtn[2].isOver() || nrBtn[2].isOverSounde(mouseXs,mouseYs)){
            timeget.timegetAthens();
            time = timeget.getTime();
        }
    }
}

float reduseNoiceAndGetAmp(){
    if(amp.analyze()*mouseSens < mouseSens/100) return 0;

    return amp.analyze()*mouseSens;
}