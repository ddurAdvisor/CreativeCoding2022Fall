/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2016-05-08 13:15:21
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:46:18
* @detail
*/
class Dot {
  float x, y, z;
  boolean drilled;

  Dot(float a, float b, float c) {
    this.x = a;
    this.y = b;
    this.z = c;
    this.drilled = false;
  }
}
