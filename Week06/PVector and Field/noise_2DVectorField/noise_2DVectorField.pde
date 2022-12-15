Partcile[] pts;
int numOfParticles = 1000;
PVector[][] gridVector;

int row = 80;
int col = 80;
int cellSize = 10;
float rGradient = 0.02;//梯度
float cGradient = 0.02;

float count;
float tGradient = 0.01;

boolean showField; //false
boolean showGrid;

void settings() {
  size(col * cellSize, row * cellSize);
}

void setup() {
  //background(255);
  //grid();
  initiateData();
  initiateVectorField();
  grid();
}

void initiateVectorField() {
  gridVector = new PVector[col][row];
}

void initiateData() {
  pts = new Partcile[numOfParticles];
  for (int i = 0; i < pts.length; i ++) {
    pts[i] = new Partcile(new PVector(random(width), random(height)));
  }
}

void grid() {
  for (int i = 0; i < row; i ++) {
    float a = i*rGradient;
    for (int j = 0; j < col; j ++) {
      float b = j*cGradient;
      float angle = noise(a, b, count)*TWO_PI;
      PVector cellVector = PVector.fromAngle(angle);
      gridVector[j][i] = cellVector;
      float cvX1 = i*cellSize + cellSize/2 + cellSize/2 *cos(cellVector.heading());
      float cvY1 = j*cellSize + cellSize/2 + cellSize/2 *sin(cellVector.heading());
      float cvX2 = i*cellSize + cellSize/2 + cellSize/2 *cos(cellVector.heading()+PI);
      float cvY2 = j*cellSize + cellSize/2 + cellSize/2 *sin(cellVector.heading()+PI);
      if (showField) {
        stroke(map(angle, 0, TWO_PI, 0, 255));
        strokeWeight(0.5);
        line(cvX1, cvY1, cvX2, cvY2);
      }

      if (showGrid) {

        //noStroke();
        //fill(cellColor);
        stroke(51);
        noFill();
        rect(i*cellSize, j*cellSize, cellSize, cellSize);
      }
    }
  }
}

void draw() {
  //background(255);
  fill(255, 10);
  noStroke();
  rect(0, 0, width, height);
  grid();
  count += tGradient;
  println("frameRate: " + frameRate);

  for (int i = 0; i < pts.length; i ++) {
    pts[i].run();
  }
}

void keyPressed() {
  if (key == 'f') showField = !showField;
  if (key == 'g') showGrid =!showGrid;
}
