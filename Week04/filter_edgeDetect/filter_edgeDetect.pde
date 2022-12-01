PImage img;
PImage greyImg;
PImage imgEdge;

int threshold = 1;

float[][] convolutionMatrix = {{-1, -1, -1}, 
  {-1, 9, -1}, 
  {-1, -1, -1}};

void settings() {
  img = loadImage("hikking.jpeg");//("obama2.jpg"); //("trump.png");
  size(img.width, img.height*3);
  greyImg = createImage(img.width, img.height, RGB);
  imgEdge = createImage(img.width, img.height, RGB);
}

void setup() {
  img.loadPixels();
  greyImg.loadPixels();
  imgEdge.loadPixels();
}

void draw() {
  img2grey();
  //getEdge();
  getNeighborEdge();
  image(img, 0, 0);
  image(greyImg, 0, img.height);
  image(imgEdge, 0, img.height*2);
  
  println("threshold:"+threshold);
}

void img2grey() {
  for (int i = 0; i < img.width; i ++) {
    for (int j = 0; j < img.height; j ++) {
      int loc = i + img.width * j;
      color c = img.pixels[loc];
      float newColor = 0.21*red(c) + 0.72*green(c) + 0.07*blue(c);
      greyImg.pixels[loc] = color(newColor);
    }
  }
  greyImg.updatePixels();
}

void getNeighborEdge() {
  for (int x = 1; x < greyImg.width-1; x++ ) {
    for (int y = 1; y < greyImg.height-1; y++ ) {

      // Pixel location and color
      int loc = x + y*greyImg.width;
      color pix = greyImg.pixels[loc];

      // Pixel to the left location and color
      int leftLoc = (x - 1) + y*greyImg.width;
      color leftPix = greyImg.pixels[leftLoc];

      // Pixel to the right location and color
      int rightLoc = (x + 1) + y*greyImg.width;
      color rightPix = greyImg.pixels[rightLoc];

      // Pixel to the top location and color
      int topLoc = x + (y-1)*greyImg.width;
      color topPix = greyImg.pixels[topLoc];

      // Pixel to the bottom location and color
      int bottomLoc = x + (y+1)*greyImg.width;
      color bottomPix = greyImg.pixels[bottomLoc];

      // New color is difference between pixel and left neighbor
      float diff = abs(brightness(pix) - brightness(leftPix)) + 
        abs(brightness(pix) - brightness(rightPix)) +
        abs(brightness(pix) - brightness(topPix)) +
        abs(brightness(pix) - brightness(bottomPix));
      if (diff > 255/threshold) {
        diff = 255;
      } else {
        diff = 0;
      }
      imgEdge.pixels[loc] = color(diff);
    }
  }
  imgEdge.updatePixels();
}

void keyPressed() {
  if (key =='a') {
    threshold ++;
  }
  if (key == 'z') {
    if (threshold > 1) {
      threshold --;
    }
  }
}


void getEdge() {
  int[] pixelsGroup = new int[3*3];
  for (int i = 1; i < greyImg.width-1; i ++) {
    for (int j = 1; j < greyImg.height-1; j ++) {
      int loc = i + greyImg.width * j;

      int index = 0;
      for (int m = 1; m < 4; m ++) {
        for (int n = 1; n < 4; n ++) {
          int nLoc = i+(m-2) + greyImg.width * (j + (n-2));
          if (abs(greyImg.pixels[loc] - greyImg.pixels[nLoc]) > 255/2 && loc != nLoc) {
            pixelsGroup[m*n-1] = nLoc;
            pixelsGroup[4] = loc;
            index ++;
          }
        }
      }
      if (index > 4) {
        for (int k = 0; k < 9; k ++) {
          imgEdge.pixels[pixelsGroup[k]] = color(0);
          imgEdge.pixels[pixelsGroup[4]] = color(255);
        }
      } else {
        imgEdge.pixels[loc] = color(0);
      }

      //color locColor = convolution(i, j, convolutionMatrix, 3, greyImg);
      //imgEdge.pixels[loc] = locColor;
    }
  }
  imgEdge.updatePixels();
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  float bTotal = 0;
  int offset = matrixsize / 2;
  // Loop through convolution matrix
  for (int i = 0; i < matrixsize; i++) {
    for (int j = 0; j < matrixsize; j++) {
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
