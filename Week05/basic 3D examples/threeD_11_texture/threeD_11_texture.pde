int textureRes = 32;
float[] textureX = new float[textureRes];
float[] textureY = new float[textureRes];

PImage img;

void setup() {
  size(400, 400, P3D);
  background(0);
  img = loadImage("sunflower.jpg");
  float angle = 372.0 / textureRes;
  for(int i = 0; i < textureRes; i++){
    textureX[i] = cos(radians(i * angle));
    textureY[i] = sin(radians(i * angle));
  }
  //noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateX(map(mouseY, 0, height, -PI, PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  beginShape(QUAD_STRIP);
  texture(img);
  for(int i = 0; i < textureRes; i++){
    float x = textureX[i] * 100;
    float z = textureY[i] * 100;
    float u = img.width / textureRes * i;
    vertex(x, -100, z, u, 0);
    vertex(x, 100, z, u, img.height);
  }
  endShape();
}
