class Button {
  // attributes
  int x, y;
  String text;
  color col;
  int ww; // icon width
  int hh; // icon height
  // method-constructor
  Button(int ix, int iy,int iww, int ihh, String it, color ict) {
    x = ix; // start x (upper left)
    y = iy; // start y (upper left)
    text = ""+it; // text string
    col = ict; // text color
    ww = iww;
    hh = ihh;
    fill(col);
    rect(x,y,ww,hh);
    fill(0);

    text(text, x+ww/4, y+hh/4);

  }

  boolean isOver() {
    return(mouseX>=x&&mouseX<=x+ww&&mouseY>=y&&mouseY<=y+hh);
  }
  boolean isOverSounde(float xS,float yS){
    return(xS>=x&&xS<=x+ww&&yS>=y&&yS<=y+hh);
  }

}
