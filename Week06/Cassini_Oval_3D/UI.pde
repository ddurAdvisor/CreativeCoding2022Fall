void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 12));
  //bar.addSlider("aValue", 0, 1, 0.5, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("A值");
  //bar.addSlider("bValue", 1, 2, 1, canvasLeftCornerX, canvasLeftCornerY + barInterval, barSize, barHeight).setLabel("B值");

  bar.addSlider("blobbiesA", 0, 1, 0.3, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("A值");
  bar.addSlider("blobbiesB", 0, 1, 0.6, canvasLeftCornerX, canvasLeftCornerY + barInterval, barSize, barHeight).setLabel("B值");
  bar.addSlider("coe", 0, 1, 0.66, canvasLeftCornerX, canvasLeftCornerY + barInterval * 2, barSize, barHeight).setLabel("coe值");

  bar.addSlider("phase1", -PI, PI, 0, canvasLeftCornerX, canvasLeftCornerY + barInterval * 4, barSize, barHeight).setLabel("相位A值");
  bar.addSlider("phase2", -PI, PI, 0, canvasLeftCornerX, canvasLeftCornerY + barInterval * 5, barSize, barHeight).setLabel("相位B值");

  bar.addSlider("scaleIndex", 1, 500, 100, canvasLeftCornerX, canvasLeftCornerY + barInterval * 6, barSize, barHeight).setLabel("放大系数");
  bar.addSlider("sectionNum", 10, 500, 300, canvasLeftCornerX, canvasLeftCornerY + barInterval * 7, barSize, barHeight).setLabel("细分系数");
  bar.addSlider("heightSection", 10, 500, 100, canvasLeftCornerX, canvasLeftCornerY + barInterval * 8, barSize, barHeight).setLabel("高度细分系数");
  
  bar.addSlider("kMin", 0, heightSection, 30, canvasLeftCornerX, canvasLeftCornerY + barInterval * 10, barSize, barHeight).setLabel("kMin");
  bar.addSlider("kMax", 0, heightSection, heightSection-30, canvasLeftCornerX, canvasLeftCornerY + barInterval * 11, barSize, barHeight).setLabel("kMax");

  bar.setAutoDraw(false);
}
