PShape [] characters;
int vertexCount;
float sinCounter = 0;
float eSize = 15;

void setup () {
  size (1200, 900);
  smooth ();
  background (0);
  noStroke ();

  PShape drawingSVG = loadShape("visual.svg");
  drawingSVG.disableStyle();
  int count = drawingSVG.getChildCount();  
  characters = new PShape [count];

  for (int i = 0; i < characters.length; i ++) {
    characters[i] = drawingSVG.getChild(i);
    int v = characters[i].getVertexCount();
    println(v);
  }
}

void draw () {
  background (255);
  for (int j = 0; j < 6; j++) {
    vertexCount = characters[j]. getVertexCount ();

    for (int i = 0; i < vertexCount; i+=1) {
      PVector v = characters[j]. getVertex(i).mult(2);
      float ellipseColor = map(sin(sinCounter), -1, 1, 0, 255);
      fill(ellipseColor);
      float ellipseSize = map(i, 0, vertexCount, eSize, eSize+40);
      ellipse(v.x, v.y - height/2, ellipseSize, ellipseSize);

      float aa = TWO_PI/vertexCount;
      sinCounter += aa;
    }
  }
  filter(BLUR , 1);
}
