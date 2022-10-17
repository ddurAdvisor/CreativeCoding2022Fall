import peasy.*;
import controlP5.*;
import nervoussystem.obj.*;

ControlP5 bar;

/*
 case A: Cassini Oval, Also called: Cassinoid or Cassinian Ellipse
 x(t) = cos(t) sqrt(C)
 y(t) = sin(t) sqrt(C)
 where C = a^2 cos(2t) +/- sqrt(b^4 - a^2 sin^2(2t))
 Note:
 Note b cannot be 0
 When a < b the parameter t ranges from 0 to 2pi
 When a = b the curve reduces to r2 = a2 cos(2theta)
 When a > b each loop is defined in two parts, one using the positive version of C above,
 and the other using the negative version. The parameter t ranges from -0.5 arcsin(b2/a2) to 0.5 arcsin(b2/a2).
 A similar arrangement occurs for the polar formulation described earlier.
 
 case B: Blobbies: Credited to John Shier, Documented here by Paul Bourke, May 2013
 r(Q)=R[1+acos(2Q+p1)+bcos（3Q+p2)], a+b<1.
 */

PeasyCam cam;

float x = 0;
float y = 0;
float aValue = 0.9;
float bValue = 1;
float scaleIndex = 100;

float blobbiesA = 0;//0.3;
float blobbiesB = 0;//0.6;
float coe = 0.66;

float phase1 = PI / 4;
float phase2 = PI / 6;

int sectionNum = 300;

int canvasLeftCornerX = 10;
int canvasLeftCornerY = 20;

int barSize = 200;
int barHeight = 20;
int barInterval = barHeight + 5;

int heightSection = 100;

int shininessValue = 1;

int fillColorR = 100;
int fillColorG = 100;
int fillColorB = 100;

int specularR = 255;
int specularG = 255;
int specularB = 255;

int ambientR = 102;
int ambientG = 102;
int ambientB = 102;

int lightSpecularR = 204;
int lightSpecularG = 204;
int lightSpecularB = 204;

int kMin = 30;
int kMax = kMin + 30;

boolean lightOn = false;

boolean record;

String[] name = {":: Generative Design Tool 2016.12 ::"};//title string
String timestamp;

void setup() {
  size(800, 960, P3D);
  surface.setTitle(name[0]);//title string
  cam = new PeasyCam(this, 600);
  UI();
}

void blobbies() {
  // r(Q)=R[1+acos(2Q+p1)+bcos（3Q+p2)], a+b<1.
  // float a = 0.3;
  // float b = 0.6;
  float t = TWO_PI / sectionNum;
  beginShape();
  for (int i = 0; i < sectionNum; i ++) {
    float r = scaleIndex * (1 + blobbiesA * cos(2 * t * i + phase1) + blobbiesB * cos(3 * t * i + phase2));
    x = width/2 + r * cos(t * i);
    y = height/2 + r * sin(t * i);

    stroke(255, 0, 255);
    strokeWeight(1);
    //point(x, y);
    noFill();
    curveVertex(x, y);
  }
  endShape(CLOSE);
}

void CassiniOval() {
  // x(t) = cos(t) sqrt(C)
  // y(t) = sin(t) sqrt(C)
  // where C = a^2 cos(2t) +/- sqrt(b^4 - a^2 sin^2(2t))
  float t = TWO_PI / sectionNum;
  
  beginShape();
  for (int i = 0; i < sectionNum; i ++) {
    float c = sqrt(aValue*aValue*cos(2*t*i+ phase1) + sqrt(bValue*bValue*bValue*bValue - aValue*aValue*sin(2*t*i+ phase2)*sin(2*t*i+ phase2)));
    x = width/2 + cos(t*i)*c*scaleIndex;
    y = height/2 + sin(t*i)*c*scaleIndex;

    stroke(255);
    noFill();
    strokeWeight(1);
    curveVertex(x, y);//point(x, y);
  }
  endShape(CLOSE);
}

void draw() {
  background(200);
  noStroke();
  fill(fillColorR, fillColorG, fillColorB);

  //ambientLight(ambientR, ambientG, ambientB);
  lightSpecular(lightSpecularR, lightSpecularG, lightSpecularB);
  //light setting must be after the ambientLight and lightSpecular settings
  if (lightOn) {
    directionalLight(255, 255, 255, 1, 1, -1);
  }
  directionalLight(102, 102, 102, 0, 0, 1);

  //ambient(ambientR, ambientG, ambientB);
  specular(specularR, specularG, specularB);
  shininess(shininessValue);

  //CassiniOval();
  //blobbies();

  if (record) {
    timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
    beginRecord("nervoussystem.obj.OBJExport", "designWork/flower_"+timestamp+".obj");
  }

  draw3DBlobbies();

  if (record) {
    endRecord();
    record = false;
  }

  //ui process
  cam.beginHUD();
  lights();
  bar.draw();
  cam.endHUD();

  if (mouseX<330 && mouseY<450) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
  //ui process
}

void keyPressed() {
  if (key == 's') {
    record = true;
  }
}

void draw3DBlobbies() {
  float t = TWO_PI / sectionNum;
  float p = 0;//2 * TWO_PI / sectionNum;
  float ang = TWO_PI / heightSection;

  beginShape(TRIANGLES);
  for (int k = kMin; k < kMax; k ++) {
    for (int i = 0; i < sectionNum; i ++) {
      //float r = scaleIndex * (1 + blobbiesA * cos(2 * t * (i%sectionNum) + phase1 + p * 2 * k) + blobbiesB * cos(3 * t * (i%sectionNum) + phase2 + p * 2 * k));

      float r11 = scaleIndex * (1 + coe * sin(ang * k) * cos(2 * t * (i%sectionNum) + phase1 + p * 2 * k) + blobbiesB * cos(3 * t * (i%sectionNum) + phase2 + p * 2 * k));
      float r12 = scaleIndex * (1 + coe * sin(ang * k) * cos(2 * t * ((i+1)%sectionNum) + phase1 + p * 2 * k) + blobbiesB * cos(3 * t * ((i+1)%sectionNum) + phase2 + p * 2 * k));
      float r21 = scaleIndex * (1 + coe * sin(ang * (k+1)) * cos(2 * t * (i%sectionNum) + phase1 + p * 2 * (k+1)) + blobbiesB * cos(3 * t * (i%sectionNum) + phase2 + p * 2 * (k+1)));
      float r22 = scaleIndex * (1 + coe * sin(ang * (k+1)) * cos(2 * t * ((i+1)%sectionNum) + phase1 + p * 2 * (k+1)) + blobbiesB * cos(3 * t * ((i+1)%sectionNum) + phase2 + p * 2 * (k+1)));

      vertex(r11 * cos(t * (i%sectionNum)), r11 * sin(t * (i%sectionNum)), k*5);
      vertex(r22 * cos(t * ((i+1)%sectionNum)), r22 * sin(t * ((i+1)%sectionNum)), (k+1)*5);
      vertex(r21 * cos(t * (i%sectionNum)), r21 * sin(t * (i%sectionNum)), (k+1)*5);

      vertex(r11 * cos(t * (i%sectionNum)), r11 * sin(t * (i%sectionNum)), k*5);
      vertex(r12 * cos(t * ((i+1)%sectionNum)), r12 * sin(t * ((i+1)%sectionNum)), k*5);
      vertex(r22 * cos(t * ((i+1)%sectionNum)), r22 * sin(t * ((i+1)%sectionNum)), (k+1)*5);
    }
  }
  endShape();
}
