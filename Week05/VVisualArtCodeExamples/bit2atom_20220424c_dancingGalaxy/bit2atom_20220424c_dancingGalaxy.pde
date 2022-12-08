/*----------------------------------
  author: @diegorv
  Fork from https://www.openprocessing.org/sketch/533087
*/

float x, y;

void setup() {
  size(1080, 1080);
  background(0);
  smooth();
  noLoop();
}

void draw() {
  noStroke();

  for (int p = 0; p < 400; p++) {
    cloudGenerator();

    fillWhite(20);
    particlesGenerator(2000, 2);

    fillWhite(50);
    particlesGenerator(1000, random(2, 3));

    fillWhite(10);
    particlesGenerator(100, random(3, 4));
  }

  pictureFrame();


}

void mousePressed(){
  saveFrame("smoke.jpg");
}

/// Functions

void particlesGenerator(int limit, float size) {
  x = geCoordinates()[0];
  y = geCoordinates()[1];

  for (int i = 0; i < limit; i++) {
    ellipse(x, y, size, size);

    float noiseX = (noise(x/100, y/100, i/100) - 0.5);
    float noiseY = (noise(y/100, i/100, x/100) - 0.5);

    x += 5 * noiseX;
    y += 5 * noiseY;
  }
}

void cloudGenerator() {
  x = geCoordinates()[0];
  y = geCoordinates()[1];

  fillWhite(25);

  ellipse(x, y, 50, 50);
}

void pictureFrame() {
  float frameWidth = width-100;
  float frameHeight = height-100;

  noFill();
  stroke(255);
  rect(50, 50, frameWidth, frameHeight);

  stroke(255);
  rect(40, 40, frameWidth, frameHeight);

  stroke(255);
  rect(30, 30, frameWidth, frameHeight);
}

void fillWhite(int alph) {
  fill(random(255), alph);
}

float[] geCoordinates() {
  float x = random(width/5, width*4/5);
  float y = random(height/5, height*4/5);

  return new float [] {x, y};
}
