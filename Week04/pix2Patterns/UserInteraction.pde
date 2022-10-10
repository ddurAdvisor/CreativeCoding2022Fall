/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2016-05-08 13:15:21
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:51:07
* @detail
*/
String currentFilename = "";

/**
 * [loadPicture description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:50:58+0800
 * @param    {[type]}                 String p             [description]
 * @return   {[type]}                        [description]
 */
void loadPicture(String p) {
  String[] temp = split(p,"/");
  currentFilename = split(temp[temp.length-1],".")[0];
  print(currentFilename);
  loaded = false;
  pic = requestImage(p);
  //  pic = loadImage(p);
  //  while (pic.width<1) delay(100);
  //  calcResult();
}

String getFilename() {
  return outW+"x"+outH+"_"+bitDim+"mm_"+currentFilename;
}

void setDim(float d) {
  bitDim = d;
  calcResult();
}

void setWidth(float w) {
  outW = round(w);
  calcResult();
}

void setHeight(float h) {
  outH = round(h);
  calcResult();
}

void setRotation(float r) {
  imgrot = r;
  calcResult();
}

void setScale(float s) {
  sf = s;
  calcResult();
}

void setShowImg(boolean b) {
  showImg = b;
}

void setConnect(boolean b) {
  con = b;
  result = createPreview(myDots);
}

void setType(int t) {
  type = t;
  calcResult();
}

void setLow(float v) {
  low = v;
  calcResult();
}

void setHigh(float v) {
  high = v;
  calcResult();
}

void targetMode() {
  targetting = !targetting;
  if (targetting) cursor(CROSS);
  else cursor(ARROW);
}

void keyPressed() {
  
  switch (key) {
  case '3':
    setDim(3);
    break;
  case '6':
    setDim(6);
    break;
  case '9':
    setDim(9);
    break;
  case '2':
    setDim(12);
    break;
  case 'c':
    con = !con;
    result = createPreview(myDots);
    //calcResult();
    break;
  case 'r':
    root = !root;
    result = createPreview(myDots);
    //calcResult();
    break;
  case 't':
    type = (type+1)%5;
    calcResult();
    break;
  case 'k':
    cursor(CROSS);
    break;
  case 'a':
    cursor(ARROW);
    break;
  case 'g':
    targetting = !targetting;
    if (targetting) cursor(CROSS);
    else cursor(ARROW);
    break;
  case 'f':
    fit = !fit;
    break;
  case 'x':
    setRotation(45);
    break;
  case 'w':
    showImg = !showImg;
    break;
  }
  
}

void mouseClicked() {
  if (!targetting) return;
  
  cursor(CROSS);
  centerX = mouseX- width/2+outW/2;
  centerY = mouseY-height/2+outH/2;
  calcResult();
  cursor(ARROW);
  targetting = false;
}
