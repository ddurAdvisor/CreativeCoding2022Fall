PImage[] sliderPix = new PImage[4]; //PImage back, base, bar, handle, tip; //static images
int activeSlider = -1; //keeps track of which slider being adjusted
Slider attraction, repulsion, repulsionDistance, count, friction, limiter; //slider controls
int particleMax = 200;

void setup() {
  size(600, 400);
  
  //load static images
  //back = loadImage("back.jpg");
  sliderPix[0] = loadImage("base.png");
  sliderPix[1] = loadImage("bar.png");
  sliderPix[2] = loadImage("handle.png");
  sliderPix[3] = loadImage("tip.png");

  setupSliders(); //setup the sliders (duh)
}

void draw() {
  background(120);
  
  stroke(175);
  strokeWeight(repulsionDistance.val);  
  ellipse(width/2, height/2, count.val * 2, count.val * 2);
  
  //check each slider
  fill(255);
  attraction.check();
  repulsion.check();
  repulsionDistance.check();
  count.check();
  friction.check();
  limiter.check();
}

//================================================================

void mouseReleased() {
  activeSlider = -1; //release slider
}

//================================================================

void mousePressed() {
  //one of our sliders might have been clicked
  if (count.mouseOver()) activeSlider = count.id;
  if (repulsion.mouseOver()) activeSlider = repulsion.id;
  if (repulsionDistance.mouseOver()) activeSlider = repulsionDistance.id;
  if (friction.mouseOver()) activeSlider = friction.id;
  if (limiter.mouseOver()) activeSlider = limiter.id;
  if (attraction.mouseOver()) activeSlider = attraction.id;
}

//================================================================

void setupSliders() {
  //create our sliders and give 'em default values
  int basePositionX = 10;
  int basePositionY = 15;

  count = new Slider(sliderPix, "Particle Count", basePositionX, basePositionY, 0);
  count.flagShowPercent = false;
  count.setLimits(10, particleMax);
  count.val = 80;
  basePositionY += sliderPix[0].height + 15;

  repulsion = new Slider(sliderPix, "Particle Repulsion Strength", basePositionX, basePositionY, 1);
  repulsion.val = .5;  
  basePositionY += sliderPix[0].height + 15;

  repulsionDistance = new Slider(sliderPix, "Particle Repulsion Distance", basePositionX, basePositionY, 2);
  repulsionDistance.flagShowPercent = false;
  repulsionDistance.setLimits(10, 40);
  repulsionDistance.val = 20;
  basePositionY += sliderPix[0].height + 15;

  friction = new Slider(sliderPix, "Particle Friction", basePositionX, basePositionY, 3);
  friction.val = .1;
  basePositionY += sliderPix[0].height + 15;

  limiter = new Slider(sliderPix, "Particle Speed Limiter", basePositionX, basePositionY, 4);
  limiter.val = .25;
  basePositionY += sliderPix[0].height + 15;

  attraction = new Slider(sliderPix, "Mouse Attraction Strength", basePositionX, basePositionY, 5);
  attraction.val = .75;
}