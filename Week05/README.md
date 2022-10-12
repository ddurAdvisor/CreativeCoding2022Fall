Week05: 3d and geometry



## 3d in processing ide

![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d01.png =400x)
- translate();
- rotateX(); rotateY(); 
``` java
translate(width/2, height/2, -width);
  
rotateY(map(mouseX, 0, width, -PI, PI));
rotateX(map(mouseY, 0, height, -PI, PI));
  
noStroke();
fill(200, 0, 200);
rect(-200, -200, 400, 400);
  
stroke(200, 200, 0);
strokeWeight(1);
line(0, 0, -500, 0, 0, 200);
  
stroke(255);
strokeWeight(5);
point(0, 0, 200);
```
- [完整的源程序：threeD_01_draw_3d](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_01_draw_3d)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d02.png)
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d02_lighting.png)
- lights();
``` java
if (mousePressed) {
    // Turn the lights on on mouse press
    lights();
}

pushMatrix();
translate(mouseX, mouseY, -500);
rotateX(-PI/6);
rotateY(PI/6);
box(400, 100, 400);
translate(0, -200, 0);
sphere(150);
popMatrix();
```
- [完整的源程序：threeD_02_lights_3d_shapes](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_02_lights_3d_shapes)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d03.png)
- beginShape(); endShape();
- vertex(x, y, z);
``` java
beginShape();
  vertex(-s, -s, -s);
  vertex(s, -s, -s);
  vertex(0, 0, s);
  
  vertex(s, -s, -s);
  vertex(s,  s, -s);
  vertex(0, 0, s);
  
  vertex(s, s, -s);
  vertex(-s, s, -s);
  vertex(0, 0, s);
  
  vertex(-s, s, -s);
  vertex(-s, -s, -s);
  vertex(0, 0, s);
endShape();
```
- [完整的源程序：threeD_03_3d_vertex](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_03_3d_vertex)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d04_1.png)
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d04_2.png)
- part1: beginShape(QUAD_STRIP);
``` java
beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
    vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
    angle += angleIncrement;
  }
  endShape();
```
- part2: beginShape(TRIANGLE_FAN);
``` java
beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
endShape();
```
- part3: beginShape(TRIANGLE_FAN);
``` java
beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
endShape();
```
- [完整的源程序：threeD_04_3d_cylinder](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_04_3d_cylinder)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d05.png)
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d05_explode.png)
- saturation();
``` java
for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * cellsize + cellsize/2;
      int y = j * cellsize + cellsize/2;
      int loc = x + (y * width);
      color c = img.pixels[loc];
      float w = width;
      float z = (mouseX/w) * saturation(img.pixels[loc]) * 10.0; 
      pushMatrix();
      translate(x, y, z);
      fill(c);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
```
- [完整的源程序：threeD_05_image_explode](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_05_image_explode)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d08.png)
![image](https://user-images.githubusercontent.com/22334198/195225563-4e13e48d-be8e-4675-932a-0a6a6c9d28e1.png)
- camera(eyeX, eyeY, eyeZ,    centerX, centerY, centerZ,    upX, upY, upZ)
``` java
camera(30.0, mouseY, mouseX, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
```
- [完整的源程序：threeD_08_cameras](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_08_cameras)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d09.png)
- lightSpecular();
- specular();
``` java
lightSpecular(1, 1, 1);
directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
......
specular(s, s, s);
sphere(90);
```
- [完整的源程序：threeD_09_material](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_09_material)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d10.png)
- pointLight(v1, v2, v3, x, y, z)
- directionalLight(v1, v2, v3, nx, ny, nz)
- spotLight(v1, v2, v3, x, y, z, nx, ny, nz, angle, concentration)
``` java
pointLight( 255, 0, 0, // Color
            300, -150, 0); // Position
directionalLight( 0, 255, 0, // Color
                  1, 0, 0); //X, Y, Z direction
spotLight(0, 0, 255, // Color
          0, 40, 300, //Position
          0, -0.5, -0.5, // Direction
          PI/2, 2); // Angle, concentration
```
- [完整的源程序：threeD_10_lighting](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_10_lighting)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d11.png)
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d11_stroke.png)
- vertex(x, y, z, u, v);
``` java
img = loadImage("sunflower.jpg");
float angle = 372.0 / textureRes;
for(int i = 0; i < textureRes; i++){
    textureX[i] = cos(radians(i * angle));
    textureY[i] = sin(radians(i * angle));
}

...

beginShape(QUAD_STRIP);
  texture(img);
  for(int i = 0; i < textureRes; i++){
    float x = textureX[i] * 100;
    float z = textureY[i] * 100;
    float u = img.width / textureRes * i;
    vertex(x, -100, z, u, 0);
    vertex(x, 100, z, u, img.height);
  }
endShape();
```
- [完整的源程序：threeD_11_texture](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_11_texture)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/3d12.png)
- beginShape(TRIANGLE_STRIP);
- vertex(x, y, z, u, v);
``` java
void textureSphere(float rx, float ry, float rz, PImage t) { 
  // These are so we can map certain parts of the image on to the shape 
  float changeU = t.width/(float)(numPointsW-1); 
  float changeV = t.height/(float)(numPointsH-1); 
  float u = 0;  // Width variable for the texture
  float v = 0;  // Height variable for the texture

  beginShape(TRIANGLE_STRIP);
  texture(t);
  for (int i = 0; i < (numPointsH-1); i++) {  // For all the rings but top and bottom
    // Goes into the array here instead of loop to save time
    float coory = coorY[i];
    float cooryPlus = coorY[i+1];

    float multxz = multXZ[i];
    float multxzPlus = multXZ[i+1];

    for (int j = 0; j < numPointsW; j++) {  // For all the pts in the ring
      normal(coorX[j]*multxz, coory, coorZ[j]*multxz);
      vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
      normal(coorX[j]*multxzPlus, cooryPlus, coorZ[j]*multxzPlus);
      vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
      u += changeU;
    }
    v += changeV;
    u = 0;
  }
  endShape();
}
```
- [完整的源程序：threeD_12_texture_globe](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/basic%203D%20examples/threeD_12_texture_globe)



## 3d application examples
![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/texture_fishControl.png)
```java
void renderShape() {
  for (int i = 0; i < numPoints - 1; i++) {
    beginShape();
    texture(skin);
    //    u, v coordinates are
    //    0  1
    //    2  3 
    //    xOffset *i = U position of the beginning of the image slice
    vertex(vertices[i * 2][0], vertices[i * 2][1], skinXspacing * i, 0);
    //    xOffset * i + xOffset = U position of the end of the image slice 
    vertex(vertices[i * 2 + 2][0], vertices[i * 2 + 2][1], skinXspacing * i + skinXspacing, 0);
    //    V coords are either 0 or the height of the image 
    vertex(vertices[i * 2 + 3][0], vertices[i * 2 + 3][1], skinXspacing * i + skinXspacing, skin.height);   
    vertex(vertices[i * 2 + 1][0], vertices[i * 2 + 1][1], skinXspacing * i, skin.height);

    endShape();
  } 
}
```
- [textureFishControl](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/FishControl)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/heightmap.png)
```java
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
```
- [heightmap_mesh_v2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/heightmap_mesh_v2)



![img](https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week05/sourceImage/twistedCylinder.png)
```java
beginShape(TRIANGLES);
  for (int j = 0; j < cylinderHeightSection; j ++) {
    for (int i = 0; i < sectionSideNum; i ++) {
      float x11 = sectionR[j] * cos(theta * i + sectionTwistPhase[j]);
      float y11 = sectionR[j] * sin(theta * i + sectionTwistPhase[j]);
      float x12 = sectionR[j] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]);
      float y12 = sectionR[j] * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j]);

      float x21 = sectionR[j+1] * cos(theta * i + sectionTwistPhase[j+1]);
      float y21 = sectionR[j+1] * sin(theta * i + sectionTwistPhase[j+1]);
      float x22 = sectionR[j+1] * cos(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]);
      float y22 = sectionR[j+1] * sin(theta * ((i+1)%sectionSideNum) + sectionTwistPhase[j+1]);


      float deltaX12 = (x12 - x11) / sideDivision;
      float deltay12 = (y12 - y11) / sideDivision;
      float deltaX22 = (x22 - x21) / sideDivision;
      float deltay22 = (y22 - y21) / sideDivision;

      //beginShape(TRIANGLES);
      for (int k = 0; k < sideDivision; k ++) {
        vertex(x11 + deltaX12 * k, y11 + deltay12 * k, cylinderSectionHeight * j);
        vertex(x21 + deltaX22 * (k+1), y21 + deltay22 * (k+1), cylinderSectionHeight * (j+1));
        vertex(x11 + deltaX12 * (k+1), y11 + deltay12 * (k+1), cylinderSectionHeight * j);

        vertex(x11 + deltaX12 * k, y11 + deltay12 * k, cylinderSectionHeight * j);
        vertex(x21 + deltaX22 * k, y21 + deltay22 * k, cylinderSectionHeight * (j+1));
        vertex(x21 + deltaX22 * (k+1), y21 + deltay22 * (k+1), cylinderSectionHeight * (j+1));
      }
    }
  }
  endShape();
```
- [twistedCylinder_v2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week05/twistedCylinder_v2)
