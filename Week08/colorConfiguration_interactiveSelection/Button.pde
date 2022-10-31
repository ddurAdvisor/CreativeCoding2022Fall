/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 18:16:39
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:47:47
* @detail
*/
// Interactive Selection
// http://www.genarts.com/karl/papers/siggraph91.html
// https://www.karlsims.com/papers/siggraph91.html

/**
 * Button
 */
class Button {
  Rectangle r;  // Button's rectangle
  String txt;   // Button's text
  boolean clickedOn;  // Did i click on it?
  boolean rolloverOn; // Did i rollover it?

  /**
   * [Button description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:44:23+0800
   * @param    {[type]}                 int    x [description]
   * @param    {[type]}                 int    y [description]
   * @param    {[type]}                 int    w [description]
   * @param    {[type]}                 int    h [description]
   * @param    {[type]}                 String s [description]
   */
  Button(int x, int y, int w, int h, String s) {
    r = new Rectangle(x,y,w,h);
    txt = s;
  }

  void display() {
    // Draw rectangle and text based on whether rollover or clicked
    rectMode(CORNER);
    stroke(0); noFill();
    if (rolloverOn) fill(0.5);
    if (clickedOn) fill(0);
    rect(r.x,r.y,r.width,r.height);
    float b = 0.0;
    if (clickedOn) b = 1;
    else if (rolloverOn) b = 0.2;
    else b = 0;
    fill(b);
    textAlign(CENTER, CENTER);
    text(txt,r.x+r.width/2-10,r.y+10);
  }
  
  
  // Methods to check rollover, clicked, or released (must be called from appropriate
  // Places in draw, mousePressed, mouseReleased
  boolean rollover(int mx, int my) {
    if (r.contains(mx,my)) rolloverOn = true;
    else rolloverOn = false;
    return rolloverOn;
  }

  boolean clicked(int mx, int my) {
    if (r.contains(mx,my)) clickedOn = true;
    return clickedOn;
  }

  void released() {
    clickedOn = false;
  }

}
