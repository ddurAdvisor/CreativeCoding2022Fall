class ControlFrame extends PApplet {
  int w, h;
  String titleName;
  PApplet parent;
  ControlP5 cp5;

  int sliderTopLeftX = 20;
  int sliderTopLeftY = 240;

  int sliderWidth = 200;
  int sliderHeight = 40;
  int sliderInterval = 10;

  public ControlFrame(PApplet _parent, int _w, int _h, String _titleName) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    titleName = _titleName;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(surfaceLocationX + parent.width + 10, surfaceLocationY);
    surface.setTitle(titleName);

    cp5 = new ControlP5(this);

    cp5.addSlider("Parameter01")
      .plugTo(parent, "Parameter01")
      .setRange(0.01, 0.1)
      .setValue(0.023)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*0)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);

    cp5.addSlider("Parameter02")
      .plugTo(parent, "Parameter02")
      .setRange(0.01, 0.1)
      .setValue(0.074)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*1)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);

    cp5.addSlider("Parameter03")
      .plugTo(parent, "Parameter03")
      .setRange(0.01, 0.1)
      .setValue(0.095)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*2)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);

    cp5.addSlider("Parameter04")
      .plugTo(parent, "Parameter04")
      .setRange(0.01, 0.1)
      .setValue(0.03)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*3)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);

    cp5.addSlider("Parameter05")
      .plugTo(parent, "Parameter05")
      .setRange(0, 30)
      .setValue(10)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*4)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);
    
    cp5.addSlider("Parameter06")
      .plugTo(parent, "Parameter06")
      .setRange(0, 30)
      .setValue(10)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*5)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);
    
    cp5.addSlider("Parameter07")
      .plugTo(parent, "Parameter07")
      .setRange(0, 30)
      .setValue(10)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*6)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);
      
    cp5.addSlider("Parameter08")
      .plugTo(parent, "Parameter08")
      .setRange(0, 30)
      .setValue(10)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*7)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);
      
    cp5.addSlider("Parameter09")
      .plugTo(parent, "Parameter09")
      .setRange(0.01, 0.1)
      .setValue(0.023)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*8)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);

    cp5.addSlider("Parameter10")
      .plugTo(parent, "Parameter10")
      .setRange(0.01, 0.1)
      .setValue(0.074)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*9)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);

    cp5.addSlider("Parameter11")
      .plugTo(parent, "Parameter11")
      .setRange(0.01, 0.1)
      .setValue(0.095)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*10)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);

    cp5.addSlider("Parameter12")
      .plugTo(parent, "Parameter12")
      .setRange(0.01, 0.1)
      .setValue(0.03)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*11)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);

    cp5.addSlider("Parameter13")
      .plugTo(parent, "Parameter13")
      .setRange(0, 30)
      .setValue(10)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*12)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);
    
    cp5.addSlider("Parameter14")
      .plugTo(parent, "Parameter14")
      .setRange(0, 30)
      .setValue(10)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*13)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);
    
    cp5.addSlider("Parameter15")
      .plugTo(parent, "Parameter15")
      .setRange(0, 30)
      .setValue(10)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*14)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);
      
    cp5.addSlider("Parameter16")
      .plugTo(parent, "Parameter16")
      .setRange(0, 30)
      .setValue(10)
      .setPosition(sliderTopLeftX, sliderTopLeftY + (sliderInterval + sliderHeight)*15)
      .setSize(sliderWidth, sliderHeight)
      .setDecimalPrecision(4);
  }

  void draw() {
    background(50);
    
    fill(255);
    text("== Geometry Parameters ==", sliderTopLeftX, sliderTopLeftY - 20);
  }
}
