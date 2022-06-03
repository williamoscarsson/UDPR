class Button {
  // attributes
  int x, y;
  String text;
  color col, colOriginal;
  int ww; // icon width
  int hh; // icon height

  PImage iconOne,iconTwo,curentIcon;

  // method-constructor
  Button(int ix, int iy,int iww, int ihh, String it, color ict) {
    x = ix; // start x (upper left)
    y = iy; // start y (upper left)
    text = ""+it; // text string
    col = ict; // text color
    ww = iww;
    hh = ihh;
    colOriginal = ict;
  }

  Button(int ix, int iy,int iww, int ihh, color ict) {
    x = ix; // start x (upper left)
    y = iy; // start y (upper left)
    ww = iww;
    hh = ihh;
    col = ict;
    colOriginal = ict;
  }

  void drawButton(){
    fill(col);
    rect(x,y,ww,hh);
    if(text != null){
      fill(0);
      text(text, x+ww/4, y+hh/2);
    }
    if(curentIcon != null){
      image(curentIcon,x,y,ww,hh);
    }
  }

  boolean isOver() {
    return(mouseX>=x&&mouseX<=x+ww&&mouseY>=y&&mouseY<=y+hh);
  }
  boolean isOverSounde(float xS,float yS){
    return(xS>=x&&xS<=x+ww&&yS>=y&&yS<=y+hh);
  }

  
  void addIcons(String iconOne, String iconTwo){
    this.iconOne = loadImage(iconOne);
    curentIcon = this.iconOne;
    this.iconTwo = loadImage(iconTwo);
  }

  void changeIcon(){
    if(curentIcon.equals(iconOne)){
      curentIcon = iconTwo;
    }else {
      curentIcon = iconOne;
    }
  }

  void changeCol(color c){
    col = c;
  }

  void changeCol(){
    col = colOriginal;
  }
}
