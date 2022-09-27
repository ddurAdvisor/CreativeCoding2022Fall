class Block {
  int indexX;//position of the block: Left Corner X-value
  int indexY;//position of the block: Left Corner Y-value
  int unitSize;//how many units in this block: unitSize * unitSize
  int blockSize;//the side size of this block
  int blockSection;//how many section this block can be divided into
  int sectionScale = 1;
  int blockWeight;//the stroke weight of this block
  int patternAMode;//pattern A: arcs
  int patternBMode;//pattern B: lines
  int patternCMode;//pattern C: folding lines
  int patternBModeType;//pattern B has 2 status: H mode and V mode, and privide 4 types of sub-patterns
  int patternSelection;//the pattern selection index
  //float patternSelectionThrehold = 0.5;
  boolean occpuied;
  color blockColor;//color of stroke of this block

  Block(int idX, int idY, int us, color c) {
    indexX = idX;
    indexY = idY;
    unitSize = us;
    blockColor = c;

    blockSize = elementSize * unitSize;

    if (unitSize > 1) {
      sectionScale = 1;//2;
    }

    blockSection = elementSection * unitSize * sectionScale;
    blockWeight = elementWeight;

    patternSelection = int(random(3));//there are 3 choice of patterns

    patternAMode = int(random(4));//there are 4 status of pattern A

    patternBMode = int(random(2));//there are 2 status of pattern A
    patternBModeType = int(random(5));//and there are 5 types of sub pattern of pattern A

    patternCMode = int(random(4)); //there are 4 status of pattern C
  }

  //the area of this block
  void drawBlock() {
    pushStyle();
    noFill();
    stroke(blockColor);
    strokeWeight(4);
    rect(indexX*elementSize, indexY*elementSize, blockSize, blockSize);
    popStyle();

    pushStyle();
    textAlign(CENTER, CENTER);
    fill(255, 255, 0);
    textSize(24);
    text("block", elementSize * (indexX) + blockSize * 0.5, elementSize * (indexY) + blockSize * 0.5);
    popStyle();
  }

  //generate pattern of this block
  void generatePattern() {
    if (patternSelection == 0) { //patternA
      patternA(indexX * elementSize, indexY * elementSize, blockSize, blockSection, blockWeight, 255, patternAMode);
    } else if (patternSelection == 1) { //patternB
      patternB(indexX * elementSize, indexY * elementSize, blockSize, blockSection, blockWeight, 255, patternBMode);
    } else { //patternC
      patternC(indexX * elementSize, indexY * elementSize, blockSize, blockSection, blockWeight, 255, patternCMode);
    }
  }

  //patternA function
  void patternA(int posX, int posY, int eSize, int section, int w, color c, int state) {
    pushStyle();
    noFill();
    stroke(c);
    strokeWeight(w);
    float diameter = (eSize / section) * 2;

    if (state == 0) {
      for (int i = 0; i < section + 1; i ++) {
        arc(posX, posY, diameter * i, diameter * i, 0, HALF_PI);
      }
      for (float arcSize = eSize*2; arcSize <= eSize * sqrt(2) * 2; arcSize += diameter) {
        float ang = acos(eSize*2/arcSize);
        arc(posX, posY, arcSize, arcSize, ang, HALF_PI - ang);
      }
    } else if (state == 1) {
      for (int i = 0; i < section + 1; i ++) {
        arc(posX + eSize, posY, diameter * i, diameter * i, HALF_PI, PI);
      }
      for (float arcSize = eSize*2; arcSize <= eSize * sqrt(2) * 2; arcSize += diameter) {
        float ang = acos(eSize*2/arcSize);
        arc(posX + eSize, posY, arcSize, arcSize, HALF_PI + ang, PI - ang);
      }
    } else if (state == 2) {
      for (int i = 0; i < section + 1; i ++) {
        arc(posX + eSize, posY + eSize, diameter * i, diameter * i, PI, PI + HALF_PI);
      }
      for (float arcSize = eSize*2; arcSize <= eSize * sqrt(2) * 2; arcSize += diameter) {
        float ang = acos(eSize*2/arcSize);
        arc(posX + eSize, posY + eSize, arcSize, arcSize, PI + ang, PI + HALF_PI - ang);
      }
    } else if (state == 3) {
      for (int i = 0; i < section + 1; i ++) {
        arc(posX, posY + eSize, diameter * i, diameter * i, PI + HALF_PI, TWO_PI);
      }
      for (float arcSize = eSize*2; arcSize <= eSize * sqrt(2) * 2; arcSize += diameter) {
        float ang = acos(eSize*2/arcSize);
        arc(posX, posY + eSize, arcSize, arcSize, PI + HALF_PI + ang, TWO_PI - ang);
      }
    }
    popStyle();
  }

  //patternB function
  void patternB(int posX, int posY, int eSize, int section, int w, color c, int state) {
    pushStyle();
    noFill();
    stroke(c);
    strokeWeight(w);
    float interval = eSize / section;

    if (state == 0) {
      // _____
      //
      // _____
      if (patternBModeType == 0) {
        line(posX, posY, posX + eSize, posY);
        line(posX, posY + eSize, posX + eSize, posY + eSize);
      }
      // _____
      //|     |
      //|_____|
      if (patternBModeType == 1) {
        line(posX, posY, posX + eSize, posY);
        line(posX, posY + eSize, posX + eSize, posY + eSize);
        line(posX, posY, posX, posY + eSize);
        line(posX + eSize, posY, posX + eSize, posY + eSize);
      }

      // _____
      //|_____|
      //|_____|

      if (patternBModeType == 2) {
        line(posX, posY, posX + eSize, posY);
        line(posX, posY + eSize, posX + eSize, posY + eSize);
        line(posX, posY, posX, posY + eSize);
        line(posX + eSize, posY, posX + eSize, posY + eSize);
        line(posX, posY + eSize*0.5, posX + eSize, posY + eSize*0.5);
      }

      //_______
      //_______
      //_______

      if (patternBModeType == 3) {
        for (int i = 0; i < section + 1; i ++) {
          line(posX, posY + interval * i, posX + eSize, posY + interval * i);
        }
      }

      // ______
      //|______
      // ______|
      //|______
      if (patternBModeType == 4) {
        for (int i = 0; i < section + 1; i ++) {
          line(posX, posY + interval * i, posX + eSize, posY + interval * i);
        }

        for (int i = 0; i < section + 1; i +=2) {
          if ((i+1)<section + 1) {
            line(posX, posY + interval * i, posX, posY + interval * (i+1));
          }
          if ((i+2)<section + 1) {
            line(posX + eSize, posY + interval * (i+1), posX + eSize, posY + interval * (i+2));
          }
        }
      }
    } else {
      if (patternBModeType == 0) {
        line(posX, posY, posX, posY + eSize);
        line(posX + eSize, posY, posX + eSize, posY + eSize);
      }

      if (patternBModeType == 1) {
        line(posX, posY, posX + eSize, posY);
        line(posX, posY + eSize, posX + eSize, posY + eSize);
        line(posX, posY, posX, posY + eSize);
        line(posX + eSize, posY, posX + eSize, posY + eSize);
      }

      if (patternBModeType == 2) {
        line(posX, posY, posX + eSize, posY);
        line(posX, posY + eSize, posX + eSize, posY + eSize);
        line(posX, posY, posX, posY + eSize);
        line(posX + eSize, posY, posX + eSize, posY + eSize);
        line(posX + eSize*0.5, posY, posX + eSize*0.5, posY + eSize);
      }

      if (patternBModeType == 3) {
        for (int i = 0; i < section + 1; i ++) {
          line(posX + interval * i, posY, posX + interval * i, posY + eSize);
        }
      }

      if (patternBModeType == 4) {
        for (int i = 0; i < section + 1; i ++) {
          line(posX + interval * i, posY, posX + interval * i, posY + eSize);
        }

        for (int i = 0; i < section + 1; i +=2) {
          if ((i+1)<section + 1) {
            line(posX + interval * i, posY, posX + interval * (i+1), posY);
          }
          if ((i+2)<section + 1) {
            line(posX + interval * (i+1), posY + eSize, posX + interval * (i+2), posY + eSize);
          }
        }
      }
    }
    popStyle();
  }

  //patternC function
  //___________
  //________   |
  //_____   |  |
  //__   |  |  |
  //  |  |  |  |
  void patternC(int posX, int posY, int eSize, int section, int w, color c, int state) {
    pushStyle();
    noFill();
    stroke(c);
    strokeWeight(w);
    float interval = eSize / section;

    if (state == 0) {
      for (int i = 0; i < section + 1; i ++) {
        line(posX, posY + interval * i, posX + eSize - interval * i, posY + interval * i);
        line(posX + eSize - interval * i, posY + interval * i, posX + eSize - interval * i, posY + eSize);
      }
    } else if (state == 1) {
      for (int i = 0; i < section + 1; i ++) {
        line(posX + eSize - interval * i, posY, posX + eSize - interval * i, posY + eSize - interval * i);
        line(posX + eSize - interval * i, posY + eSize - interval * i, posX, posY + eSize - interval * i);
      }
    } else if (state == 2) {
      for (int i = 0; i < section + 1; i ++) {
        line(posX + interval * i, posY, posX + interval * i, posY + eSize - interval * i);
        line(posX + interval * i, posY + eSize - interval * i, posX + eSize, posY + eSize - interval * i);
      }
    } else if (state == 3) {
      for (int i = 0; i < section + 1; i ++) {
        line(posX + interval * i, posY + interval * i, posX + interval * i, posY + eSize);
        line(posX + interval * i, posY + interval * i, posX + eSize, posY + interval * i);
      }
    }
    popStyle();
  }
}
