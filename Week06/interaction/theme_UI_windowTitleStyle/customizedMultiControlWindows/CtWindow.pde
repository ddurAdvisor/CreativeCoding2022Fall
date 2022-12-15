class CtWindow extends PApplet {
  PApplet parent;
  ControlP5 cp;
  int ww;
  int wh;
  String name;
  int index;

  CtWindow(PApplet pa, int w, int h, String n, int ind) {
    super();
    parent = pa;
    ww = w;
    wh = h;
    name = n;
    index = ind;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  void settings() {
    size(ww, wh);
  }

  void setup() {
    cp = new ControlP5(this);
    surface.setTitle(name);
    surface.setLocation(200+420*index, 10);

    if (index == 0) {//size and position parameters
      cp.addSlider("ellipseSize")
        .plugTo(parent, "eD")
        .setRange(10, 400)
        .setValue(30)
        .setPosition(250, 30)
        .setSize(100, 30);

      cp.addSlider("ellipseX")
        .plugTo(parent, "eX")
        .setRange(0, parent.width)
        .setValue(parent.width/2.0)
        .setPosition(250, 70)
        .setSize(100, 30);

      cp.addSlider("ellipseY")
        .plugTo(parent, "eY")
        .setRange(0, parent.height)
        .setValue(parent.height/2.0)
        .setPosition(250, 110)
        .setSize(100, 30);
    }

    if (index == 1) {//color palette
      cp.addSlider("fillRed")
        .plugTo(parent, "fR")
        .setRange(0, 255)
        .setValue(105)
        .setPosition(250, 30)
        .setSize(100, 30);

      cp.addSlider("fillGreen")
        .plugTo(parent, "fG")
        .setRange(0, 255)
        .setValue(105)
        .setPosition(250, 70)
        .setSize(100, 30);

      cp.addSlider("fillBlue")
        .plugTo(parent, "fB")
        .setRange(0, 255)
        .setValue(105)
        .setPosition(250, 110)
        .setSize(100, 30);
    }
  }

  void draw() {
    background(190);
    if (index == 0) {
      pushStyle();
      noFill();
      stroke(51);
      rect(20, 20, height, height-40);
      popStyle();
      float xx = map(eX, 0, parent.width, 20, height);
      float yy = map(eY, 0, parent.height, 20, height-20);
      pushStyle();
      strokeWeight(15);
      point(xx, yy);
      popStyle();
    }
    
    if(index == 1){
      pushStyle();
      fill(fR, fG, fB);
      stroke(51);
      rect(20, 20, height, height-40);
      popStyle();
    }
  }
}
