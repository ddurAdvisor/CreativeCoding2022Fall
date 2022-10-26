Week07 resource
## Complexity: Self-Similarityon and Fractal

<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/recursionExample_1.png" width=50% height=50%>. 
- 递归

``` java
int factorial(int n) {
  if (n == 1) {
    return 1;
  } else {
    return n * factorial(n-1);
  }
}
```
- [完整的源程序：recursionExample_1](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/recursionExample_1)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/basicrecursion.png" width=50% height=50%>. 
- 递归

``` java
void drawCircle(int x, int y, float radius){
  fill(map(radius,0,200,0,255),200,100);
  ellipse(x,y,radius*2,radius*2);
  if(radius>2){
    radius *=0.75;
    drawCircle(x,y,radius);
  }
}
```
- [完整的源程序：basicrecursion](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/basicrecursion)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/basicrecursion2.png" width=50% height=50%>. 
- 递归

``` java
//make new subroutine to draw Circle recursively
void drawCircle(float x, float y, float radius){
  noFill();
  ellipse(x,y,radius,radius);
  //make a condition to activate the command if the radius is bigger than 2
  if(radius>2){
    drawCircle(x+radius/2,y,radius/2);
    drawCircle(x-radius/2,y,radius/2);
  }
}
```
- [完整的源程序：basicrecursion2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/basicrecursion2)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/recursionExample_2.png" width=50% height=50%>. 
- 递归

``` java
void drawCircle(float x, float y, float radius) {
	stroke(0);
	noFill();
	ellipse(x, y, radius, radius);

	if(radius > 2) {
						//drawCircle() calls itself twice, creating a
						//branching effect. For every circle, a
						//smaller circle is drawn to the left and the
						//right.
		drawCircle(x + radius/2, y, radius/2);
		drawCircle(x - radius/2, y, radius/2);
	}
}
```
- [完整的源程序：recursionExample_2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/recursionExample_2)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/basicFractal1.png" width=50% height=50%>. 
- 递归
- cantorSet

``` java
void cantor(float x, float y, float len) {
  
  float h = 30;
  
  // recursive exit condition
  if (len >= 1) {
    // Draw line (as rectangle to make it easier to see)
    noStroke();
    fill(map(len, 0,width, 100,255),100,100);
    rect(x, y, len, h/3);
    // Go down to next y position
    y += h;
    // Draw 2 more lines 1/3rd the length (without the middle section)
    cantor(x, y, len/3);
    cantor(x+len*2/3,y, len/3);
    //cantor(x+len*2/5, y, len*3/5);
    
  }
}
```
- [完整的源程序：basicFractal1](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/basicFractal1)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/basicFractal2.png" width=50% height=50%>. 
- 递归
- rfractal

``` java
void fractal(float dia, float x, float y) {   
  color col = color(map(dia, 0, 100,150,255),200,100);
  fill(col);
  ellipse(x,y,dia,dia);
  
  float odia = dia;
  dia *= 0.6;
  
  if (dia > 5) {
    pushMatrix();
    translate((odia/2+dia/2)*cos(radians(frameCount)),(odia/2+dia/2)*sin(radians(frameCount)));
    fractal(dia,x,y);
    popMatrix();
    
    pushMatrix();
    translate((odia/2+dia/2)*cos(radians(frameCount*2)+radians(180)),(odia/2+dia/2)*sin(radians(frameCount*2)+radians(180)));
    fractal(dia,x,y);
    popMatrix();
    
    pushMatrix();
    translate((odia/2+dia/2)*cos(-radians(frameCount*3)),(odia/2+dia/2)*sin(-radians(frameCount*3)));
    fractal(dia,x,y);
    popMatrix();
  }
}
```
- [完整的源程序：basicFractal2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/basicFractal2)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/basicFractal3.png" width=50% height=50%>. 
- 递归
- branch

``` java
void branch(float len) {   
  line(0, 0, 0, -len);
  translate(0, -len);

  len *= 0.65;
  float theta = map(mouseY, 0, height, 0, PI);
  
  if (len > 10) {
    pushMatrix();
    rotate(theta);
    branch(len);       // call myself to draw new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
    
  }
}
```
- [完整的源程序：basicFractal3](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/basicFractal3)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/drawTree.png" width=50% height=50%>. 
- 递归

``` java
//making a subroutine to draw 2D Tree
//parameter x stands for the x position of the starting point of the branch
//parameter y stands for the y position fo the starting point of the branch
//parameter branch used for calculating the length and direction(angle) of the branch
void drawTree(float x, float y, PVector branch){
  //setting the condition to activate the command only if the branch size is bigger than 10
  if(branch.mag()>10){
    //make new PVector using the parameter x and y
    PVector ps = new PVector(x,y);
    //make another PVector copying the previous vector.
    PVector pe = ps.get();
    //add branch vector to copied vector to move the vector to the endpoint of the branch.
    pe.add(branch);
    //draw line between start point and end point.
    line(ps.x,ps.y,pe.x,pe.y);
    
    //make a new PVector copied from the branch vector
    PVector br1 = branch.get();
    //scale down the branch length. this is important since branch's length has to be less than 10 sometime to exit the subroutine using the condition
    br1.mult(0.75);
    //rotate the vector using custom rotation function. seems like the PVector.rotate() func doesn't work on mac.
    br1 = ROT(br1,radians(mouseY));
    //call yourself with new parameter. use endpoint of the previous branch as the new starting point and feed the br1 as the new branch info.
    drawTree(pe.x,pe.y,br1);
    
    //make another branch with different angle
    PVector br2 = branch.get();
    br2.mult(0.75);
    br2 = ROT(br2,radians(-mouseY));
    drawTree(pe.x,pe.y,br2);
  }
}
```

```java
//custom rotation function
PVector ROT(PVector p,float ang){
  PVector pr = new PVector(p.x*cos(ang)-p.y*sin(ang),p.x*sin(ang)+p.y*cos(ang));
  return pr;
}
```

- [完整的源程序：drawTree](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/drawTree)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/bit2atom200106a_fractal_triangle.png" width=50% height=50%>. 
- 递归
- fractal

``` java
void fractal(int k) {
  PVector tmp = PVector.sub(points[k], seed);
  tmp.mult(bias);
  seed.add(tmp);
}
```
- [完整的源程序：bit2atom200106a_fractal_triangle](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/bit2atom200106a_fractal_triangle)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/recursionPattern_1.png" width=50% height=50%>. 
- 递归

``` java
void f(float x, float y, float r, float d) {
  if (d>3) {
    line(x, y, x+=cos(r)*d, y-=sin(r)*d);
    f(x, y, r+y/99+t, d/1.5);
    f(x, y, r-y/99-t, d/1.5);
  }
}
```
- [完整的源程序：recursionPattern_1](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/recursionPattern_1)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/recursionPattern_2.png" width=50% height=50%>. 
- 递归

``` java
void f(float x, float y, float r, float d) {
  if (d>9) {
    circle(x+=cos(r)*d, y+=sin(r)*d, d/2);
    f(x, y, r+d/99+t, d*.7);
    f(x, y, r-d/99-t, d*.7);
  }
}
```
- [完整的源程序：recursionPattern_2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/recursionPattern_2)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/recursionPattern_3.png" width=50% height=50%>. 
- 递归

``` java
void f(float x, float y, float r, float d) {
  if (d>5) {
    circle(x+=cos(r)*d, y+=sin(r)*d, d/9);
    f(x, y, r+d*d+t, d*.8);
    f(x, y, r-d*d-t, d*.8);
  }
}
```
- [完整的源程序：recursionPattern_3](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/recursionPattern_3)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/drawTree_3D.png" width=50% height=50%>. 
- 递归
- 3D

``` java
//here is the subroutine for drawing tree recursively.
//parameter x stands for the x position of starting point of the branch.
//parameter y stands for the y position of starting point of the branch.
//parameter z stands for the z position of starting point of the branch.
//parameter branch used for calculating the length and direction of the branch line.
void drawTree(float x, float y,float z, PVector branch){
  //activate the command only if the length of the branch is bigger than 10
  if(branch.mag()>10){
    //make a new PVector with input parameter x, y, z.
    PVector ps = new PVector(x,y,z);
    //make another PVector copied from the one you have just made.
    PVector pe = ps.get();
    //vector addition to the previous PVector with branch vector you have input.
    //this will move the PVector pe to the end point of the branch.
    pe.add(branch);
    //change the color of the branch line by the length of the branch
    stroke(map(branch.mag(),10,50,0,255),150,0,map(branch.mag(),10,80,120,255));
    //draw line between start point and end point which makes a branch 
    line(ps.x,ps.y,ps.z,pe.x,pe.y,pe.z);
    //adding line position inside the arraylist as Strings for exporting later.
    allLines.add(ps.x+","+ps.y+","+ps.z+","+pe.x+","+pe.y+","+pe.z);
    
    //set the rotation radius for the next branch.
    float rad = radians(mouseY);
    
    //copy the branch vector
    PVector br1 = branch.get();
    //scale down the branch's length. this will be used for next branch.
    //this is important since you have set the condition which depends on the length of the branch.
    br1.mult(0.75);
    //rotate the branch on xy plane using the custom made rotation function.
    br1 = ROT(br1,rad);
    //rotate the branch on xz plane using the custom made rotation function.
    br1 = zROT(br1,rad);
    //feed this newly made br1 branch vector to own subroutine drawTree() using 
    //the endpoint of the previous branch you had as the start point for the next branch.
    drawTree(pe.x,pe.y,pe.z,br1);
    br1 = zROT(br1,-rad*2);
    drawTree(pe.x,pe.y,pe.z,br1);
    
    PVector br2 = branch.get();
    br2.mult(0.75);
    br2 = ROT(br2,-rad);
    br2 = zROT(br2,rad);
    drawTree(pe.x,pe.y,pe.z,br2);
    br2 = zROT(br2,-rad*2);
    drawTree(pe.x,pe.y,pe.z,br2);
  }
}
```
- [完整的源程序：drawTree_3D](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/drawTree_3D)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/LSystem01.png" width=50% height=50%>. 
- LSystem

``` java
// Traverse the current String and make the new one.
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if (c == 'A') {
      next += "AB";
    }  else if (c == 'B') {
      next += "A";
    }
  }
```
- [完整的源程序：LSystem01](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/LSystem01)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/L_SystemTree_v1.png" width=50% height=50%>. 
- LSystem

``` java
void drawHouse(float x1, float x2, float y, int level) {
  if (level > 0) {
    float angle = (mouseX/(float)width) * (PI/3.0);
    float w = x2 - x1;
    float dy = w/2 * tan(angle);

    quad(x1, y, x2, y, x2, y-w, x1, y-w);
    if (drawRoof) {
      triangle(x1, y-w, x2, y-w, x1+w/2, y-w-dy);
    }
    float d = dist(x2, y-w, x1+w/2, y-w-dy);

    // left branch
    pushMatrix();
    translate(x1, y-w);
    rotate(-angle);
    drawHouse(0, d, 0, level-1);
    popMatrix();

    // right branch
    pushMatrix();
    translate(x2, y-w);
    rotate(angle);
    drawHouse(-d, 0, 0, level-1);
    popMatrix();
  }
}
```
- [完整的源程序：L_SystemTree_v1](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/L_SystemTree_v1)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/recursionCircleTree.png" width=50% height=50%>. 
- 递归

``` java
public class Tracer{
  float angle , rad , step , shrink;
  PVector pos , pPos;
  boolean ALIVE;
  
  Tracer()  {
    //angle = random(-PI,0);
    angle = random(-1.6,-1.53);
    rad = random(3,7);
    step = random(-.1,.1);
    while(step<.02&&step>-.02) step = random(-.1,.1);
    shrink = map(rad,5,8,.98,.995);//random(.98,1);
    pos = new PVector(width/2 , random(height/2,height*3/4));
    pPos = new PVector(0,0);
    pPos.set(pos);
    ALIVE = true;
  }
  
  Tracer(Tracer trcr)  {
    angle = trcr.angle;
    rad = trcr.rad;
    step = new Float(-trcr.step);
    shrink = map(rad,5,8,.98,.999);
    pos = new PVector(trcr.pos.x,trcr.pos.y);
    pPos = new PVector(trcr.pos.x,trcr.pos.y);
    ALIVE = true;
  }
  
  void draw()  {
    strokeWeight(2);
    stroke(0);
    line(pos.x , pos.y , pPos.x , pPos.y);
  }
  
  void calculate()  {
    pPos.set(pos);
    pos.x += rad*cos(angle);
    pos.y += rad*sin(angle);
    angle+=step;
    rad*=shrink;
    if (rad<.01||angle>8*TWO_PI||angle<-8*TWO_PI)    {
      ALIVE = false;
      noStroke();
      fill(100,30,30);
      ellipse(pos.x,pos.y,4,4);
    }
  }  
}
```
- [完整的源程序：recursionCircleTree](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/recursionCircleTree)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/recursionCherryTreeBlossom.png" width=50% height=50%>. 
- 递归

``` java
public class Branch {
  public int generation;
  public int steps;
  private int maxSteps;
  private float stepLength;
  public Position position;
  public float angle;
  public float maxAngleVar = 0.2;
  public boolean active = true;
  Branch(int gen, int mstep, Position p, float ang) {
    this.generation = gen;
    this.maxSteps = mstep;
    this.steps = mstep;
    this.stepLength = 100.0/(this.generation+1);
    this.position = p;
    this.angle = ang;
  }
  public void drawStep() {
    float r = random(-1, 1);
    this.angle = this.angle + this.maxAngleVar*r;
    this.stepLength = this.stepLength - this.stepLength*0.2;
    Position oldPosition = new Position(0.0, 0.0);
    oldPosition.x = this.position.x;
    oldPosition.y = this.position.y;
    this.position.x += this.stepLength*cos(this.angle);
    this.position.y -= this.stepLength*sin(this.angle);
    strokeWeight(floor(20/(this.generation+1)));
    line(oldPosition.x, oldPosition.y, this.position.x, this.position.y);
    this.steps = this.steps - 1;
  }
  public Branch generateChild(int cn) {
    int newGen = this.generation + 1;
    float angleShift = 0.5;
    if (cn == 1) {
      angleShift = angleShift*(-1);
    }
    float childAngle = this.angle+angleShift;
    float px = this.position.x;
    float py = this.position.y;
    Position parentPos = new Position(px, py);
    Branch child = new Branch(newGen, floor(random(1, 4)), parentPos, childAngle);
    return child;
  }
}
```
- [完整的源程序：recursionCherryTreeBlossom](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/recursionCherryTreeBlossom)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/treeSketch.png" width=50% height=50%>. 
- 递归
- fractal

``` java
void branch(float x_, float y_, float a_, float s_) {
    strokeWeight(s_/16);
    float a = random(-PI/16, PI/16)+a_;
    float nx = cos(a)*s_+x_;
    float ny = sin(a)*s_+y_;
    stroke(32, 16*s_);
    //line(x_, y_, nx, ny);
    int ay = (int)(y_+ ny)/2;
    smooth();
    noFill();
    bezier(x_, y_, x_, ay, nx, ay, nx, ny);
    if (s_>10) {
      branch(nx, ny, a_-random(PI/4), s_*random(0.6, 0.8));
      branch(nx, ny, a_, s_*random(0.6, 0.8));
      branch(nx, ny, a_+random(PI/4), s_*random(0.6, 0.8));
    } 
    else {
      float w = random(155, 255);
      stroke(random(155, 255), w, w, random(32, 192));
      strokeWeight(random(0, 8));
      point(nx+random(-2, 2), ny+random(-2, 2));
    }
  }
```
- [完整的源程序：treeSketch](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/treeSketch)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/skyAndLeaves.png" width=50% height=50%>. 
- 递归
- branch; leaves; wind;

``` java
class branch{
  float x, y, theta, startingThickness;
  float theta0;
  float[] thetas;
  int index = -1; //this tells what segment the branch has spawned at.
              // if it's -1, it's the root.
  float segmentLength;
  ArrayList myChildren;
  ArrayList myLeaves;
  
  //this one's to generate a parent branch!
  branch(int index0, float thetaI, float totalLength, 
             float startingThickness0){
    index = index0;
    myChildren = new ArrayList();
    myLeaves = new ArrayList();
    segmentLength = totalLength/nSegments;
    startingThickness = startingThickness0;
    
    theta0 = thetaI;
    thetas = new float[nSegments]; //r,theta
    thetas[0] = theta0;
    for(int i=1; i<nSegments; i++){
      thetas[i] = thetas[i-1]+randomSign()*random(maxdThetaWander);
    }
    
    //this'll spawn the baby branches!
    for(int i=1; i<nSegments; i++){
      if(startingThickness*(1-(float)i/nSegments)> minBranchThickness &&
         (float)i/nSegments > minSpawnDistance &&
          random(1)<branchSpawnOdds){//add a baby!
            myChildren.add(new branch(i, thetas[i]+randomSign()*random(mindThetaSplit, maxdThetaSplit),
                                      totalLength*(1-(float)i/nSegments),
                                      startingThickness*(1-(float)i/nSegments)));
          }
    }
    
    //this'll add leaves!
    for(int i=1; i<nSegments; i++){
      if(startingThickness*(1-(float)i/nSegments)< maxBranchSizeForLeaves &&
         random(1)<leafSpawnOdds)
         myLeaves.add(new leaf(thetas[i],i));
    }
  }

  //gives the location of the nth node
  float[] getCoordsOf(int n){
    float x2 = x;
    float y2 = y;
    for(int i=0; i<n; i++){
      x2 += segmentLength*cos(thetas[i]);
      y2 += segmentLength*sin(thetas[i]);
    }
    return new float[]{x2,y2};
  }
  
  void rotate(float dTheta){
    //rotate myself
    for(int i=0; i<nSegments; i++)
      thetas[i]+=dTheta;
    //rotate my leaves
    for(int i=0; i<myLeaves.size(); i++)
      ((leaf)myLeaves.get(i)).rotate(dTheta);
    //rotate my children
    for(int i=0; i<myChildren.size(); i++)
      ((branch)myChildren.get(i)).rotate(dTheta);
  }
  
  void rotateDueToWind(){
    float dThetaWind = (thetas[0]-windDirection);
    float dThetaBranch = (thetas[0]-theta0);
    
    if(dThetaWind>PI)
      dThetaWind = -(TWO_PI-dThetaWind);
    else if(dThetaWind<-PI)
      dThetaWind = TWO_PI+dThetaWind;

    if(dThetaBranch>PI)
      dThetaBranch = -(TWO_PI-dThetaBranch);
    else if(dThetaBranch<-PI)
      dThetaBranch = TWO_PI+dThetaBranch;
    
    float forceOfBranch = -(thetas[0]-theta0)*startingThickness/maxBranchThickness;
    float forceOfWind = -windVelocity*sin(dThetaWind)/10;
    //this moves the branch
    rotate((forceOfBranch+forceOfWind)/20);

    //this moves the leaves!
    for(int i=0; i<myLeaves.size(); i++)
      ((leaf)myLeaves.get(i)).moveFromWind();

    //this'll rotate the children
    for(int i=0; i<myChildren.size(); i++)
      ((branch)myChildren.get(i)).rotateDueToWind();
  }
  
  void drawBranch(float[] coords){
    x = coords[0];
    y = coords[1];
    float x1 = x;
    float y1 = y;
    float x2,y2;
    for(int i=0; i<nSegments; i++){
      x2 = x1+segmentLength*cos(thetas[i]);
      y2 = y1+segmentLength*sin(thetas[i]);
      strokeWeight(startingThickness*(1-(float)i/nSegments));
      line(x1,y1,x2,y2);
      x1 = x2;
      y1 = y2;
    }
    //draw children
    for(int i=0; i<myChildren.size(); i++)
      ((branch)myChildren.get(i)).drawBranch(getCoordsOf(((branch)myChildren.get(i)).index));
  }
  
  void drawLeaves(float[] coords){
    for(int i=0; i<myLeaves.size(); i++)
      ((leaf)myLeaves.get(i)).draw(getCoordsOf(((leaf)myLeaves.get(i)).index));
    //draw children's leaves
    for(int i=0; i<myChildren.size(); i++)
      ((branch)myChildren.get(i)).drawLeaves(coords);
  }
}
```
- [完整的源程序：skyAndLeaves](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/skyAndLeaves)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/treeTerrian_3D.png" width=50% height=50%>. 
- Tree
- mouse rotate

``` java
//branches
  void drawBranch (float radius){
    for (int i = 0; i < TWO_PI; i++){
      x = initPos.x + radius * cos(theta);
      z = initPos.z + radius * sin(theta);
      coords.add(x);
      coords.add(z);
      theta += 1;
    }
  }
```
- [完整的源程序：treeTerrian_3D](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/treeTerrian_3D)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/fractal_mandelbrotSet.png" width=50% height=50%>. 
- mandelbrotSet

``` java
while ((r*r+i*i<4)&&n<255) {
        t=r*r-i*i+a;
        i=2*r*i+b;
        r=t;
        n++;
      }
```
- [完整的源程序：fractal_mandelbrotSet](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/fractal_mandelbrotSet)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/fractal_mandelbrotSet_3D.png" width=50% height=50%>. 
- mandelbrotSet
- 3D

``` java
while ((r*r+i*i<4)&&n<d) {
      t=r*r-i*i+x/d-1;
      i=2*r*i+y/d;
      r=t;
      n++;
    }
```
- [完整的源程序：fractal_mandelbrotSet_3D](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/fractal_mandelbrotSet_3D)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/DLA_2d_diffusion_limited_aggregation.png" width=50% height=50%>. 
- translate();
- rotateX(); rotateY(); 

``` java
void myset(PVector pos){
  int x = int(pos.x + width/2);
  int y = int(pos.y + height/2);
  for (int i = x - 1; i <= x + 1; i++) {
    for (int j = y - 1; j <= y + 1; j++) {
      if (get(i,j) != white) {
        set(i,j,gray);
      }
    }
  }
  set(x,y,white);
  // set new system radius if appropriate
  float m = pos.mag();
  if (m * 2.0 >= system_radius) {
    system_radius = m * 2.0;
  }
}
```
- [完整的源程序：DLA_2d_diffusion_limited_aggregation](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/DLA_2d_diffusion_limited_aggregation)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/bit2atom200116a_DLA_lines_2.png" width=50% height=50%>. 
- DLA: diffusion-limited aggregation

``` java
void touch() {
    agents.get(0).agentTouch = true;

    for (Agent a : agents) {
      if (this != a && a.agentTouch && !this.agentTouch) {
        float dd = PVector.dist(this.location, a.location);
        if (dd <= (this.diameter+a.diameter)/2) {
          this.agentTouch = true;
          //connected.add(this);
          pair.add(new PVector(this.agentIndex, a.agentIndex));
          order ++;
          agentOrder = order + 1;
        } else {
          this.agentTouch = false;
        }
      }
    }
  }

  void drawConnection() {
    if (pair != null) {
      for (PVector p : pair) {
        stroke(255);
        float sw = map(agentOrder, 0, agents.size(), 10, 1);
        strokeWeight(sw);
        line(agents.get((int)p.x).location.x, agents.get((int)p.x).location.y, 
          agents.get((int)p.y).location.x, agents.get((int)p.y).location.y);
      }
    }
```
- [完整的源程序：bit2atom200116a_DLA_lines_2](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/bit2atom200116a_DLA_lines_2)



<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week07/sourceImage/bit2atom200116a_DLA_lines_3.png" width=50% height=50%>. 
- DLA: diffusion-limited aggregation
- outout PDF and SVG

``` java
void touch() {
    agents.get(0).agentTouch = true;

    for (Agent a : agents) {
      if (this != a && a.agentTouch && !this.agentTouch) {
        float dd = PVector.dist(this.location, a.location);
        if (dd <= (this.diameter+a.diameter)/2) {
          this.agentTouch = true;
          //connected.add(this);
          pair.add(new PVector(this.agentIndex, a.agentIndex));
          order ++;
          agentOrder = order + 1;
        } else {
          this.agentTouch = false;
        }
      }
    }
  }

  void drawConnection() {
    if (pair != null) {
      for (PVector p : pair) {
        stroke(255);
        float sw = map(agentOrder, 0, agents.size(), diameter, 1);
        strokeWeight(sw);
        line(agents.get((int)p.x).location.x, agents.get((int)p.x).location.y, 
          agents.get((int)p.y).location.x, agents.get((int)p.y).location.y);
      }
    }
  }
```
- [完整的源程序：bit2atom200116a_DLA_lines_3](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week07/bit2atom200116a_DLA_lines_3)
