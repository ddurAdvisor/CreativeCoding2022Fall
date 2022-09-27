FlowField flowfield;
ArrayList<Particle> particles;
PGraphics bg;

boolean debug = false;

void setup()
{
  // size(900, 1000);
  fullScreen(P2D);
  // make flow field
  flowfield = new FlowField(10);
  flowfield.update();
  // make particles
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 10000; i++)
  {
    // random start position
    PVector start_pos = new PVector(random(width), random(height));
    // set particle color
    float[] rgb = new float[] {255.0, 255.0, 255.0};
    // new particle takes pos and max vel
    particles.add(new Particle(start_pos, random(5, 10), rgb));
  }
  background(0);
  // add background object for fade
  bg = createGraphics(width, height);
}

void draw()
{
  //if (debug) background(0);
  bg.beginDraw();
  bg.background(0, 10);
  bg.endDraw();
  image(bg, 0, 0);
  flowfield.update();
  if (debug) flowfield.show();
  if (!debug)
  {
    for (Particle p : particles)
    {
      p.follow(flowfield);
      p.run();
    }
  }
}
