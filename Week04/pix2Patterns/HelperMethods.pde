/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2016-05-08 13:15:21
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:51:23
* @detail
*/
//for color images: brightness(color) only returns max(red,green,blue)
//weighted factors more accurate
//returns 1 for white and 0 for black
float luminosity(color c) {
  return (red(c)*0.3 + green(c)*0.59 + blue(c)*0.11)/255f;
}

//luminosity of picture patch
/**
 * [luminosityAverage description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:48:16+0800
 * @param    {[type]}                 PImage p             [description]
 * @return   {[type]}                        [description]
 */
float luminosityAverage(PImage p) {
  float out = 0;
  for (int i=0; i<p.pixels.length; i++) {
    color c = p.pixels[i];
    out += luminosity(c);
  }
  return out/p.pixels.length;
}

float fitScale() {
  sf = max((float)outW/pic.width, (float)outH/pic.height);
  calcResult();
  return sf;
}

float level(float v) {
  float out = map(v, low, high, 0, 1);
  if (out>1) out = 1;
  if (out<0) out = 0;
  return out;
}

/**
 * [ballnoseConversion description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:48:42+0800
 * @param    {[type]}                 float n             [description]
 * @return   {[type]}                       [description]
 */
float ballnoseConversion(float n) {
  // n = fraction of full circle
  // 1 is black
  // 0 is white
  // 0.5 is half the area -> radius is sqrt(area) = 0.707
  // radius is x, x=r*cos(a) -> y = sin(acos(x))
  float x = sqrt(n);
  float a = acos(x);
  float y = sin(a);
  float out = 1-y;
  return out;
}

// format num also used for mm/inch conversion
/**
 * [formatNum description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:48:57+0800
 * @param    {[type]}                 float f             [description]
 * @return   {[type]}                       [description]
 */
String formatNum(float f) {
  return nf(f, 1, 4);
}
