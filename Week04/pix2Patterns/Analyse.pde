/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2016-05-08 15:31:37
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:46:07
* @detail
*/
boolean calcResult() {
  if (pic == null || pic.width<1) return false;
  result=null;
  //sf = max((float)outW/pic.width, (float)outH/pic.height);
  tmp = createGraphics(outW, outH);
  tmp.beginDraw();
  tmp.background(255);
  tmp.imageMode(CENTER);
  tmp.translate(outW/2f, outH/2f);
  tmp.rotate(radians(imgrot));
  tmp.image(pic, 0,0, pic.width*sf, pic.height*sf);
  tmp.endDraw();
  
  

  float stp = bitDim*7f/6f;
  myDots.clear();
  switch (type) {
  case 0:
    myDots = getOrthoGrid(tmp, stp);
    patternType = "OrthoGrid";
    break;
  case 1:
    myDots = getHoneyGrid(tmp, stp);
    patternType = "HoneyGrid";
    break;
  case 2:
    myDots = getPolarGrid(tmp, stp);
    patternType = "PolarGrid";
    break;
  case 3:
    myDots = getSpiralGrid(tmp, stp);
    patternType = "SpiralGrid";
    break;
  case 4:
  	myDots = getHamiltonPath(tmp, stp);
    patternType = "HamiltonPath";
  	break;
  }
  
  result = createPreview(myDots);
  return true;
}
