
float rotationX, rotationY, velocityX, velocityY = 0;
ArrayList trees = new ArrayList();

void setup() {
  size(800, 600, P3D);
  for (int i = 0; i < 120; i++){
    trees.add( new Tree( random(50, 160), new PVector(random(-400, 400), 0, random(-400, 400)) ) );
  }
}

void draw(){
  background(242);
  
  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.95;
  velocityY *= 0.95;

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(radians(-TWO_PI-rotationX));
  rotateY(radians(-rotationY));

  for (int i = 0; i < trees.size(); i++) {
    Tree tree = (Tree) trees.get(i);
    tree.render();
  }
  popMatrix();

  if (mousePressed) {
    velocityX += (mouseY-pmouseY) * 0.05;
    velocityY -= (mouseX-pmouseX) * 0.05;
  }
}
