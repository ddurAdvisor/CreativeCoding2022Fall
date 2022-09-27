public class Particle
{
  // particle data
  PVector pos;
  PVector vel;
  PVector acc;
  PVector prev_pos;
  float max_speed;
  float[] rgb;

  // CONSTRUCTOR //
  public Particle(PVector start_pos, float max_speed, float[] rgb)
  {
    this.rgb       = rgb;
    this.pos       = start_pos;
    this.max_speed = max_speed;

    // this.vel = PVector.random2D();
    this.vel       = new PVector(0, 0);
    this.acc       = new PVector(0, 0);
    this.prev_pos  = this.pos.copy();
  }

  // runs all updates and shows particle
  void run()
  {
    this.update();
    this.edges();
    this.show();
  }

  // update this particle
  void update()
  {
    this.vel.add(this.acc);
    this.vel.limit(this.max_speed);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  // apply a vector force to this particle
  void apply_force(PVector force)
  {
    this.acc.add(force);
  }

  // wrapping function
  void edges()
  {
    // x wrapping
    if (this.pos.x > width)
    {
      this.pos.x = 0;
      this.update_prev_pos();
    }
    else if (this.pos.x < 0)
    {
      this.pos.x = width;
      this.update_prev_pos();
    }

    // y wrapping
    if (this.pos.y > height)
    {
      this.pos.y = 0;
      this.update_prev_pos();
    }
    else if (this.pos.y < 0)
    {
      this.pos.y = height;
      this.update_prev_pos();
    }
  }

  // update previous vector location
  void update_prev_pos()
  {
    this.prev_pos.x = this.pos.x;
    this.prev_pos.y = this.pos.y;
  }

  // look up vector force and apply to particle
  void follow(FlowField flowfield)
  {
    int x         = floor(this.pos.x / flowfield.scl);
    int y         = floor(this.pos.y / flowfield.scl);
    int index     = x + y * flowfield.col;
    PVector force = flowfield.v_field[index];
    this.apply_force(force);
  }

  // clamp a value between two other values
  float clamp(float value, float minimum, float maximum)
  {
    if (value > maximum)
    {
      value = maximum;
    }
    else if (value < minimum)
    {
      value = minimum;
    }
    return value;
  }

  // change color as frame progresses
  void update_color()
  {
    // choose a random channel to change
    int channel       =  round(random(0, 2));
    this.rgb[channel] += random(-10, 10);
    this.rgb[channel] =  clamp(this.rgb[channel], 0.0, 255.0);
  }

  // draw the particle
  void show()
  {
    this.update_color();
    stroke(this.rgb[0], this.rgb[1], this.rgb[2], 255);
    strokeWeight(1);
    line(this.pos.x, this.pos.y,
         this.prev_pos.x, this.prev_pos.y);

    this.update_prev_pos();
  }
}
