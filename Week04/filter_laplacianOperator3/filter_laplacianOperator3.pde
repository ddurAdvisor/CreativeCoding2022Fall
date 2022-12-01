
PImage img;
PImage imgEdge;
//int row = 100;
//int col = 100;
float[][] scatterPoints;
float[][] newScatterPoints;

boolean displayPoints = true;
boolean laplacianImage;

void settings() {
  img = loadImage("dog.png");
  size(img.width, img.height);
}

void setup() {
  background(0);
  imgEdge = createImage(img.width, img.height, RGB);
}

void draw() {
  if (laplacianImage) {
    image(imgEdge, 0, 0);
  } else {
    image(img, 0, 0);
  }
}

void keyPressed() {
  if (key == 'l') {
    if (laplacianImage) {
      laplacianImage = false;
    } else {
      convolutionProcess();
      laplacianImage = true;
    }
  }
}

void convolutionProcess() {
  for (int i = 0; i < img.width; i ++) {
    for (int j = 0; j < img.height; j ++) {
      int pixelLoc = i + img.width*j;
      imgEdge.pixels[pixelLoc] = color(convolution(i, j, laplacian1, img));
    }
  }
}

float[][] sharpMatrix = {{-1, -1, -1}, {-1, 9, -1}, {-1, -1, -1}};
float[][] laplacian1 = {{0, 1, 0}, {1, -4, 1}, {0, 1, 0}};
float[][] laplacian2 = {{1, 1, 1}, {1, -8, 1}, {1, 1, 1}};

color convolution(int x, int y, float[][] matrix, PImage img) {
  float bTotal = 0;
  int offset = matrix.length / 2;
  // Loop through convolution matrix
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      // What pixel are we testing
      int xloc = x + i-offset;
      int yloc = y + j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we haven't walked off the edge of the pixel array
      loc = constrain(loc, 0, img.pixels.length-1);
      // Calculate the convolution
      bTotal += (brightness(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  bTotal = constrain(bTotal, 0, 255);
  //if (bTotal > 255/2) {
  //  bTotal = 255;
  //} else {
  //  bTotal = 0;
  //}
  // Return the resulting color
  return color(bTotal);
}
