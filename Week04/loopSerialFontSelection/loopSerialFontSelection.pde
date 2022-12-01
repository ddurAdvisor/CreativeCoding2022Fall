//text("text", width/2, height/2);
PFont myFont;

int index;

void setup() {
  size(600, 600);
  //printArray(PFont.list());
  //println(PFont.list().length);
}

void draw() {
  background(255);
  textAlign(CENTER, CENTER);

  textSize(72);

  //for (int i = 0; i < PFont.list().length; i ++) {
    String fontName = PFont.list()[index];
    //println(fontName);
    textFont(createFont(fontName, 32));
    fill(random(255), random(255), random(255));
    text("Hello World!", width/2, height/2);
    

    index ++;
    
    index = index % PFont.list().length;
    
    println(index + "|"+frameRate);

}
