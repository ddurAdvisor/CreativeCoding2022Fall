public class FlowField
{
  PVector[] v_field;
  float inc = 0.002;
  float z_inc = 0.004;
  float z_off = 0;
  float scl;
  int col, row;

  float noise_scale = 10;

  FlowField(int resolution)
  {
    scl = resolution;
    col = floor(width / resolution) + 1;
    row = floor(height / resolution) + 1;
    v_field = new PVector[col * row];
  }

  void update()
  {
    float x_off = 0;
    z_off += noise_scale;
    for (int y = 0; y < row; y++)
    {
      x_off += noise_scale;
      float y_off = 0;
      for (int x = 0; x < col; x++)
      {
        y_off += noise_scale;
        // make new angle from noise
        float angle = noise(x_off*inc/noise_scale,
                            y_off*inc/noise_scale,
                            z_off*z_inc/noise_scale) * TWO_PI * 4;
        // set into v_field
        PVector v = PVector.fromAngle(angle);
        v.setMag(5);
        int index = x + y * col;
        v_field[index] = v;
      }
    }
  //    inc += 0.0001;
  }

  // show vector field
  void show()
  {
    for (int y = 0; y < row; y++)
    {
      for (int x = 0; x < col; x++)
      {
        // get vector from list
        int index = x + y * col;
        PVector v = v_field[index];

        // draw stroke
        stroke(255);
        strokeWeight(1);

        // push pop matrix transforms
        pushMatrix();
        translate(x * scl, y * scl);
        rotate(v.heading());
        line(0, 0, scl, 0);
        popMatrix();
      }
    }
  }
}
