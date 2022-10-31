/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 18:16:39
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:47:38
* @detail
*/
class Rectangle {
   int x;
   int y;
   int width;
   int height;
   
   /**
    * [Rectangle description]
    * @Author   bit2atom
    * @DateTime 2022-10-31T22:47:30+0800
    * @param    {[type]}                 int x_ [description]
    * @param    {[type]}                 int y_ [description]
    * @param    {[type]}                 int w  [description]
    * @param    {[type]}                 int h  [description]
    */
   Rectangle(int x_, int y_, int w, int h) {
     x = x_;
     y = y_;
     width = w;
     height = h;
   }
   
   /**
    * [contains description]
    * @Author   bit2atom
    * @DateTime 2022-10-31T22:47:35+0800
    * @param    {[type]}                 int px            [description]
    * @param    {[type]}                 int py            [description]
    * @return   {[type]}                     [description]
    */
   boolean contains(int px, int py) {
     return (px > x && px < x + width  && py > y && py < y + height);
   }
   
}
