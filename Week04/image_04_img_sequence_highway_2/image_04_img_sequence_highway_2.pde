int numFrames = 225;
int frame = 0;
PImage[] images = new PImage[numFrames];
int count = 0;

void setup() {
  size(900, 900);
  //frameRate(15);
  background(255);
  for (int i = 0; i < 225; i ++) {
    images[i] = loadImage("walking-"+nf(i, 4)+".jpg");
  }
}

void draw() {
  background(255);
  frame = int(map(count, 0, width, 0, 224));
  //frame++;

  image(images[frame], count - images[frame].width/2, 600 - images[frame].height/2);
  count ++;
  if (count > width) {
    count = 0;
  }
}
