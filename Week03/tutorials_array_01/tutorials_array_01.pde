Circle cl;//申明：cl是Circle类的一个具体对象
int num = 1000;
Circle[] cls;
//int[] num = {1,2,3,4,5};

void setup() {
  size(800, 800);
  //初始化cl这个对象
  //float x = random(width);
  //float y = random(height);
  //float d = random(50, 100);
  //color c = color(random(0, 255), random(255), random(255));
  //cl = new Circle(x, y, d, c);//Circle(float x_, float y_, float d_, color c_)

  //初始化cls这个数组
  cls = new Circle[num];
  
  for (int i = 0; i < cls.length; i ++) {
    float d = random(5, 50);
    
    float x = random(d/2, width-d/2);
    float y = random(d/2, height-d/2);
    
    color c = color(random(0, 255), random(255), random(255));
    cls[i] = new Circle(x, y, d, c);//对数组中的每一个元素进行独立的赋值
  }
}

void draw() {
  background(0);
  //cl.drawCircle();
  for (int i = 0; i < cls.length; i ++) {
    cls[i].drawCircle();
  }
}
