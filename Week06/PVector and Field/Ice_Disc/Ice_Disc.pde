ArrayList Lines; 
Line L1; 
Line L2; 
PVector I; 
float radius; 
 
float anglerange = 0.6; 
int numlines = 200; 
 
void setup(){ 
  size(800,800); 
  background(255); 
  smooth(); 
  strokeWeight(1.0); 
  radius = width*0.45; 
  Lines = new ArrayList(); 
  firstLine();
} 
 
void draw(){ 
  background(150); 
  translate(width/2,height/2); 
 
  stroke(255); 
  for (int l=0; l<Lines.size(); l++){ 
    Line L = (Line) Lines.get(l); 
    //strokeWeight(5/(1 + l*0.01)); 
    L.render(l); 
  } 
  addLine(); 
  saveFrame("design/ice-####.tif");
} 
 
 
void firstLine(){ 
  float theta = random(TWO_PI); 
  float sx = cos(theta)*radius; 
  float sy = sin(theta)*radius; 
 
  float delta = theta + PI + random(-anglerange,anglerange); 
  float sx2 = cos(delta)*radius; 
  float sy2 = sin(delta)*radius; 
 
  Line L = new Line(new PVector(sx,sy), new PVector(sx2,sy2)); 
  Lines.add(L); 
} 
 
void addLine(){ 
  if (Lines.size() > numlines) { 
    return; 
  } 
 
  float theta = random(TWO_PI); 
  float sx = cos(theta)*radius; 
  float sy = sin(theta)*radius; 
 
  float delta = theta + PI + random(-anglerange,anglerange); 
  float sx2 = cos(delta)*radius; 
  float sy2 = sin(delta)*radius; 
 
  Line L = new Line (new PVector(sx,sy),new PVector(sx2,sy2)); 
  float nearestIntDist = 1000; 
  PVector nearestIntPoint = null; 
  for (int l=0; l<Lines.size(); l++){ 
    Line CL = (Line) Lines.get(l); 
    PVector Int = CL.findIntersection(L); 
    if (Int != null){ 
      if (PVector.dist(Int,L.p1) < nearestIntDist) { 
        nearestIntPoint = Int; // if this intersection is closer, set the nearestInt    
        nearestIntDist = PVector.dist(Int,L.p1); 
      } 
    } 
  } 
  if (nearestIntPoint != null) { 
    L.p2 = nearestIntPoint; 
    Lines.add(L); 
  } 
} 
 
void keyPressed(){ 
  reset(); 
} 
 
void reset(){ 
  Lines.clear(); 
  anglerange = random(0.2,1.5); 
  firstLine(); 
} 
