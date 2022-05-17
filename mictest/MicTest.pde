
import processing.sound.*;
Amplitude amp;

Button[] nrBtn = new Button[10];
int[] btnColorR = new int[10];
int[] btnColorG = new int[10];
int[] btnColorB = new int[10];

    color c = color(200, 255, 200);
    color cD = color(230, 255, 230);

float mouseSens = 100;
float mouseX = 400;
float mouseY = 400;
int dir = 0;
int user = 0;
boolean soundVolume = false;

int moth = 50;

AudioIn in;
int[][] colo=new int[300][3];
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
}
 
void draw()
{
    if(user == 0){
        background(43,134,195);
        color c = color(200, 255, 200);
        color cD = color(230, 255, 230);
        nrBtn[0] = new Button(100,400,50,50,"user",c);
        nrBtn[1] = new Button(650,400,50,50,"admin",c);
        
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseX,mouseY)){
            nrBtn[0] = new Button(100,400,50,50,"user",cD);
        } 
        else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseX,mouseY)){
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
        
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseX,mouseY)){
            nrBtn[0] = new Button(100,400,50,50,"user1",cD);
        }
         else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseX,mouseY)){
            nrBtn[1] = new Button(100,400,50,50,"user2",cD);
        }
        else if(nrBtn[2].isOver() || nrBtn[2].isOverSounde(mouseX,mouseY)){
            nrBtn[2] = new Button(650,400,50,50,"showAMP",cD);
        }else if(nrBtn[3].isOver() || nrBtn[3].isOverSounde(mouseX,mouseY)){
            nrBtn[3] = new Button(650,500,50,50,"+ Sens",cD);
        }else if(nrBtn[4].isOver() || nrBtn[4].isOverSounde(mouseX,mouseY)){
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
    if(mouseX >= 200 && mouseX <= 600 && mouseY >= 200 && mouseY <= 600 && moth < 50) moth += 2;
    else if (moth > 10) moth -= 1;     
    
    ellipse(0,50,100, moth);


    fill(0,0,0);
    stroke(255);

  float eyeDirx = mouseX-400;
  float eyeDiry = mouseY-350;
  
  if( eyeDirx > 30) eyeDirx = 30;
  else if( eyeDirx < -30) eyeDirx = -30;
  if( eyeDiry > 30) eyeDiry = 30;
  else if ( eyeDiry < -30) eyeDiry = -30;   
  
  ellipse(-50 + eyeDirx, -50+ eyeDiry, 30, 30);
  ellipse(50 + eyeDirx, -50+ eyeDiry, 30, 30);
  translate(-400,-400);
  
  fill(0,0,0);
  
}



//moves the mise in the curent direction
void moveMouse(){
    switch (dir) {
        case 0:
            mouseX += reduseNoiceAndGetAmp();
            if(mouseX > 800) mouseX = 800;
            triangle(mouseX, mouseY, mouseX-12, mouseY-5, mouseX-12, mouseY+5);

        break;
        case 1:
            mouseY += reduseNoiceAndGetAmp();
            if(mouseY > 800) mouseY = 800;
            triangle(mouseX, mouseY, mouseX-5, mouseY-12, mouseX+5, mouseY-12);
        break;
        case 2:
            mouseX -= reduseNoiceAndGetAmp();
            if(mouseX < 0) mouseX = 0;
            triangle(mouseX, mouseY, mouseX+12, mouseY+5, mouseX+12, mouseY-5);
        break;
        case 3:
            mouseY -= reduseNoiceAndGetAmp();
            if(mouseY < 0) mouseY = 0;
            triangle(mouseX, mouseY, mouseX+5, mouseY+12, mouseX-5, mouseY+12);
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
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseX,mouseY)){
            user = 2;
        }else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseX,mouseY)){
            user = 1;
        }
    }

    else if(user == 1){
        if(nrBtn[0].isOver() || nrBtn[0].isOverSounde(mouseX,mouseY)){
            user = 2;
        }else if(nrBtn[1].isOver() || nrBtn[1].isOverSounde(mouseX,mouseY)){
            user = 3;
        }else if(nrBtn[2].isOver() || nrBtn[2].isOverSounde(mouseX,mouseY)){
            soundVolume ^= true;
        }else if(nrBtn[3].isOver() || nrBtn[3].isOverSounde(mouseX,mouseY)){
            mouseSens += 10;
        }else if(nrBtn[4].isOver() || nrBtn[4].isOverSounde(mouseX,mouseY)){
            if(mouseSens != 10){
                mouseSens -= 10;
            }
        }
    }
}

float reduseNoiceAndGetAmp(){
    if(amp.analyze()*mouseSens < mouseSens/100) return 0;

    return amp.analyze()*mouseSens;
}