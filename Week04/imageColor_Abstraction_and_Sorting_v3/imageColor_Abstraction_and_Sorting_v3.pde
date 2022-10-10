/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2019-05-14 10:50:36
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:58:50
* @detail
*/
/**
 * RGBColorHistogram demo
 * @author Liqun Zhang based on toxi.
 * press P to select target image,
 * press S to save canvas image into png image file.
 */

import java.util.Iterator;
import java.util.Collections;

import toxi.color.*;
import toxi.math.*;

import controlP5.*;

PImage img;
PFont font;
ControlP5 bar;
ArrayList hist;

int rectLeftCorner;

int NumOfChosenColors = 15;

float colorPercentage = 0;

String imageName;

void setup() {
  font = createFont("微软雅黑", 10, true);

  selectInput("Select a image to process:", "fileSelected");
  size(1280, 720);
  //frame.setResizable(true);
  interrupt();


  noStroke();  

  bar = new ControlP5(this);
  bar.addSlider("NumOfChosenColors", 0, 20, 10, width*4/5+10, height-50, width/5-50, 40);

  // creates histogram:
  // using only half the pixels (to retrieve cols from)
  // 10% tolerance for grouping colors
  // grouped colors are blended to form an average 
  //hist=createHistogramFromImage(img.pixels, img.pixels.length, 0.1, true);
  arrayHist();
}

void draw() {  
  background(50);
  displayImage();
  displayHist();
}

void keyPressed() {
  if (key == 'p') {
    selectInput("Select a image to process:", "fileSelected");
  }
  if (key == 's') {
    save("output/"+imageName+".png");
  }
}

void arrayHist() {
  hist=createHistogramFromImage(img.pixels, img.pixels.length, 0.1, true);
}

void displayImage() {
  float imgH = img.height;
  float imgW = img.width;
  float imgRatio = imgH/imgW;

  if (imgH >= imgW) {
    float imgDisplayH = height;
    float imgDisplayW = imgDisplayH / imgRatio;    
    image(img, width*2/5-imgDisplayW/2, (height-imgDisplayH)/2, imgDisplayW, imgDisplayH);
  } else if (imgH < imgW) {
    float imgDisplayW = width*4/5;
    float imgDisplayH = imgDisplayW*imgRatio;
    image(img, width*2/5-imgDisplayW/2, (height-imgDisplayH)/2, imgDisplayW, imgDisplayH);
  }
}

void displayHist() {
  // render histogram
  colorPercentage = 0;
  float y=0;
  float h=(float)(height-90)/NumOfChosenColors;
  for (Iterator<HistEntry> i=hist.iterator(); i.hasNext() && y<height-90; ) {
    HistEntry e=i.next();
    //println(e.freq);
    color c = e.col.toARGB();
    fill(c);
    float w=e.freq*height;
    rectLeftCorner = width*4/5;
    rect(rectLeftCorner+70, y, w, h);
    int r = (int)red(c);
    int g = (int)green(c);
    int b = (int)blue(c);
    textFont(font);
    fill(150);
    text("Red: "+r, rectLeftCorner+10, y+20);
    text("Green: "+g, rectLeftCorner+10, y+30);
    text("Blue: "+b, rectLeftCorner+10, y+40);
    y+=h;
    colorPercentage += e.freq*100;
  }
  textFont(font, 16);
  text("主色调占画面比例: "+colorPercentage+"%", rectLeftCorner+10, height-60);
}

void fileSelected(File selection) {
  img = loadImage(selection.getAbsolutePath());
  imageName = selection.getName();
  //println("Selection: "+selection.getName());
  arrayHist();
}

void interrupt() {
  while (img == null) {
    noLoop();
  }
  loop();
}

/**
 * @param img
 *    pixel array to create histogram for
 * @param numSamples
 *    number pixels to be sampled in image
 * @param tolerance
 *    color tolerance used to merge similar colors
 *    (based on RGB distance)
 * @param blendCols
 *    switch to enable color blending of binned colors
 * @return sorted histogram as ArrayList
 */
ArrayList createHistogramFromImage(int[] img, int numSamples, float tolerance, boolean blendCols) {
  ColorList srcCols=ColorList.createFromARGBArray(img, numSamples, false);
  ArrayList hist=new ArrayList();
  float maxFreq=1;
  for (Iterator<TColor> i=srcCols.iterator(); i.hasNext(); ) {
    TColor c=i.next();
    HistEntry existing=null;
    for (Iterator<HistEntry> j=hist.iterator(); j.hasNext(); ) {
      HistEntry e=j.next();
      if (e.col.distanceToRGB(c)<tolerance) {
        if (blendCols) e.col.blend(c, 1f/(e.freq+1));
        existing=e;
        break;
      }
    }
    if (existing!=null) {
      existing.freq++;
      if (existing.freq>maxFreq) maxFreq=existing.freq;
    } else {
      hist.add(new HistEntry(c));
    }
  }
  Collections.sort(hist);
  // rescale frequencies
  maxFreq=1f/srcCols.size();
  for (Iterator i=hist.iterator(); i.hasNext(); ) {
    HistEntry e=(HistEntry)i.next();
    e.freq*=maxFreq;
  }
  return hist;
}

/**
 * A single histogram entry, a coupling of color & frequency
 * Implements a comparator to sort histogram entries based on freq.
 */

class HistEntry implements Comparable {
  float freq;
  TColor col;

  HistEntry(TColor c) {
    col=c;
    freq=1;
  }

  int compareTo(Object e) {
    return -(int)(freq-((HistEntry)e).freq);
  }

  public String toString() {
    return col.toHex()+": "+freq;
  }
}
