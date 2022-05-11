class Button {
  // attributes
  int x, y;
  String text;
  color col;
  int ww; // icon width
  int hh; // icon height
  // method-constructor
  Button(int ix, int iy, String it, color ict) {
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
  boolean isOver() {
    return(mouseX>=x&&mouseX<=x+ww&&mouseY>=y&&mouseY<=y+hh);
  }
}
