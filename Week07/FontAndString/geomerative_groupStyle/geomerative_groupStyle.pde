import geomerative.*;
String word = "Design";

void setup() {
  size(600, 400, P2D);
  background(0);
  translate(width/2, 230);
  noFill();
  stroke(255);
  
  // always initialize the library in setup
  RG.init(this);
  RFont font = new RFont( "Consolas.ttf", 150, CENTER);
  
  // Number of segments between each point
  RCommand.setSegmentLength(20);
  
  // Get a polygon for a group of characters
  RGroup grp = font.toGroup(word);
  
  // Convert the word to polygons
  grp = grp.toPolygonGroup();
  
  // Find all the points in the polygon and put in a points array list
  // An array list is a list of values seperated by commas
  RPoint[] pnts = grp.getPoints();

  // Using noise to produce random sizes for the ellipse points
  float noiseSeed = 0;

  // Loop through all the points in the array list
  // Draw an ellipse at the x and y location
  for ( int i = 0; i < pnts.length; i++ ) { 
    float d = noise(noiseSeed);
    ellipse(pnts[i].x, pnts[i].y, d*20, d*20);
    noiseSeed += 0.15;
  }
}
