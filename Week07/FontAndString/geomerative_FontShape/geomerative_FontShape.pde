import geomerative.*;
RFont font;
RPolygon polygon;
char c = 'x';

void setup() {
  size(600, 400, P2D);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  noStroke();

  generateFont(c);

  // Original 'a' outline
  //noFill();
  //stroke(0);
  //strokeWeight(1);
  //font.draw(c);
}

void generateFont(char ch) {
  noStroke();
  //stroke(0);

  char letter = ch;

  // always initialize the library in setup
  RG.init(this);
  font = new RFont("chunkfive.ttf", 300, CENTER);

  // Number of segments between each point
  RCommand.setSegmentLength(20);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  // get a polygon from a single character.
  polygon = font.toPolygon(letter);

  // translate to the middle. Use plus in y because text is drawn from y and up
  translate(width/2, (height/2) + (polygon.getHeight()/2));
  float noiseCount = 0;
  noiseDetail(2, 1.3);

  // because a character has multiple contours (the whole in the 'a' is one, the outline another),
  // let's loop through all the contours first
  for (int i = 0; i < polygon.contours.length; i++) {
    RContour curContour = polygon.contours[i];
    if (i == 0) fill(360, 100, 100);
    else fill(360, 0, 100);

    // begin a shape and place a vertex point for each point in the contour
    beginShape();
    for (int j = 0; j < curContour.points.length; j++) {
      float danceFactor = round(random(-1, 1)) * (noise(noiseCount)*10);
      //now for each RPoint (which is a vector), make an ellipse
      RPoint curPoint = curContour.points[j];
      //RPoint curPoint2 = curContour.points[(j+2)%curContour.points.length];
      //before drawing the point, let's randomize the x,y values a little bit
      curPoint.x += danceFactor;
      curPoint.y += danceFactor;
      curveVertex(curPoint.x, curPoint.y);
      //line(curPoint.x, curPoint.y, curPoint2.x, curPoint2.y);
      noiseCount += 0.2;
    }
    endShape();
  }
}

void draw() {
}

void keyPressed() {
  if (key == 'r') {
    background(360);
    generateFont(c);
  }
}
