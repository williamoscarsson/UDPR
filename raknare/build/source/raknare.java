import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class raknare extends PApplet {

Button[] nrBtn = new Button[10];
int[] btnColorR = new int[10];
int[] btnColorG = new int[10];
int[] btnColorB = new int[10];

public void setup(){
  

  for(int i=0; i<10; i++){
    btnColorR[i] = 200;
    btnColorG[i] = 255;
    btnColorB[i] = 200;
  }
}

public void draw(){
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

public void mouseMoved(){
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
class Button {
  // attributes
  int x, y;
  String text;
  int col;
  int ww; // icon width
  int hh; // icon height
  // method-constructor
  Button(int ix, int iy, String it, int ict) {
    x = ix; // start x (upper left)
    y = iy; // start y (upper left)
    text = ""+it; // text string
    col = ict; // text color
    ww = 70;
    hh = 70;
    fill(col);
    rect(x,y,ww,hh);
    fill(0);

    text(text, x+35, y+50);

  }
  public boolean isOver() {
    return(mouseX>=x&&mouseX<=x+ww&&mouseY>=y&&mouseY<=y+hh);
  }
}
  public void settings() {  size(800,800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "raknare" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
