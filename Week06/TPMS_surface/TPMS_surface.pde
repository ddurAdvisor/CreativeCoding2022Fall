import peasy.*;

PeasyCam cam;
MarchingCube mc;
PShape meshShape;

int resolutionX = 150;
int resolutionY = 400;
int resolutionZ = 80;
float division = 20.0;
int cellSize = 10;

float[][][] pointCloudVals = new float[resolutionX][resolutionY][resolutionZ];

float scaleIndex = 0.1;//output size = 100mm.
ArrayList<Triangle> stlTriangles;

boolean showRDBody = true;
boolean displaySpace;
boolean symmetry;

float manipulator = 0;
float scalIndex = 1.0;

void setup() {
  size(1000, 1000, P3D);
  surface.setLocation(50, 50);
  cam = new PeasyCam(this, 1200);
  initiateData();

  buildMeshShape();
}

void buildMeshShape() {
  meshShape = createShape();

  meshShape.beginShape(TRIANGLES);
  meshShape.fill(255);
  meshShape.stroke(0);

  for (Triangle t : stlTriangles) {
    meshShape.vertex(t.a.x, t.a.y, t.a.z);
    meshShape.vertex(t.b.x, t.b.y, t.b.z);
    meshShape.vertex(t.c.x, t.c.y, t.c.z);
  }

  meshShape.endShape(CLOSE);
}

void draw() {
  background(255);
  lights();

  noFill();
  stroke(51);
  pushMatrix();
  translate(cellSize*resolutionX/2, cellSize*resolutionY/2, cellSize*resolutionZ/2);
  box(cellSize*resolutionX, cellSize*resolutionY, cellSize*resolutionZ);
  popMatrix();

  if (displaySpace) {
    for (int i = 0; i < resolutionX; i ++) {
      for (int j = 0; j < resolutionY; j ++) {
        for (int k = 0; k < resolutionZ; k ++) {
          stroke(51);
          strokeWeight(1);
          point(cellSize*i, cellSize*j, cellSize*k);
        }
      }
    }
  }

  if (showRDBody) {
    shape(meshShape, 0, 0);
    if (symmetry) {
      pushMatrix();
      scale(-1, 1, 1);
      shape(meshShape, 0, 0);
      popMatrix();
    }
  }

  cam.beginHUD();
  fill(0);
  textSize(24);
  text("manipulator: " + manipulator, 25, 25);
  cam.endHUD();
}

void initiateData() {
  mc = new MarchingCube();

  for (int i = 0; i < resolutionX; i ++) {
    for (int j = 0; j < resolutionY; j ++) {
      for (int k = 0; k < resolutionZ; k ++) {

        float ang = sin(map(k, 0, resolutionZ-1, 0, PI));

        float dSquare = scalIndex*sin(i/division)*cos(j/division)+
                        sin(j/division)*cos(k/division*sin(ang))+
                        scalIndex*sin(k/division*sin(ang))*cos(i/division);

        if (dSquare <= 0){ 
          pointCloudVals[i][j][k] = 0.6;
        } else {
          pointCloudVals[i][j][k] = 0;
        }
      }
    }
  }

  mc.Mesh();
}

void keyPressed() {
  if (key == 'b') showRDBody = !showRDBody;
  if (key == 'e') export();
  if (key == 's') symmetry = !symmetry;
  if (key == 'a') {
    manipulator += 0.10;
    initiateData();
    buildMeshShape();
  }
  if (key == 'z') {
    scalIndex += 0.10;
    initiateData();
    buildMeshShape();
  }
}
