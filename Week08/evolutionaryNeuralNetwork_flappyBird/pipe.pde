/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 18:16:39
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:56:54
* @detail
*/

/**
 * pipe
 */
class pipe{
  float top;
  float bottom;
  float x;
  float w;
  float speed;
  float spacing;

  /**
   * [pipe description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:56:41+0800
   * @return   {[type]}                 [description]
   */
  pipe(){
    spacing = 125;
    top = random(height/ 6, .75 * height);
    bottom = height - (top + spacing);
    w = 80;
    x = width;
    speed = 6;
  }

  void show(){
    fill(255);
    rectMode(CORNER);
    rect(x, 0, w, top);
    rect(x, height-bottom, w, bottom);
  }

  void update(){
    x -= speed;
  }

  boolean offscreen(){
    return x < -w;
  }

  /**
   * [hit description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:56:50+0800
   * @param    {[type]}                 bird b             [description]
   * @return   {[type]}                      [description]
   */
  boolean hit(bird b){
    if (b.pos.y < top+b.r || b.pos.y+b.r > height-bottom){
      if (b.pos.x+b.r > x && b.pos.x < (x + w)+b.r)
        return true;
    }
    return false;
  }
}
