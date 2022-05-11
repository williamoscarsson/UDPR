
import processing.sound.*;
Amplitude amp;

float mouseSens = 100;
float mouseX = 400;
float mouseY = 400;
int dir = 0;

AudioIn in;
int[][] colo=new int[300][3];
//AudioIn in;
 
void setup()
{
  size(800, 800);
  background(43,134,195);
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}
 
void draw()
{
  moveMouse();
  WDraw();
}

void WDraw(){
  background(43,134,195);
  stroke(255);
  text(amp.analyze()*mouseSens, 600, 600);
  rect(mouseX,mouseY, 10,10);
}

void moveMouse(){
    switch (dir) {
        case 0:
            mouseX += reduseNoiceAndGetAmp();
        break;
        case 1:
            mouseY += reduseNoiceAndGetAmp();
        break;
        case 2:
            mouseX -= reduseNoiceAndGetAmp();
        break;
        case 3:
            mouseY -= reduseNoiceAndGetAmp();
        break;
    }
}

void mouseClicked() {
  if(dir != 3){
      dir++;
  }else {
      dir = 0;
  }
}

float reduseNoiceAndGetAmp(){
    if(amp.analyze()*mouseSens < mouseSens/100) return 0;

    return amp.analyze()*mouseSens;
}