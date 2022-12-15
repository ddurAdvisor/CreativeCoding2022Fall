PImage back, base, bar, handle, tip; //static images
int activeSlider = -1; //keeps track of which slider being adjusted
Slider attraction, repulsion, repulsionDistance, count, friction, limiter; //slider controls
int particleMax = 200;

void setup() {
    size(600, 400);
    UI();
}

void draw() {
    background(0);

    //check each slider
    fill(255);
    ellipse(width/2, height/2, count.val * 2, count.val * 2);

    UIUpdate();
}

void UI() {
    //load static images
    back = loadImage("back.jpg");
    base = loadImage("base.png");
    bar = loadImage("bar.png");
    handle = loadImage("handle.png");
    tip = loadImage("tip.png");

    setupSliders(); //setup the sliders (duh)
}

void UIUpdate() {
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
    UIEvent();
}

void UIEvent() {
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
    int pos = 15;

    count = new Slider(10, pos, 0);
    count.label = "Particle Count";
    count.flagShowPercent = false;
    count.setLimits(10, particleMax);
    count.val = 80;
    pos += base.height + 15;

    repulsion = new Slider(10, pos, 1);
    repulsion.label = "Particle Repulsion Strength";
    repulsion.val = .5;  
    pos += base.height + 15;

    repulsionDistance = new Slider(10, pos, 2);
    repulsionDistance.label = "Particle Repulsion Distance";
    repulsionDistance.flagShowPercent = false;
    repulsionDistance.setLimits(10, 40);
    repulsionDistance.val = 20;
    pos += base.height + 15;

    friction = new Slider(10, pos, 3);
    friction.label = "Particle Friction";
    friction.val = .1;
    pos += base.height + 15;

    limiter = new Slider(10, pos, 4);
    limiter.label = "Particle Speed Limiter";
    limiter.val = .25;
    pos += base.height + 15;

    attraction = new Slider(10, pos, 5);
    attraction.label = "Mouse Attraction Strength";
    attraction.val = .75;
}

//================================================================