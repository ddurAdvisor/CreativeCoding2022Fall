/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2013-08-12 11:38:47
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:53:51
* @detail
*/
import processing.pdf.*;
import controlP5.*;
PImage img;

ControlP5 controlP5;
public int myColorR=100;
public int myColorG=100;
public int myColorB=100;
public int myColorA=255;
public int myColorBackground=175;
boolean recordPDF = false;
boolean getColorFromSourceImage;

String[] name = {"::TextDrawArtool for Graphic Designer :: Institute of Design Management | SJTU 2013"};//title string
float x = 0, y = 0;
float stepSize = 5.0;
int palletH=20;
int palletW=200;

PFont myFont1, myFont2;
String[] fontList;//read out fonts installed in the system
int fontIndex=0;//the index of font in fontList
String selectedFile;
String selectedFileName;
String[] rawtext;//declare a String for txt file loaded
String letters;
;
int fontSizeMin = 10;
float angleDistortion = 0.0;

int counter = 0;

void settings() {
  img = loadImage("banana2.jpg");
  size(img.width, img.height);
  smooth();
}

void setup() {
  //size(1280,720);
  //String loadPath = selectInput(); //load txt file as source
  img.loadPixels();
  selectInput("Select a file to process:", "loadFile");
  surface.setTitle(name[0]);//title string
  fontList=PFont.list();//read out fonts in system

  // rawtext=loadStrings(loadPath);
  // letters=join(rawtext,""); //code cannot parsing chinese characters

  controlP5 = new ControlP5(this);
  controlP5.addSlider("TextColor-R", 0, 255, 100, palletW, palletH, 100, 14).setId(1);
  controlP5.addSlider("TextColor-G", 0, 255, 100, palletW, palletH+21, 100, 14).setId(2);
  controlP5.addSlider("TextColor-B", 0, 255, 100, palletW, palletH+42, 100, 14).setId(3);
  controlP5.addSlider("TextColor-A", 0, 255, 255, palletW, palletH+63, 100, 14).setId(4);
  controlP5.addSlider("background", 0, 255, 175, palletW, palletH+84, 100, 14).setId(5);

  background(255);//(myColorBackground);

  x = mouseX;
  y = mouseY;

  cursor(CROSS);
}

void loadFile(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    selectedFile = selection.getAbsolutePath();
    selectedFileName = selection.getName();
    rawtext = loadStrings(selectedFile);
    letters=join(rawtext, "");
  }
}

void draw() {
  myFont1=createFont(fontList[fontIndex], 160, true);//processing 1.5 is still has bug in support font antialias,
  //so preset the font size with a large size can keep the font
  //to be displayed with good look.
  myFont2=createFont("微软雅黑", 12, true);

  //draw text-strings brushs
  if (mousePressed) {
    float pressure=(abs(mouseX-pmouseX)+abs(mouseY-pmouseY))/2;
    float d = dist(x, y, mouseX, mouseY);
    textFont(myFont1, fontSizeMin+pressure);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);

    if (d > stepSize) {
      float angle = atan2(mouseY-y, mouseX-x);

      pushMatrix();
      translate(x, y);
      rotate(angle + random(angleDistortion));

      //text-strings brushs color
      if (getColorFromSourceImage) {
        color tc = img.pixels[(int)y*img.width + (int)x];
        fill(tc);
      } else {
        fill(myColorR, myColorG, myColorB, myColorA);
      }
      textAlign(LEFT);
      text(newLetter, 0, 0);
      popMatrix();

      counter++;
      if (counter > letters.length()-1) counter = 0;

      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
  }
  //display font style and other information
  noStroke();
  fill(myColorBackground);
  rectMode(CENTER);
  //rect((width+300)/2,70,(width-300),140);
  rect(width/2, 70, width, 140);

  //background color pallette
  stroke(255);
  strokeWeight(1);
  fill(myColorBackground);
  rectMode(CENTER);
  rect(125, 70, 100, 100);

  fill(myColorR, myColorG, myColorB, myColorA);//front color,front color pallette
  noStroke();
  rectMode(CENTER);
  rect(125, 70, 50, 50);

  fill(myColorR, myColorG, myColorB, myColorA);
  textFont(myFont1, 40);
  textAlign(CENTER, CENTER);
  text(fontList[fontIndex], (width+350)/2, 60);

  fill(255);
  textFont(myFont2, 12);
  textAlign(CENTER, CENTER);
  text("第 "+(fontIndex+1)+" 种字体 / 共计 "+(fontList.length)+" 种字体", (width+350)/2, 100);

  stroke(255);
  strokeWeight(2);
  line(0, 140, width, 140);
}

//background and front color pallette events: color adjustions
/**
 * [controlEvent description]
 * @Author   bit2atom
 * @DateTime 2013-08-12 T08:53:17+0800
 * @param    {[type]}                 ControlEvent theEvent      [description]
 * @return   {[type]}                              [description]
 */
public void controlEvent(ControlEvent theEvent) {
  switch(theEvent.controller().getId()) {
    case(1):
    myColorR = (int)(theEvent.controller().getValue());
    break;
    case(2):
    myColorG = (int)(theEvent.controller().getValue());
    break;
    case(3):
    myColorB = (int)(theEvent.controller().getValue());
    break;
    case(4):
    myColorA = (int)(theEvent.controller().getValue());
    break;
    case(5):
    myColorBackground = (int)(theEvent.controller().getValue());
    break;
  }
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
}

//save art works into data folder as png or pdf format
//

/**
 * [keyReleased description]
 * @Author   bit2atom
 * @DateTime 2013-08-12 08:53:06+0800
 * @return   {[type]}                 [description]
 */
void keyReleased() {
  //save png format
  if (key == 's' || key == 'S') saveFrame("draw_##.png");

  //clear canvas or make background color adjustion available
  if (key == DELETE || key == BACKSPACE) background(myColorBackground);

  // ------ pdf export ------
  // press 'r' to start pdf recordPDF and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!
  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "draw.pdf");
      println("recording started");
      recordPDF = true;
    }
  } else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
      background(myColorBackground);
    }
  }

  if (keyCode==DOWN) {
    fontIndex++;
  }
  if (keyCode==RIGHT) {
    fontIndex+=10;
  }
  if (fontIndex>fontList.length-1) {
    fontIndex=0;
  } else if (keyCode==UP) {
    fontIndex--;
  }
  if (keyCode==LEFT) {
    fontIndex-=10;
  }
  if (fontIndex<0) {
    fontIndex=fontList.length-1;
  }
  if (key == 'c') {
    getColorFromSourceImage = !getColorFromSourceImage;
  }
}

// // timestamp
// String timestamp() {
//   Calendar now = Calendar.getInstance();
//   return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
// }
