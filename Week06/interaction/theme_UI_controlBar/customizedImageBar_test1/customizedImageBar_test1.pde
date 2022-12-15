/*
controlP5.Controller : Slider setImages(PImage, PImage, PImage, PImage) 
 public T setImages(processing.core.PImage theImageDefault,
 processing.core.PImage theImageOver,
 processing.core.PImage theImageActive,
 processing.core.PImage theImageHighlight)
 */

import controlP5.*;

ControlP5 bar;

void setup() {
    size(700, 400);
    noStroke();
}

void UI() {
    bar = new ControlP5(this);
    bar.addSlider("sliderValue")
        .setPosition(100, 50)
        .setSize(300, 30)
        .setRange(0, 255)
        .setValue(100)
        .setImages(loadImage(""), loadImage(""));//, loadImage(""), loadImage(""))
        .setLabel("testBar");
}

void draw(){
    background(51);
}