/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 18:16:39
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:57:12
* @detail
*/
class bird {
  PVector pos, vel, acc;
  PVector gravity, jump;
  float r = 16;
  float d = r * 2;
  boolean alive = true;
  float[] inputs = new float[5];
  float score = 0;
  float fitness = 0;
  NeuralNetwork brain;
  int castCounter = 0;
  color tintColor = color(random(255), random(255), random(255));

  /**
   * [bird description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:49:53+0800
   * @return   {[type]}                 [description]
   */
  bird() {
    pos = new PVector(width/2, height/2);
    vel = new PVector();
    gravity = new PVector(0, .8);
    jump = new PVector(0, 12);
    score = 0;
    fitness = 0;
    brain = new NeuralNetwork(5, 64, 2);
  }

  /**
   * [bird description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:50:02+0800
   * @param    {[type]}                 NeuralNetwork b             [description]
   * @return   {[type]}                               [description]
   */
  bird(NeuralNetwork b) {
    pos = new PVector(width/2, height/2);
    vel = new PVector();
    gravity = new PVector(0, .8);
    jump = new PVector(0, -12);
    score = 0;
    fitness = 0;
    brain = b.copy();
  }

  /**
   * [mutate description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:50:13+0800
   * @return   {[type]}                 [description]
   */
  void mutate() {
    brain.mutate(.01);
  }

  /**
   * [think description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:50:40+0800
   * @param    {[type]}                 ArrayList<pipe> pipe          [description]
   * @return   {[type]}                                 [description]
   */
  void think(ArrayList<pipe> pipe) {
    pipe closest = null;
    float recordD = Float.POSITIVE_INFINITY;
    for (int i = 0; i < pipe.size(); i++) {
      pipe p = pipe.get(i);
      float d = (p.x+p.w) - pos.x;
      if (d < recordD && d > 0) {
        closest = pipe.get(i);
        recordD = d;
      }
    }

    inputs[0] = pos.y / height;
    inputs[1] = vel.y / 10;
    inputs[2] = closest.top / height;  
    inputs[3] = closest.bottom / width;
    inputs[4] = closest.x / width;
    float[] guess = brain.feedForward(inputs);
    if (guess[0] > guess[1]) {
      jump();
    }
  }

  void show() {
    if (showBird) {
      tint(tintColor);
      image(dover[castCounter%6], pos.x, pos.y, 75, 108);
      castCounter++;
    } else {
      stroke(255);
      fill(255, 100);
      circle(pos.x, pos.y, d);
    }
  }

  void update() {
    score++;
    vel.add(gravity);
    pos.add(vel);
  }

  void jump() {
    vel.add(jump);
  }

  boolean dead() {
    return (pos.y+r > height || pos.y < r);
  }
}
