PImage sourceImage;
PImage processedImage;

int kernalXSize = 3;
int kernalYSize = 3;

int stepX;
int stepY;

//transform matrix
float[][] transformMatrix1 = {{1, 0, -1},
  {0, 1, -1},
  {0, 0, 1}}; //new float[4][4];

float[][] transformMatrix2 = {{1, 0, 1},
  {0, 1, 1},
  {0, 0, 1}}; //new float[4][4];

float alpha;

float[][] rot = {{cos(alpha), -sin(alpha), 0},
  {sin(alpha), cos(alpha), 0},
  {0, 0, 1}};

void settings() {
  sourceImage = loadImage("flower.png");//("city.jpg");//("fruits.png");//("lion2.jpg");//("portrait_redCurls2.jpg");//("mountainAndLake.png");//("portrait_redCurls2.jpg");//("flora.jpg");//("sourceImage.png");//("vallege.jpg");//
  size(sourceImage.width*2, sourceImage.height);
}

void setup() {
  sourceImage.loadPixels();
  generateOutput();
}

void draw() {
  image(sourceImage, 0, 0);
  image(processedImage, sourceImage.width, 0);
}

void generateOutput() {
  processedImage = createImage(sourceImage.width, sourceImage.height, RGB);
  processedImage.loadPixels();

  stepX = floor(kernalXSize/2);
  stepY = floor(kernalYSize/2);
  for (int i = stepX; i < sourceImage.width - stepX; i ++) {
    for (int j = stepY; j < sourceImage.height - stepY; j ++) {
      calculateMeanAndVariance(i, j);
    }
  }
  processedImage.updatePixels();
}

void calculateMeanAndVariance(int i, int j) {
  float meanRed = 0;
  float meanGreen = 0;
  float meanBLue = 0;

  //int meanColor = 0;

  float variance = 0;

  float[][] meanAndVariance = new float[4][4];

  int stepX = floor(kernalXSize/2);
  int stepY = floor(kernalYSize/2);

  for (int m = 0; m < 2; m ++) {
    for (int n = 0; n < 2; n ++) {
      int xLeft = i + stepX * (m-1);
      int xRight = i + stepX * m;
      int yTop = j + stepY * (n-1);
      int yBottom = j + stepY * n;

      //calculate Mean
      for (int ii = xLeft; ii <= xRight; ii ++) {
        for (int jj = yTop; jj <= yBottom; jj ++) {
          int loc = jj * sourceImage.width + ii;
          meanRed += red(sourceImage.pixels[loc]);
          meanGreen += green(sourceImage.pixels[loc]);
          meanBLue += blue(sourceImage.pixels[loc]);

          //meanColor += sourceImage.pixels[loc];
        }
      }
      meanRed /= ((xRight-xLeft+1)*(yBottom-yTop+1));
      meanGreen /= ((xRight-xLeft+1)*(yBottom-yTop+1));
      meanBLue /= ((xRight-xLeft+1)*(yBottom-yTop+1));

      //meanColor /= ((xRight-xLeft+1)*(yBottom-yTop+1));

      //calculate Variance
      //Variance = \frac {\sum x^2}{samples} - mean^2
      for (int ii = xLeft; ii <= xRight; ii ++) {
        for (int jj = yTop; jj <= yBottom; jj ++) {
          int loc = jj * sourceImage.width + ii;
          variance += (red(sourceImage.pixels[loc]) - meanRed) * (red(sourceImage.pixels[loc]) - meanRed)
            + (green(sourceImage.pixels[loc]) - meanRed) * (green(sourceImage.pixels[loc]) - meanGreen)
            + (blue(sourceImage.pixels[loc]) - meanRed) * (blue(sourceImage.pixels[loc]) - meanBLue);
          //variance += (sourceImage.pixels[loc] - meanColor) * (sourceImage.pixels[loc] - meanColor);
        }
      }
      variance /= ((xRight-xLeft+1)*(yBottom-yTop+1));

      meanAndVariance[m+n*2][0] = meanRed;
      meanAndVariance[m+n*2][1] = meanGreen;
      meanAndVariance[m+n*2][2] = meanBLue;
      meanAndVariance[m+n*2][3] = variance;
    }
  }

  //get pixle[i,j] value
  float minVariance = 100000;
  int minVarianceIndex = -1;
  for (int k = 0; k < meanAndVariance.length; k ++) {
    if (meanAndVariance[k][3] < minVariance) {
      minVariance = meanAndVariance[k][3];
      minVarianceIndex = k;
    }
  }

  if (minVarianceIndex > -1) {
    int loc = i + j * sourceImage.width;
    processedImage.pixels[loc] = color(meanAndVariance[minVarianceIndex][0],
      meanAndVariance[minVarianceIndex][1],
      meanAndVariance[minVarianceIndex][2]);
  }
}

//matrix dotProduct
/**
 * [dotProduct description]
 * @Author   bit2atom
 * @DateTime 2022-07-29T10:09:47+0800
 * @param    {[type]}                 float[][] ma            [description]
 * @param    {[type]}                 float[][] mb            [description]
 * @return   {[type]}                           [description]
 */
float[][] dotProduct(float[][] ma, float[][] mb) {
  float[][] newMatrix;

  if (ma[0].length == mb.length) {
    newMatrix= new float[ma.length][mb[0].length];

    for (int i = 0; i < ma.length; i ++) {
      for (int n = 0; n < mb[0].length; n ++) {
        for (int j = 0; j < ma[0].length; j ++) {
          newMatrix[i][n] += ma[i][j] * mb[j][n];
        }
      }
    }
    return newMatrix;
  } else {
    return null;
  }
}

void keyPressed() {
  if (key == 'a') {
    if (kernalXSize < 20) {
      kernalXSize ++;
      kernalYSize ++;
      generateOutput();
    }
  }

  if (key == 'z') {
    if (kernalXSize > 3) {
      kernalXSize --;
      kernalYSize --;
      generateOutput();
    }
  }

  println("kernal: " + kernalXSize);
}
