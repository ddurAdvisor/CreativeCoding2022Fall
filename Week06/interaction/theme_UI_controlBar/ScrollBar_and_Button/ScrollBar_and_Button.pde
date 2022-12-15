ScrollBar sbar1,sbar2;

Button bt;
float eSize;
float eColor;

void setup() {
  size(600, 600);
  background(0);
  ui();
}

void ui() {
  sbar1 = new ScrollBar(11, 22, 200, 10, 0, 255, 160, "tag1");
  sbar1.setValue(161);//sbar1.randomize();
  sbar2 = new ScrollBar(11, 42, 200, 10, 0, 255, 160, "tag2");
  sbar2.setValue(161);//sbar1.randomize();
  
  bt = new Button(50, height - 50, 50, 25, "test");
}

void draw(){
  background(0);
  eSize = sbar1.update();
  eColor = sbar2.update();
  bt.update();
  fill(eColor);
  ellipse(width/2, height/2, eSize, eSize);
}
