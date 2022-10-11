int numPoints = 20;
int w = numPoints * 25;
int pointSpacing = (w / numPoints);
int skinXspacing, skinYspacing;

float xoffset, yoffset;
float amplitude = 0;
float theta = 0;
float theta_vel = 0.06;
float period = w * 1.5;
float dx = (TWO_PI / period) * pointSpacing;
float[] yvalues = new float[numPoints];
float[] xpos = new float[numPoints];
float[] ypos = new float[numPoints];
float[] angles = new float[numPoints];
float[][] vertices = new float[numPoints * 2][2];


ScrollBar bar;
Button button;
PFont font;
PImage skin;


void setup() {
  size(800, 480, OPENGL);
  orientation(LANDSCAPE);
  smooth();
  background(0);
  //noLoop();

  font = createFont("TrueFrutigerLight",16,true);
  textFont(font);

  /* UI */
  // control wave amplitude
  bar = new ScrollBar(int(width * 0.5)-80, 25, 270, 60, 0, 100);
  // toggles render view
  button = new Button(int(width * 0.5) - 305, 25, 60, color(0,150,255), color(255), color(102));

  // fish skin image
  skin = loadImage("dophin.png");
  skinXspacing = int(skin.width / (numPoints - 1));
  skinYspacing = int(skin.height / 2);

  // this are just the positions on screen for the wave 
  xoffset = (width - w) * 0.5;
  yoffset = height * 0.6;
}


void draw() {
  background(0);

  noStroke();
  fill(255);
  text("Toggle render view", 160, 60);
  text("Change wave amplitud", 600, 60);
  bar.update(mouseX, mouseY);
  bar.display();

  button.update();
  button.display();

  calcWave();
  renderWave();
}



/*  calcWave store the wave values into an array,
    so it can be use to render the swim motion
*/
void calcWave() {
  amplitude = norm(bar.getPos(), 0, 100) * 3;
  if (amplitude <= 0.5) amplitude = 0.5;
  
  println(norm(bar.getPos(), 0, 1));
  
  theta += theta_vel;
  float angle = theta;

  // main sine wave
  for (int n = 0; n < numPoints; n++) {
    yvalues[n] = sin(angle) * (amplitude * ((n % numPoints) + 1));
    angle += dx;

    xpos[n] = xoffset + n * pointSpacing;
    ypos[n] = yoffset + yvalues[n];
  }

  // store angles, and vertex positions on each point
  float dx = 0;
  float dy = 0;

  for (int m = 0; m < numPoints; m++) {
    // set the angles[0] in the array, then the rest 
    if (m == 0) {
      dx = xpos[1] - xpos[0];
      dy = ypos[1] - ypos[0];
    }
    else {
      dx = xpos[m] - xpos[m - 1];
      dy = ypos[m] - ypos[m - 1];
    }
    angles[m] = atan2(dy, dx);

    // even numbers
    vertices[m * 2][0] = xpos[m] + sin(-angles[m]) * -skinYspacing;
    vertices[m * 2][1] = ypos[m] + cos(-angles[m]) * -skinYspacing;

    // odd numbers
    vertices[m * 2 + 1][0] = xpos[m] + sin(-angles[m]) * skinYspacing;
    vertices[m * 2 + 1][1] = ypos[m] + cos(-angles[m]) * skinYspacing;
  }
}



/* RENDER WAVE */

boolean showDebugShape = false;

int radius = 5;

void renderWave() {
  if (showDebugShape) {
    renderShape();
    renderPoints();
  }
  else {  
    renderShape();
  }
}

void renderPoints() {
  for (int h = 0; h < numPoints * 2; h++) {
    stroke(0, 50, 100);
    pushMatrix();
    translate(xpos[h % numPoints], ypos[h % numPoints]);
    rotate(angles[h % numPoints]);
    line(0, -skinYspacing, 0, skinYspacing);
    popMatrix();

    noStroke();
    fill(0, 102, 250);
    ellipse(xpos[h % numPoints], ypos[h % numPoints], radius, radius);

    // render blue lines, even numbers
    if ((h % 2) == 0) {
      fill(255);
      text(h, vertices[h][0], vertices[h][1] - 10);

      fill(0, 180, 255);
      ellipse(vertices[h][0], vertices[h][1], radius * 0.5, radius * 0.5);
    }
    // renders green lines odd numbers
    else {
      fill(255);
      text(h, vertices[h][0], vertices[h][1] + 20);

      fill(0, 255, 0);
      ellipse(vertices[h][0], vertices[h][1], radius * 0.5, radius * 0.5);
    }
  }
}


void renderShape() {
  for (int i = 0; i < numPoints - 1; i++) {
    beginShape();
    texture(skin);
    //    u, v coordinates are
    //    0  1
    //    2  3 
    //    xOffset *i = U position of the beginning of the image slice
    vertex(vertices[i * 2][0], vertices[i * 2][1], skinXspacing * i, 0);
    //    xOffset * i + xOffset = U position of the end of the image slice 
    vertex(vertices[i * 2 + 2][0], vertices[i * 2 + 2][1], skinXspacing * i + skinXspacing, 0);
    //    V coords are either 0 or the height of the image 
    vertex(vertices[i * 2 + 3][0], vertices[i * 2 + 3][1], skinXspacing * i + skinXspacing, skin.height);   
    vertex(vertices[i * 2 + 1][0], vertices[i * 2 + 1][1], skinXspacing * i, skin.height);

    endShape();
  } 
}


void mousePressed() {
  bar.press(mouseX, mouseY);

  if (button.press()) {
    if(showDebugShape)
      showDebugShape = false;
    else
      showDebugShape = true;
  }
}

void mouseReleased() {
  bar.release();
  button.release();
}
