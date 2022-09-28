## processing如何输出gif动图. 

1-下载Gifsicle：  
http://www.lcdf.org/gifsicle/. 

Windows版本快捷地址：  
https://eternallybored.org/misc/gifsicle/  

Gifsicle is a command-line tool for creating, editing, and getting information about GIF images and animations. Making a GIF animation with gifsicle is easy:
```
gifsicle --delay=10 --loop *.gif > anim.gif
```
Extracting frames from animations is easy too:
```
gifsicle anim.gif '#0' > firstframe.gif
```
You can also edit animations by replacing, deleting, or inserting frames:
```
gifsicle -b anim.gif --replace '#0' new.gif
```

2-在processing中将图像输出为gif序列：
```
int frames = 20;
int framesToSave = 0;
PGraphics pg[] = new PGraphics[frames];

void setup() {
  size(500, 500);
  prepareGraphics();
}
void draw() {
  int currFrame = frameCount % frames; // 0 .. 19
  if (mousePressed) {
    pg[currFrame].beginDraw();
    pg[currFrame].line(mouseX, mouseY, pmouseX, pmouseY);
    pg[currFrame].endDraw();
  }
  image(pg[currFrame], 0, 0);
  if (framesToSave > 0) {
    saveFrame("loop####.gif");
    framesToSave--;
  }
}
void keyPressed() {
  if (key == 's') {
    framesToSave = frames;
  }
  if (key == ' ') {
    prepareGraphics();
  }
}
void prepareGraphics() {
  for (int i=0; i<frames; i++) {
    pg[i] = createGraphics(width, height);
    pg[i].beginDraw();
    pg[i].background(0);
    pg[i].stroke(255);
    pg[i].strokeWeight(3);
    pg[i].endDraw();
  }
}
```

3-运行得到gif序列图像。  
4-通过命令行进入gif序列图像所在文件夹，在命令行执行如下命令：
```
gifsicle --delay=10 --loop *.gif > anim.gif
```

本例中，根据实际情况，命令行的内容如下：
```
C:\Program Files\gifsicle-1.92>gifsicle --delay=10 --loop D:\your sketch file folder address\theme_export\exportGIFs\loop\*.gif > animTestLoop.gif
```
其中：  
--delay=10用来配置每个帧停留的时常；  

--loop用来配置输出的gif动图自动循环播放. 

D:\your sketch file folder address\theme_export\exportGIFs\loop\*.gif是gif序列图像所在的文件夹地址；  

animTestLoop.gif用于命名输出的gif动图的文件名。  


即可得到名为animTestLoop.gif的动图。  
![输出gif](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/HowTos/mediaSource/animTestLoop.gif)
