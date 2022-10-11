import processing.dxf.*;//to output dxf file.
boolean record;
boolean meshDisplay;
import processing.opengl.*;

import peasy.*;

PeasyCam cam;
PImage img;
PImage googleMap;

int cellsize=5;
int cols, rows;
float heightIndex = 1;

void setup() {
  img=loadImage("ssdGray.jpg");
  size(img.width, img.height, OPENGL);
  cam = new PeasyCam(this, 400);
  smooth();

  cols=img.width/cellsize;
  rows=img.height/cellsize;

  googleMap=loadImage("ssdColor.jpg");
}

void draw() {
  if (record) {
    beginRaw(DXF, "output3.dxf");
  }

  background(30);
  
  translate(-width/2,-height/2);

  for (int i=0;i<cols-1;i++) {
    for (int j=0;j<rows-1;j++) {
      int x1=i*cellsize;
      int y1=j*cellsize;
      int loc1=x1+y1*img.width;
      //color c1=img.pixels[loc];
      float z1=heightIndex*brightness(img.pixels[loc1]);

      int x2=(i+1)*cellsize;
      int y2=j*cellsize;
      int loc2=x2+y2*img.width;
      //color c1=img.pixels[loc];
      float z2=heightIndex*brightness(img.pixels[loc2]);

      int x3=(i+1)*cellsize;
      int y3=(j+1)*cellsize;
      int loc3=x3+y3*img.width;
      //color c1=img.pixels[loc];
      float z3=heightIndex*brightness(img.pixels[loc3]);

      int x4=i*cellsize;
      int y4=(j+1)*cellsize;
      int loc4=x4+y4*img.width;
      //color c1=img.pixels[loc];
      float z4=heightIndex*brightness(img.pixels[loc4]);

      //beginShape();//with lower rendering speed, but support DXF file export.
      beginShape(TRIANGLES);//with higher rendering speed, but do not support DXF file export.
      noStroke();
      texture(googleMap);

      //draw grid mesh
      if (meshDisplay) {
        stroke(255);
        strokeWeight(1);
        noFill();      
        //fill(100,100,255);
      }

      vertex(i*cellsize, j*cellsize, z1, i*cellsize, j*cellsize);
      vertex((i+1)*cellsize, j*cellsize, z2, (i+1)*cellsize, j*cellsize);
      vertex((i+1)*cellsize, (j+1)*cellsize, z3, (i+1)*cellsize, (j+1)*cellsize);
      vertex(i*cellsize, j*cellsize, z1, i*cellsize, j*cellsize);
      vertex((i+1)*cellsize, (j+1)*cellsize, z3, (i+1)*cellsize, (j+1)*cellsize);
      vertex(i*cellsize, (j+1)*cellsize, z4, i*cellsize, (j+1)*cellsize);
      endShape();

      //draw mesh grid points
      /*
      stroke(255,255,0);
       strokeWeight(2);
       point(i*cellsize, j*cellsize,z1);
       */
    }
  }
  if (record) {
    endRaw();
    record = false;
  }
  
  cam.beginHUD();
  text(heightIndex, 80,80,50);
  cam.endHUD();
}

void keyPressed() {
  if (key == 'a') {
     heightIndex+=0.2;
  }
  if (key == 'd') {
     heightIndex-=0.2;
  }
  
  if (key == 'r') {
    record = true;
  }
  if (key =='m') {
    meshDisplay = true;
  }
  if (meshDisplay) {
    if (key =='h') {
      meshDisplay = false;
    }
  }
}

