/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-09-28 09:19:16
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 09:20:23
* @detail
*/
ArrayList<Particle> particles;
ArrayList<PImage> img;
int n, s, maxR;
int indexImg = 0;

void setup() {
  size(800, 800);
  background(#FFEDDA);
  smooth();

  n = 1000;
  s = 20;
  maxR = height/2 - height/10;

  particles = new ArrayList<Particle>();

  img = new ArrayList<PImage>();

  img.add(loadImage("vallege.jpg"));
  img.add(loadImage("colorBrushes.png"));
  img.add(loadImage("colorHikking.png"));
  img.add(loadImage("colorBlocks.png"));
}

void draw() {
  translate(width/2, height/2);
  noStroke();

  if (s > 1) {
    if (particles.size() != 0) {
      for (int i = 0; i < particles.size(); i++) {
        Particle p = particles.get(i);
        p.show();
        p.move();

        if (p.isDead()) particles.remove(i);
      }
    } else {
      s -= 2;
      initParticles();
    }
  }
}

void initParticles() {
  for (int i = 0; i < n; i++) {
    particles.add(new Particle(maxR, s));

    Particle p = particles.get(i);
    int x = int(map(p.pos.x, -maxR, maxR, 0, img.get(indexImg).width));
    int y = int(map(p.pos.y, -maxR, maxR, 0, img.get(indexImg).height));
    p.c = img.get(indexImg).get(x, y);
  }
}

void mousePressed() {
  indexImg = (indexImg + 1) % img.size();
  setup();
}
