/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2016-05-08 13:15:21
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-10 08:50:00
* @detail
*/

/**
 * [generateMachineCode description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:49:36+0800
 * @return   {[type]}                 [description]
 */
String generateMachineCode() {
  String out = "";
  int ln = 0;
  float fastH = 20; //fast plane for G0 commands
  float appH = 5; //clearance plane for inbetween dots
  //feedrates: G0 fast, G1 slow
  int feedG0 = 5000;
  int feedG1 = 1000;

  //head of gcode
  out += "N"+(ln++)+" "+"G17 G71 G40 G90" + "\n";
  out += "N"+(ln++)+" "+"T1 M6" + "\n";
  out += "N"+(ln++)+" G0 S20000 M3" + "\n";
  out += "N"+(ln++)+" X0 Y0 Z"+ fastH + "\n";

  //the below couple of lines are not necessary
  //it is done by the loop anyway
  
  Dot d = myDots.get(0).get(0);
  float cx = d.x;
  float cy = d.y;

  //body of gcode > point coordinates
  boolean downstate = true;

  //loop through all the sub-lists
  for (int i=0; i<myDots.size(); i++) {
    //get the sub-list number i
    ArrayList<Dot> li = myDots.get(i);
    //get the first dot in the sub-list
    Dot dt = li.get(0);
    out += "N"+(ln++)+" G0 X"+formatNum(dt.x)+" "+
      "Y"+formatNum(outH-dt.y)+" "+
      "Z"+fastH+"\n";

    //loop through all the dots in the sub-list
    for (int j=0; j<li.size(); j++) {
      //get dot number j from list
      Dot dot = li.get(j);
      //dot is drilled, when depth above threshold
      if (dot.drilled) {
        
        //downstate is true if previous dot was drilled
        if (!downstate) {
          //previous dot not drilled, rapid plane > approach
          out += "N"+(ln++)+" G0 X"+formatNum(dot.x)+" "+
            "Y"+formatNum(outH-dot.y)+" "+
            "Z"+fastH+" "+
            "F"+feedG0+"\n";
          out += "N"+(ln++)+" G1 X"+formatNum(dot.x)+" "+
            "Y"+formatNum(outH-dot.y)+" "+
            "Z"+appH+" "+
            "F"+feedG1+"\n";
            downstate = true;
        } else {
//          out += "N"+(ln++)+" G1 Z"+appH+" "+
//            "F"+feedG1+"<br/>";
        }

        //con is true if lines should be milled (con = connected)
        if (!con) {
          // DOTS . . . . . . . . . . . . . . . . . . . .
          
          if (dot.x!=cx) out += "N"+(ln++)+" X"+formatNum(dot.x)+"\n";
          if (dot.y!=cy) out += "N"+(ln++)+" Y"+formatNum(outH-dot.y)+"\n";
          out += "N"+(ln++)+" Z-"+formatNum(ballnoseConversion(dot.z)*bitDim/2.0)+"\n";
          out += "N"+(ln++)+" Z"+appH+"\n";
        } else {
          // LINES --------------------------------------
          // lines don't work!
          out += "N"+(ln++)+" X"+formatNum(dot.x)+" "+
            " Y"+formatNum(outH-dot.y)+" "+
            " Z-"+formatNum(ballnoseConversion(dot.z)*bitDim/2.0)+"\n";
            downstate = true;
        }
      } else { //if dot is not drilled
        //lift tool to rapid plane if dot is not drilled 
        if (downstate) out += "N"+(ln++)+" G0 Z"+fastH+"\n";
        downstate = false;
      }
      cx = dot.x;
      cy = dot.y;
    }
    out += "N"+(ln++)+" G0 Z"+fastH+"\n";
    downstate = false;
  }

  //end of gcode
  out += "N"+(ln++)+" "+"Z"+fastH+"\n";
  out += "N"+(ln++)+" "+"G0 X0 Y0"+"\n";
  out += "N"+(ln++)+" "+"M05 M09"+"\n";
  out += "N"+(ln++)+" "+"M30";

  return out;
}

/**
 * [generateMachineCodeHTML description]
 * @Author   bit2atom
 * @DateTime 2016-05-08 T08:49:51+0800
 * @return   {[type]}                 [description]
 */
String generateMachineCodeHTML() {
  String out = "";
  int ln = 0;
  float fastH = 20; //fast plane for G0 commands
  float appH = 5; //clearance plane for inbetween dots
  //feedrates: G0 fast, G1 slow
  int feedG0 = 5000;
  int feedG1 = 1000;

  //html head
  out += "<!DOCTYPE html>";
  out += "<head><style type=\"text/css\">";
  out += "body { background-color: #00f; color: #ff0; font-size: 10px; font-family: Courier, Mono; }";
  out += "</style>";
  out += "<title>SAVE AS *.NC</title>";
  out += "</head><body>";

  //head of gcode
  out += "N"+(ln++)+" "+"G17 G71 G40 G90" + "<br/>";
  out += "N"+(ln++)+" "+"T1 M6" + "<br/>";
  out += "N"+(ln++)+" G0 S20000 M3" + "<br/>";
  out += "N"+(ln++)+" X0 Y0 Z"+ fastH + "<br/>";

  
  //the below couple of lines are not necessary
  //it is done by the loop anyway
  
  Dot d = myDots.get(0).get(0);
  float cx = d.x;
  float cy = d.y;
  /*

  //first go to xy of first point
  out += "N"+(ln++)+" X"+formatNum(d.x)+" "+
    "Y"+formatNum(outH-d.y)+"<br/>";

  //lower to fast plane
  out += "N"+(ln++)+" X"+formatNum(d.x)+" "+
    "Y"+formatNum(outH-d.y)+" "+
    "Z"+fastH+"<br/>";

  //lower to clearance plane
  out += "N"+(ln++)+" X"+formatNum(d.x)+" "+
    "Y"+formatNum(outH-d.y)+" "+
    "Z"+appH+"<br/>";

  out += "N"+(ln++)+" G1 X"+formatNum(d.x)+" "+
    "Y"+formatNum(outH-d.y)+" "+
    "Z"+appH+" "+
    "F"+feedG1+"<br/>";
    */

  //body of gcode > point coordinates
  boolean downstate = true;

  //loop through all the sub-lists
  for (int i=0; i<myDots.size(); i++) {
    //get the sub-list number i
    ArrayList<Dot> li = myDots.get(i);
    //get the first dot in the sub-list
    Dot dt = li.get(0);
    out += "N"+(ln++)+" G0 X"+formatNum(dt.x)+" "+
      "Y"+formatNum(outH-dt.y)+" "+
      "Z"+fastH+"<br/>";

    //loop through all the dots in the sub-list
    for (int j=0; j<li.size(); j++) {
      //get dot number j from list
      Dot dot = li.get(j);
      //dot is drilled, when depth above threshold
      if (dot.drilled) {
        
        //downstate is true if previous dot was drilled
        if (!downstate) {
          //previous dot not drilled, rapid plane > approach
          out += "N"+(ln++)+" G0 X"+formatNum(dot.x)+" "+
            "Y"+formatNum(outH-dot.y)+" "+
            "Z"+fastH+" "+
            "F"+feedG0+"<br/>";
          out += "N"+(ln++)+" G1 X"+formatNum(dot.x)+" "+
            "Y"+formatNum(outH-dot.y)+" "+
            "Z"+appH+" "+
            "F"+feedG1+"<br/>";
            downstate = true;
        } else {
//          out += "N"+(ln++)+" G1 Z"+appH+" "+
//            "F"+feedG1+"<br/>";
        }

        //con is true if lines should be milled (con = connected)
        if (!con) {
          // DOTS . . . . . . . . . . . . . . . . . . . .
          
          if (dot.x!=cx) out += "N"+(ln++)+" X"+formatNum(dot.x)+"<br/>";
          if (dot.y!=cy) out += "N"+(ln++)+" Y"+formatNum(outH-dot.y)+"<br/>";
          out += "N"+(ln++)+" Z-"+formatNum(ballnoseConversion(dot.z)*bitDim/2.0)+"<br/>";
          out += "N"+(ln++)+" Z"+appH+"<br/>";
        } else {
          // LINES --------------------------------------
          // lines don't work!
          out += "N"+(ln++)+" X"+formatNum(dot.x)+" "+
            " Y"+formatNum(outH-dot.y)+" "+
            " Z-"+formatNum(ballnoseConversion(dot.z)*bitDim/2.0)+"<br/>";
            downstate = true;
        }
      } else { //if dot is not drilled
        //lift tool to rapid plane if dot is not drilled 
        if (downstate) out += "N"+(ln++)+" G0 Z"+fastH+"<br/>";
        downstate = false;
      }
      cx = dot.x;
      cy = dot.y;
    }
    out += "N"+(ln++)+" G0 Z"+fastH+"<br/>";
    downstate = false;
  }

  //end of gcode
  out += "N"+(ln++)+" "+"Z"+fastH+"<br/>";
  out += "N"+(ln++)+" "+"G0 X0 Y0"+"<br/>";
  out += "N"+(ln++)+" "+"M05 M09"+"<br/>";
  out += "N"+(ln++)+" "+"M30";

  //end of html
  out += "</body>";

  return out;
}
