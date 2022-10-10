/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2016-05-08 13:15:21
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:51:26
* @detail
*/

/**
 * [createPreview description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 08:50:26+0800
 * @param    {[type]}                 ArrayList<ArrayList<Dot>> dots          [description]
 * @return   {[type]}                                           [description]
 */
PGraphics createPreview(ArrayList<ArrayList<Dot>> dots) {
  PGraphics out = createGraphics(outW, outH);

  out.beginDraw();
  out.background(255);
  out.noStroke();
  out.fill(0);

  //  for (ArrayList<Dot> li : dots) {
  for (int j=0; j<dots.size(); j++) {
    ArrayList<Dot> li = dots.get(j);
    for (int i=0; i<li.size(); i++) {
      Dot d = li.get(i);
      
      if (!d.drilled) continue;
      
      //draw dots anyway > round caps for lines
      if (root) out.ellipse(d.x, d.y, sqrt(d.z)*bitDim, sqrt(d.z)*bitDim);
      else out.ellipse(d.x, d.y, d.z*bitDim, d.z*bitDim);
      
      if (!con) {
        //special for drawing dots
      } 
      else {
        //draw lines
        if (i<(li.size()-1)) {
          Dot dn = li.get(i+1);

          float ang = HALF_PI+atan2(dn.y-d.y, dn.x-d.x);
          float r1 = sqrt(d.z)*bitDim/2.0;
          float r2 = sqrt(dn.z)*bitDim/2.0;

          out.beginShape();
          out.vertex(d.x+r1*cos(ang), d.y+r1*sin(ang));
          out.vertex(d.x-r1*cos(ang), d.y-r1*sin(ang));
          out.vertex(dn.x-r2*cos(ang), dn.y-r2*sin(ang));
          out.vertex(dn.x+r2*cos(ang), dn.y+r2*sin(ang));
          out.endShape(CLOSE);

        }
      }
    }
  }
  
  if (type==2) {
    out.stroke(255,0,0);
    out.strokeWeight(2);
    out.line(centerX-7,centerY,centerX+7,centerY);
    out.line(centerX,centerY-7,centerX,centerY+7);
  }
  out.endDraw();

  return out;
}
