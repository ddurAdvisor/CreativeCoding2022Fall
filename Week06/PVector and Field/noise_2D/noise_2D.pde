int row = 200;
int col = 200;
int cellSize = 4;
float rGradient = 0.01;//梯度
float cGradient = 0.01;

float count;
float tGradient = 0.005;

void settings() {
  size(col * cellSize, row * cellSize);
}

void setup() {
  //background(255);
  grid();
}

void grid() {
  for (int i = 0; i < row; i ++) {
    float a = i*rGradient;
    for (int j = 0; j < col; j ++) {
      float b = j*cGradient;
      float cellColor = noise(a, b, count)*255;
      noStroke();
      fill(cellColor);
      rect(i*cellSize, j*cellSize, cellSize, cellSize);
    }
  }
}

void draw() {
  background(255);
  grid(); 
  count += tGradient;
  println("frameRate: " + frameRate);
}
