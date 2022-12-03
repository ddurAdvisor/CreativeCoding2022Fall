Week04: Image and Pixel process



## Font and Text
- PFont.list()
- createFont()
- textFont()
- fontSize()
- textAlign()
- text()

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/loopSerialFontSelection.png)
``` java
String fontName = PFont.list()[index];
//println(fontName);
textFont(createFont(fontName, 32));
fill(random(255), random(255), random(255));
text("Hello World!", width/2, height/2);
    
index ++;
    
index = index % PFont.list().length;
```
- [完整的源程序：loopSerialFontSelection](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/loopSerialFontSelection)


## image load, access and creation

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_01_image.png)
- 控制几何对象分布
- 几何对象基于其定位点坐标从参考图像中获取填充颜色
``` java
for (int i = 0; i< 50; i ++) {
    int xx = (int)random(width);
    int yy = (int)random(height);
    color fc = img.get(xx, yy);
    fill(fc);
    noStroke();
    rotate(random(TWO_PI));
    rect(xx, yy, 5, 50);
  }
```
- [完整的源程序：bit2atom_20211018_01_image](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_01_image)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_02_image.png)
- 随机分布几何对象
- 几何对象基于其定位点坐标从参考图像中获取填充颜色
```java
for (int i = 0; i< 50; i ++) {
    int xx = (int)random(width);
    int yy = (int)random(height);
    color fc = img.get(xx, yy);
    fill(fc);
    noStroke();
    //rotate(random(TWO_PI));
    rect(xx, yy, 20, 20);
  }
```

- [完整的源程序：bit2atom_20211018_02_image](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_02_image)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_03_image.png)
- 创建图像对象
```java
PImage img;
......
img = createImage(width, height, RGB);
```
- 为图像对象赋予颜色值
```java
img.loadPixels();
......
for (int i = 0; i < width; i ++) {
    for (int j = 0; j < height; j ++) {
      if (i > width/3 && i < width/2 && j > height/3 && j < height/2) {
        img.pixels[i+j*width] = color(255, 255, 0);
      } else {
        img.pixels[i+j*width] = color(255, 255, 255);
      }
    }
    img.updatePixels();
  }
```
- [完整的源程序：bit2atom_20211018_03_image](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_03_image)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_05_image.png)
- 利用模数创建棋盘格图像颜色生成函数
```java
void fillBlock(int x, int y, int size) {
  for (int i = 0; i < size; i ++) {
    for (int j = 0; j < size; j ++) {
      int loc = (x*size + i) + (y*size + j)* width;
      if (x%2 == y%2) {
        img.pixels[loc] = color(255, 255, 255);
      } else {
        img.pixels[loc] = color(0, 0, 0);
      }
    }
  }
}
```

- [完整的源程序：bit2atom_20211018_05_image](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_05_image)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/bit2atom_20211018_06_image.png)
- 对指定像素区间进行色彩归纳
```java
void fillBlock(int x, int y, int size) {
  int rr = 0;
  int gg = 0;
  int bb = 0;
  color blockColr;

  for (int i = 0; i < size; i ++) {
    for (int j = 0; j < size; j ++) {
      int loc = (x*size + i) + (y*size + j)* width;
      rr += red(reference.pixels[loc]);
      gg += green(reference.pixels[loc]);
      bb += blue(reference.pixels[loc]);
    }
  }
  
  blockColr = color(rr/(size*size), gg/(size*size), bb/(size*size));

  for (int i = 0; i < size; i ++) {
    for (int j = 0; j < size; j ++) {
      int loc = (x*size + i) + (y*size + j)* width;
      img.pixels[loc] = blockColr;
    }
  }
}
```
- [完整的源程序：bit2atom_20211018_06_image.png)](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/bit2atom_20211018_06_image)




## image process

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_01_pimage.png)
- 图像的读入与现实
```java
img = loadImage("gate.png");
image(img, 0, 0, width, height);
```
- [完整的源程序：image_01_pimage](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_01_pimage)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_02_tint.png)
- 使用tint()改变图像色调
```java
img = loadImage("gate.png");
tint(255, 0, 0);
image(img, 0, 0, width, height);
```
- [完整的源程序：image_02_tint](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_02_tint)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_03_notint.png)
- 对比tint()与否的差异
```java
img = loadImage("gate.png");
tint(255, 0, 0);
image(img, 0, 0, width, height);
noTint();
image(img, width/2, 0, width, height);
```
- [完整的源程序：image_03_notint](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_03_notint)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_04_img_sequence.png)
- 读取图像序列
```java
int numFrames = 6;
int frame = 0;
PImage[] images = new PImage[numFrames];
...
images[0] = loadImage("dove01.png");
images[1] = loadImage("dove02.png");
images[2] = loadImage("dove03.png");
images[3] = loadImage("dove04.png");
images[4] = loadImage("dove05.png");
images[5] = loadImage("dove06.png");
```
- 显示图像序列，图像位置跟随鼠标X值而变化
```java
frame++;
if (frame == numFrames) {
    frame = 0;
}
image(images[frame], mouseX - 75, mouseY - 108);
```
- [完整的源程序：image_04_img_sequence](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_04_img_sequence)

![image_04_img_sequence_highway_2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_04_img_sequence_highway_2.png)
- 用图像序列数影响图像的显示位置
```java
frame = int(map(count, 0, width, 0, 224));
  //frame++;

  image(images[frame], count - images[frame].width/2, 600 - images[frame].height/2);
  count ++;
  if (count > width) {
    count = 0;
  }
```
- [完整的源程序：image_04_img_sequence_highway_2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_04_img_sequence_highway_2)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_05_get.png)
- 通过get()获取图像的像素值
```java
color c = get(x, y);
fill(c);
ellipse(x, y, 100, 100);
```
- [完整的源程序：image_05_get](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_05_get)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_06_get_pointilism.png)
- 模拟点彩效果
```java
x = round(random(width));
y = round(random(height));
color c = img.get(x, y);
fill(c, 70);
ellipse(x, y, 30, 30);
```
- [完整的源程序：image_06_get_pointilism](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_06_get_pointillism)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_07_get_pixels.png)
- 色彩采样
```java
s = map(mouseX, 0, width, 1, 100);
for (int y = 0; y < img.height; y+=s ) {
    for (int x = 0; x < img.width; x+=s) {
      int loc = x + (y * img.width);
      fill(img.pixels[loc]);
      rect(x, y, s, s);
    }
}
```
- [完整的源程序：image_07_get_pixels](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_07_get_pixels)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_09_blend_shape.png)
- blend()形状
```java
img = loadImage("gate.png");
// ADD, SUBTRACT, LIGHTEST, DARKEST, MULTIPLY
fill(0);
ellipse(width/2, height/2, 300, 300);
blend(img, 0, 0, width, height, 0, 0, width, height, ADD);
```
- [完整的源程序：image_09_blend_shape](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_09_blend_shape)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_108_filter.png)
- 各种特征的filter()
```java
float l = map(mouseX, 0, width, 0, 20);
// BLUR, POSTERIZE, THRESHOLD, INVERT, GRAY, ERODE, DILATE
filter(BLUR, l);
```
- [完整的源程序：image_108_filter](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_08_filter)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_10_blend_images.png)
- 图像融合
```java
img1 = loadImage("gate.png");
img2 = loadImage("hibiscus.jpg");
// ADD, SUBTRACT, LIGHTEST, DARKEST, MULTIPLY
img1.blend(img2, 0, 0, width, height, 0, 0, width, height, ADD);
image(img1, 0, 0);
```
- [完整的源程序：image_10_blend_images](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_10_blend_images)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_11_masking.png)
- 图像遮罩
```java
img = loadImage("gate.png");
maskImg = loadImage("mask.jpg");
img.mask(maskImg);
image(img, 0, 0);
```
- [完整的源程序：image_11_masking](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_11_masking)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/image_12_rgb.png)
- 像素操作
```java
PImage img, maskImg;
......
img = loadImage("gate.png");
maskImg = loadImage("mask.jpg");
img.mask(maskImg);
image(img, 0, 0);
```
- [完整的源程序：image_12_rgb](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/image_12_rgb)



## pixel process

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/crystalPixels.png)
- 色彩概括：提取单元格的定位点对应的图像像素值
```java
void drawGrid() {
  for (int i = 0; i < xDiv; i ++) {
    for (int j = 0; j < yDiv; j ++) {
      color c = img.get(blockSize*(i+1/2), blockSize*(j+1/2));
      //rectMode(CENTER);
      fill(c);
      noStroke();
      rect(blockSize*i, blockSize*j, blockSize, blockSize);
    }
  }
}
```
- [完整的源程序：crystalPixels](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/crystalPixels)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/crystalPixels_v2.png)
- 色彩概括：提取单元格中所有的像素点的像素值后通过算术平均产生单元格颜色值
```java
void drawGrid() {
  int pxlength = blockSize * blockSize;
  for (int i = 0; i < xDiv; i ++) {
    for (int j = 0; j < yDiv; j ++) {
      color cc = 0;
      float rr = 0;
      float gg = 0;
      float bb = 0;

      for (int m = 0; m < blockSize; m ++) {
        for (int n = 0; n < blockSize; n ++) {
          rr += red(img.get(blockSize*i+m, blockSize*j+n));
          gg += green(img.get(blockSize*i+m, blockSize*j+n));
          bb += blue(img.get(blockSize*i+m, blockSize*j+n));
        }
      }
      cc = color(rr/pxlength, gg/pxlength, bb/pxlength);

      //color c = img.get(width/xDiv*2*(i+1/2), height/yDiv*2*(j+1/2));
      //rectMode(CENTER);
      fill(cc);
      noStroke();
      rect(blockSize*i, blockSize*j, blockSize, blockSize);
    }
  }
}
```
- [完整的源程序：crystalPixels_v2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/crystalPixels_v2)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/imageColor_Abstraction_and_Sorting_v3.png)
- Histogram生成色彩直方图
```java
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
```
- [完整的源程序：imageColor_Abstraction_and_Sorting_v3](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/imageColor_Abstraction_and_Sorting_v3)



## pixel process and creative presentation A

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/HodgingFiguration.png)
- 绘制形状的大小与形状坐标点对应的参考图像的像素值成正比
```java
void asBrightasBig() {
    pixID = floor(pos.x) + floor(pos.y) * width;
    if (pixID >= 0 && pixID < width * height) {
      bright = brightness(color(img.pixels[pixID]));
      rad = 2 * (9 * bright /255);
      //col = color(255);
    }
}
```
- 形状粒子的动态行为控制
```java
void checkOther() {
    for (int i = 0; i < agentList.size(); i ++) {
      Agent other = (Agent)agentList.get(i);
      agentDist = dist(pos.x, pos.y, other.pos.x, other.pos.y);
      offset = 2+(rad + other.rad)/2;
      if (agentDist != 0) {
        if (agentDist == offset) {
          speed.set(0, 0);
          other.speed.set(0, 0);
          alive = false;
        }
        else if(agentDist < offset){
          diff = PVector.sub(pos, other.pos);
          center = PVector.add(pos, other.pos);//center
          center.div(2);
          diff.normalize();
          pos = PVector.add(center, PVector.mult(diff, offset/2));
          speed.set(0, 0);
          other.speed.set(0, 0);
          if(agentDist < offset - 1 ){
          col = color(230);
          }
        }
        else{
          col = color(255);
        }
      }
    }
    //  else {
    //  speed.x *= -1;
    //  speed.y *= -1;
    //}
}
```
- [完整的源程序：HodgingFiguration](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/HodginFiguration)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/particleScattering_portrait_v32b.png)
- 粒子交互动态控制
```java
/**
   * [update description]
   * @Author   bit2atom
   * @DateTime 2014-01-02 T08:55:46+0800
   * @param    {[type]}                 PImage pattern       [description]
   * @return   {[type]}                        [description]
   */
  void update(PImage pattern) {
    vel.add(acc);

    float maxVel = r+0.0025;
    float velLength = sq(vel.mag())+0.1;
    if (velLength>sq(maxVel)) {
      vel.normalize();
      vel.mult(maxVel);
    }

    loc.add(vel);
    vel.mult(decay);
    acc.set(0, 0, 0);

    if (loc.x>0 && loc.x<width-1 && loc.y>0 && loc.y<height-1) {
      int index = floor(loc.x) + floor(loc.y)*pattern.width;
      pcColor = color(pattern.pixels[index]);
      rDest = brightness(pattern.pixels[index])/float(255)*3+0.5;
    }
    else {
      rDest = 0.1;
    }

    r = lerp(r, rDest, 0.1);
    mass = sq(r)*0.0001+0.01;
  }
```
- [完整的源程序：particleScattering_portrait_v32b](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/particleScattering_Portrait_v32b)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/textDrawArtTool.png)
- 从文本中获取字符并随绘制轨迹进行定位显示
- 文字颜色通过调色盘/通过参考图中对应的像素颜色获取
```java
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
```
- [完整的源程序：textDrawArtTool](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/TextDraw_Alpha05_FontFree_NewInterface_LiqunZhang)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/pix2patterns.png)
```java
/*
every pattern must return an ArrayList of ArrayLists of Dots
one List of Dots is one line, the List of Lists is all the lines
every Dot's "drilled" attribute must be set to true, if the depth (d.z)
is above the threshold
*/


//orthogonal grid
// o o o o
// o o o o
// o o o o

/**
 * [getOrthoGrid description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:46:56+0800
 * @param    {[type]}                 PGraphics pg            [description]
 * @param    {[type]}                 float     step          [description]
 * @return   {[type]}                           [description]
 */
ArrayList<ArrayList<Dot>> getOrthoGrid(PGraphics pg, float step) {
  int nx = floor(outW/step);
  int ny = floor(outH/step);
  float offx = (outW-((nx-1)*step))/2f;
  float offy = (outH-((ny-1)*step))/2f;

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();

  for (int y=0; y<ny; y++) {
    ArrayList<Dot> tmpDts = new ArrayList<Dot>();
    for (int x=0; x<nx; x++) {
      PImage temp = pg.get(round(x*step), round(y*step), round(step), round(step));
      float val = luminosityAverage(temp);
      val = level(val);
      //float dim = (1-val) * bitDim;

      Dot d = new Dot(offx+x*step, offy+y*step, 1-val);
      tmpDts.add(d);
      if (d.z>threshold) d.drilled = true;
    }
    out.add(tmpDts);
  }
  return out;
}

//honeycomb grid
// o o o o
//  o o o
// o o o o
/**
 * [getHoneyGrid description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:47:24+0800
 * @param    {[type]}                 PGraphics pg            [description]
 * @param    {[type]}                 float     step          [description]
 * @return   {[type]}                           [description]
 */
ArrayList<ArrayList<Dot>> getHoneyGrid(PGraphics pg, float step) {
  float rt3 = sqrt(3.0);
  int nx = floor(outW/step);
  int ny = floor(outH/(step/2*rt3));
  // ny = floor(outH/step);

  float offx = (outW-((nx-1)*step))/2f;
  float offy = (outH-((ny-1)*(step/2*rt3)))/2f;
  //offy = offx;

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();
  boolean pnd = false;
  for (int y=0; y<ny; y++) {
    ArrayList<Dot> tmpDts = new ArrayList<Dot>();
    for (int x=0; x<(pnd?(nx-1):nx); x++) {
      float cx = x*step;
      if (pnd) cx += step/2.0;
      float cy = y*step/2*rt3;

      PImage temp = pg.get(round(cx), round(cy), round(step), round(step));
      float val = luminosityAverage(temp);
      val = level(val);
      //float dim = (1-val) * bitDim;

      Dot d = new Dot(offx+cx, offy+cy, 1-val);
      tmpDts.add(d);
      if (d.z>threshold) d.drilled = true;
    }
    pnd = !pnd;
    out.add(tmpDts);
  }
  return out;
}

//co-centric circles / spiral
/**
 * [getPolarGrid description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:47:39+0800
 * @param    {[type]}                 PGraphics pg            [description]
 * @param    {[type]}                 float     step          [description]
 * @return   {[type]}                           [description]
 */
ArrayList<ArrayList<Dot>> getPolarGrid(PGraphics pg, float step) {
  float cx = centerX;
  float cy = centerY;
  float dx = max(cx,outW-cx);
  float dy = max(cy,outH-cy);
  int numCirc = round(sqrt(sq(dx)+sq(dy))/step);

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();
  
  for (int j=0; j<numCirc; j++) {
    float rad = j*step;
    int numRays = max(10,round(rad*TWO_PI/step));
    ArrayList<Dot> tmpDts = new ArrayList<Dot>();
    float a = 0;
    float mrg = step/2.0;
    
    for (int i=0; i<numRays+1; i++) {
      float x = cx + rad * cos(a);
      float y = cy + rad * sin(a);
      if (x>mrg && x<outW-mrg && y>mrg && y<outH-mrg) {
        PImage temp = pg.get(round(x-mrg), round(y-mrg), round(step), round(step));
        float val = luminosityAverage(temp);
        val = level(val);
        Dot d = new Dot(x,y,1-val);
        tmpDts.add(d);
        if (d.z>threshold) d.drilled = true;
      } else {
        if (tmpDts.size()>0) out.add(tmpDts);
        tmpDts = new ArrayList<Dot>();
      }
      a += TWO_PI/numRays;
    }
    
    if (tmpDts.size()>0) out.add(tmpDts);
  }

  return out;
}

//co-centric circles / spiral
/**
 * [getSpiralGrid description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:47:52+0800
 * @param    {[type]}                 PGraphics pg            [description]
 * @param    {[type]}                 float     step          [description]
 * @return   {[type]}                           [description]
 */
ArrayList<ArrayList<Dot>> getSpiralGrid(PGraphics pg, float step) {
  float cx = centerX;
  float cy = centerY;
  float dx = max(cx,outW-cx);
  float dy = max(cy,outH-cy);
  int numCirc = round(sqrt(sq(dx)+sq(dy))/step);

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();
  
  for (int j=0; j<numCirc; j++) {
    float rad = j*step;
    int numRays = max(10,round(rad*TWO_PI/step));
    ArrayList<Dot> tmpDts = new ArrayList<Dot>();
    float a = 0;
    float mrg = step/2.0;
    
    for (int i=0; i<numRays+1; i++) {
      float delta=float(i)/numRays * step;
      float x = cx + (rad+delta) * cos(a);
      float y = cy + (rad+delta) * sin(a);
      if (x>mrg && x<outW-mrg && y>mrg && y<outH-mrg) {
        PImage temp = pg.get(round(x-mrg), round(y-mrg), round(step), round(step));
        float val = luminosityAverage(temp);
        val = level(val);
        Dot d = new Dot(x,y,1-val);
        tmpDts.add(d);
        if (d.z>threshold) d.drilled = true;
      } else {
        if (tmpDts.size()>0) out.add(tmpDts);
        tmpDts = new ArrayList<Dot>();
      }
      a += TWO_PI/numRays;
    }
    
    if (tmpDts.size()>0) out.add(tmpDts);
  }

  return out;
}
```
- [完整的源程序：pix2patterns](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/pix2Patterns)



## pixel process and creative presentation B: from pixles to vectors

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/paintingWithFlowField.png)
- flowfield生成
```java
void move() {
    float angle = noise(pos.x * noisePower, pos.y * noisePower) * TAU;
    vel.set(cos(angle), sin(angle));
    vel.mult(0.3);
    pos.add(vel);
}
```
- [完整的源程序：paintingWithFlowField](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/paintingWithFlowField)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/noiseBrushStyle2.png)
- 将彩色图像转为灰度图像
```java
// returns a greyscale value from image at given location
// retrun value is scaled between 0 and 1
/**
 * [get_grey_from_image description]
 * @Author   bit2atom
 * @DateTime 2020-12-06 T09:03:22+0800
 * @param    {[type]}                 PImage im            [description]
 * @param    {[type]}                 int    x             [description]
 * @param    {[type]}                 int    y             [description]
 * @return   {[type]}                        [description]
 */
float get_grey_from_image(PImage im, int x, int y) {
  // red value
  float r = red(im.pixels[x + y*im.width]);
  // green
  float g = green(im.pixels[x + y*im.width]);
  // blue
  float b = blue(im.pixels[x + y*im.width]);

  // use luminosity weighted average
  // https://www.johndcook.com/blog/2009/08/24/algorithms-convert-color-grayscale/
  float luminosity = (0.21*r + 0.72*g + 0.07*b) / 255.0;
  return luminosity;
}
```
- flowfield控制
```java
/**
   * [for description]
   * @Author   bit2atom
   * @DateTime 2020-12-06 T09:03:55+0800
   * @param    {[type]}                 int p             [description]
   * @return   {[type]}                     [description]
   */
  for (int p = 0; p < sampleNum; p += 1) {
    x = random(img.width);
    y = random(img.height);
    for (int k = 0; k < singleLineLength; k ++) {

      //point(x, y);
      float x1 = x + width/2 - img.width/2;
      float y1 = y + height/2 - img.height/2;
      float x2 = x1 + segmentLength*(noise(x/noiseDivideIndex, y/noiseDivideIndex)-0.5);
      float y2 = y1 + segmentLength*(noise(y/noiseDivideIndex, x/noiseDivideIndex)-0.5);

      // read pixel value
      float lum = brightness(img.get(int(x), int(y)))/255;//get_grey_from_image(img, int(x), int(y));
      if (lum < lineWeightThrehold) {
        // stroke depends on luminosity
        strokeWeight(map(lum, 0, lineWeightThrehold, 2, 0.1));

        //paint
        //stroke(0, 0, 0, map(lum, 0, 1, 100, 10));

        stroke(0);

        strokeWeight(1);
        line(x1, y1, x2, y2);
        countNumOfLines++;
      }

      x = x2;
      y = y2;
    }
  }
  if (savePDF == true) {
    endRecord();
    savePDF = false;
  }
  println("countNumOfLines: "+countNumOfLines);
  noLoop();
}
```
- [完整的源程序：noiseBrushStyle2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/noiseBrushStyle2)


![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/filter_convolution.png)
- convolution kernal

```java
/ The convolution matrix for a "sharpen" effect stored as a 3 x 3 two-dimensional array.
float[][] matrix = { { -1, -1, -1 } , 
                     { -1, 9, -1 } ,
                     { -1, -1, -1 } } ;
```

```java
/ The convolution matrix for a "blur" effect stored as a 3 x 3 two-dimensional array.
float[][] matrix = { { 0.125, 0.25, 0.125 } , 
                     { 0.25,  0.5,  0.25 } ,
                     { 0.125, 0.25, 0.125 } } ;
```

```java
color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  
  // Loop through convolution matrix
  for (int i = 0; i < matrixsize; i++ ) {
    for (int j = 0; j < matrixsize; j++ ) {
      
      // What pixel are we testing
      int xloc = x + i-offset;
      int yloc = y + j-offset;
      int loc = xloc + img.width*yloc;
      
      // Make sure we haven't walked off the edge of the pixel array
      // It is often good when looking at neighboring pixels to make sure we have not gone off the edge of the pixel array by accident.
      loc = constrain(loc,0,img.pixels.length-1);
      
      // Calculate the convolution
      // We sum all the neighboring pixels multiplied by the values in the convolution matrix.
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  
  // Make sure RGB is within range
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  
  // Return the resulting color
  return color(rtotal,gtotal,btotal); 
}
```
- [完整的源程序：filter_convolution](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/filter_convolution)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/filter_edgeDetect.png)
- 将彩色图像转为灰度图像
```java
```
- [完整的源程序：filter_edgeDetect](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/filter_edgeDetect)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/filter_laplacianOperator3-1.png)
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/filter_laplacianOperator3-2.png)
- 将彩色图像转为灰度图像
```java
```
- [完整的源程序：filter_laplacianOperator3](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/filter_laplacianOperator3)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/filter_kuwaharaFilter_calculateRGBChannels.png)
- calculate Mean And Variance
```java
void calculateMeanAndVariance(int i, int j) {
  float meanRed = 0;
  float meanGreen = 0;
  float meanBLue = 0;

  //int meanColor = 0;

  float variance = 0;

  float[][] meanAndVariance = new float[4][4];

  int stepX = floor(kernalXSize/2);
  int stepY = floor(kernalYSize/2);

  for (int m = 0; m < 2; m ++) {
    for (int n = 0; n < 2; n ++) {
      int xLeft = i + stepX * (m-1);
      int xRight = i + stepX * m;
      int yTop = j + stepY * (n-1);
      int yBottom = j + stepY * n;

      //calculate Mean
      for (int ii = xLeft; ii <= xRight; ii ++) {
        for (int jj = yTop; jj <= yBottom; jj ++) {
          int loc = jj * sourceImage.width + ii;
          meanRed += red(sourceImage.pixels[loc]);
          meanGreen += green(sourceImage.pixels[loc]);
          meanBLue += blue(sourceImage.pixels[loc]);

          //meanColor += sourceImage.pixels[loc];
        }
      }
      meanRed /= ((xRight-xLeft+1)*(yBottom-yTop+1));
      meanGreen /= ((xRight-xLeft+1)*(yBottom-yTop+1));
      meanBLue /= ((xRight-xLeft+1)*(yBottom-yTop+1));

      //meanColor /= ((xRight-xLeft+1)*(yBottom-yTop+1));

      //calculate Variance
      //Variance = \frac {\sum x^2}{samples} - mean^2
      for (int ii = xLeft; ii <= xRight; ii ++) {
        for (int jj = yTop; jj <= yBottom; jj ++) {
          int loc = jj * sourceImage.width + ii;
          variance += (red(sourceImage.pixels[loc]) - meanRed) * (red(sourceImage.pixels[loc]) - meanRed)
            + (green(sourceImage.pixels[loc]) - meanRed) * (green(sourceImage.pixels[loc]) - meanGreen)
            + (blue(sourceImage.pixels[loc]) - meanRed) * (blue(sourceImage.pixels[loc]) - meanBLue);
          //variance += (sourceImage.pixels[loc] - meanColor) * (sourceImage.pixels[loc] - meanColor);
        }
      }
      variance /= ((xRight-xLeft+1)*(yBottom-yTop+1));

      meanAndVariance[m+n*2][0] = meanRed;
      meanAndVariance[m+n*2][1] = meanGreen;
      meanAndVariance[m+n*2][2] = meanBLue;
      meanAndVariance[m+n*2][3] = variance;
    }
  }

  //get pixle[i,j] value
  float minVariance = 100000;
  int minVarianceIndex = -1;
  for (int k = 0; k < meanAndVariance.length; k ++) {
    if (meanAndVariance[k][3] < minVariance) {
      minVariance = meanAndVariance[k][3];
      minVarianceIndex = k;
    }
  }

  if (minVarianceIndex > -1) {
    int loc = i + j * sourceImage.width;
    processedImage.pixels[loc] = color(meanAndVariance[minVarianceIndex][0],
      meanAndVariance[minVarianceIndex][1],
      meanAndVariance[minVarianceIndex][2]);
  }
}
```
- [完整的源程序：filter_kuwaharaFilter_calculateRGBChannels](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week04/filter_kuwaharaFilter_calculateRGBChannels)

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/filter_kuwahara_mountainAndLake%20(Kuwahara).png)
- filter_kuwahara_mountainScene.  

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/filter_kuwahara_portrait800990%20(Kuwahara).png)
- filter_kuwahara_portrait_p1.  

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week04/sourceImage/filter_kuwahara_portrait_redCurls2%20(Kuwahara).png)
- filter_kuwahara_portrait_p2. 
