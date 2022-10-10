/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2016-05-08 13:15:21
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:48:01
* @detail
*/
/*
every pattern must return an ArrayList of ArrayLists of Dots
one List of Dots is one line, the List of Lists is all the lines
every Dot's "drilled" attribute must be set to true, if the depth (d.z)
is above the threshold
*/


//orthogonal grid
// o o o o
// o o o o
// o o o o

/**
 * [getOrthoGrid description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:46:56+0800
 * @param    {[type]}                 PGraphics pg            [description]
 * @param    {[type]}                 float     step          [description]
 * @return   {[type]}                           [description]
 */
ArrayList<ArrayList<Dot>> getOrthoGrid(PGraphics pg, float step) {
  int nx = floor(outW/step);
  int ny = floor(outH/step);
  float offx = (outW-((nx-1)*step))/2f;
  float offy = (outH-((ny-1)*step))/2f;

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();

  for (int y=0; y<ny; y++) {
    ArrayList<Dot> tmpDts = new ArrayList<Dot>();
    for (int x=0; x<nx; x++) {
      PImage temp = pg.get(round(x*step), round(y*step), round(step), round(step));
      float val = luminosityAverage(temp);
      val = level(val);
      //float dim = (1-val) * bitDim;

      Dot d = new Dot(offx+x*step, offy+y*step, 1-val);
      tmpDts.add(d);
      if (d.z>threshold) d.drilled = true;
    }
    out.add(tmpDts);
  }
  return out;
}

//honeycomb grid
// o o o o
//  o o o
// o o o o
/**
 * [getHoneyGrid description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:47:24+0800
 * @param    {[type]}                 PGraphics pg            [description]
 * @param    {[type]}                 float     step          [description]
 * @return   {[type]}                           [description]
 */
ArrayList<ArrayList<Dot>> getHoneyGrid(PGraphics pg, float step) {
  float rt3 = sqrt(3.0);
  int nx = floor(outW/step);
  int ny = floor(outH/(step/2*rt3));
  // ny = floor(outH/step);

  float offx = (outW-((nx-1)*step))/2f;
  float offy = (outH-((ny-1)*(step/2*rt3)))/2f;
  //offy = offx;

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();
  boolean pnd = false;
  for (int y=0; y<ny; y++) {
    ArrayList<Dot> tmpDts = new ArrayList<Dot>();
    for (int x=0; x<(pnd?(nx-1):nx); x++) {
      float cx = x*step;
      if (pnd) cx += step/2.0;
      float cy = y*step/2*rt3;

      PImage temp = pg.get(round(cx), round(cy), round(step), round(step));
      float val = luminosityAverage(temp);
      val = level(val);
      //float dim = (1-val) * bitDim;

      Dot d = new Dot(offx+cx, offy+cy, 1-val);
      tmpDts.add(d);
      if (d.z>threshold) d.drilled = true;
    }
    pnd = !pnd;
    out.add(tmpDts);
  }
  return out;
}

//co-centric circles / spiral
/**
 * [getPolarGrid description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:47:39+0800
 * @param    {[type]}                 PGraphics pg            [description]
 * @param    {[type]}                 float     step          [description]
 * @return   {[type]}                           [description]
 */
ArrayList<ArrayList<Dot>> getPolarGrid(PGraphics pg, float step) {
  float cx = centerX;
  float cy = centerY;
  float dx = max(cx,outW-cx);
  float dy = max(cy,outH-cy);
  int numCirc = round(sqrt(sq(dx)+sq(dy))/step);

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();
  
  for (int j=0; j<numCirc; j++) {
    float rad = j*step;
    int numRays = max(10,round(rad*TWO_PI/step));
    ArrayList<Dot> tmpDts = new ArrayList<Dot>();
    float a = 0;
    float mrg = step/2.0;
    
    for (int i=0; i<numRays+1; i++) {
      float x = cx + rad * cos(a);
      float y = cy + rad * sin(a);
      if (x>mrg && x<outW-mrg && y>mrg && y<outH-mrg) {
        PImage temp = pg.get(round(x-mrg), round(y-mrg), round(step), round(step));
        float val = luminosityAverage(temp);
        val = level(val);
        Dot d = new Dot(x,y,1-val);
        tmpDts.add(d);
        if (d.z>threshold) d.drilled = true;
      } else {
        if (tmpDts.size()>0) out.add(tmpDts);
        tmpDts = new ArrayList<Dot>();
      }
      a += TWO_PI/numRays;
    }
    
    if (tmpDts.size()>0) out.add(tmpDts);
  }

  return out;
}

//co-centric circles / spiral
/**
 * [getSpiralGrid description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:47:52+0800
 * @param    {[type]}                 PGraphics pg            [description]
 * @param    {[type]}                 float     step          [description]
 * @return   {[type]}                           [description]
 */
ArrayList<ArrayList<Dot>> getSpiralGrid(PGraphics pg, float step) {
  float cx = centerX;
  float cy = centerY;
  float dx = max(cx,outW-cx);
  float dy = max(cy,outH-cy);
  int numCirc = round(sqrt(sq(dx)+sq(dy))/step);

  ArrayList<ArrayList<Dot>> out = new ArrayList<ArrayList<Dot>>();
  
  for (int j=0; j<numCirc; j++) {
    float rad = j*step;
    int numRays = max(10,round(rad*TWO_PI/step));
    ArrayList<Dot> tmpDts = new ArrayList<Dot>();
    float a = 0;
    float mrg = step/2.0;
    
    for (int i=0; i<numRays+1; i++) {
      float delta=float(i)/numRays * step;
      float x = cx + (rad+delta) * cos(a);
      float y = cy + (rad+delta) * sin(a);
      if (x>mrg && x<outW-mrg && y>mrg && y<outH-mrg) {
        PImage temp = pg.get(round(x-mrg), round(y-mrg), round(step), round(step));
        float val = luminosityAverage(temp);
        val = level(val);
        Dot d = new Dot(x,y,1-val);
        tmpDts.add(d);
        if (d.z>threshold) d.drilled = true;
      } else {
        if (tmpDts.size()>0) out.add(tmpDts);
        tmpDts = new ArrayList<Dot>();
      }
      a += TWO_PI/numRays;
    }
    
    if (tmpDts.size()>0) out.add(tmpDts);
  }

  return out;
}
