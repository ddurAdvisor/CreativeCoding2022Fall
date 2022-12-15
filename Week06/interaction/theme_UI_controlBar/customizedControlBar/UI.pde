///////////////UI Settings//////////////////
import controlP5.*;
ControlP5 bar;
Slider2D s;
PImage img;

int topSideMargin = 150;
int leftCornerMargin = 10;
int canvasLeftCornerX = 20;
int canvasLeftCornerY = 20;
int sliderLength = 200;
int sliderHeight = 30;
int sliderInterval = sliderHeight + 10;

color backgroundColor = color(255, 255, 255);
color back = color(37, 37, 37, 38);
color deepDark = color(80, 80, 80, 80);
color textLightBlue = color(85, 171, 242);
color textLightOrange = color(247, 140, 4);
///////////////UI Settings//////////////////

void UI() {
  img = loadImage("kim-5.jpg");
  bar = new ControlP5(this, createFont("微软雅黑", 14))
    .setColorForeground(textLightBlue)
    .setColorBackground(deepDark)
    .setColorActive(textLightOrange)
    .setColorCaptionLabel(50)
    .setColorValueLabel(255);
  bar.addSlider("twistIndex", 0, 5, 0, canvasLeftCornerX, canvasLeftCornerY + topSideMargin * 2 + sliderInterval, sliderLength, sliderHeight).setLabel("环体扭曲");
  bar.addSlider("sectionRadius", 0, 50, 20, canvasLeftCornerX, canvasLeftCornerY + topSideMargin * 2 + sliderInterval*2, sliderLength, sliderHeight).setLabel("环体截面半径");
  bar.addSlider("sectionRadiusRange", 0, 500, 50, canvasLeftCornerX, canvasLeftCornerY+topSideMargin * 2+sliderInterval*3, sliderLength, sliderHeight).setLabel("断面半径波动");
  bar.addSlider("sectionRadiusPhase", 0, PI*8, TWO_PI, canvasLeftCornerX, canvasLeftCornerY+topSideMargin * 2+sliderInterval*4, sliderLength, sliderHeight).setLabel("柱体半径相变");
  bar.addSlider("twistPhase", -TWO_PI, TWO_PI, PI*2/3, canvasLeftCornerX, canvasLeftCornerY+topSideMargin * 2+sliderInterval*5, sliderLength, sliderHeight).setLabel("柱体扭曲相变");
  bar.addSlider("twistPhaseStart", -TWO_PI, TWO_PI, TWO_PI, canvasLeftCornerX, canvasLeftCornerY+topSideMargin * 2+sliderInterval*6, sliderLength, sliderHeight).setLabel("柱体扭曲相变起始值");
  s = bar.addSlider2D("wave")
         .setPosition(width-30-400,40)
         .setSize(400,400)
         .setMinMax(0,0,100,100)
         .setValue(50,50)
         //.disableCrosshair()
         ;
         
  bar.setAutoDraw(false);
}
