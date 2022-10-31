/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-11-01 07:29:53
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-11-01 07:31:00
* @detail
*/
ArrayList<PVector> data = new ArrayList();

float m = 1; //y = mx + b
float b = 0;

float xmean = 0;
float ymean = 0;

float rSquareValue = 0;

void setup() {
  size(800, 800);
  background(255);
}

/**
 * [drawLine description]
 * @Author   bit2atom
 * @DateTime 2022-11-01T07:30:32+0800
 * @return   {[type]}                 [description]
 */
void drawLine() {
  float xx1 = 0;
  float xx2 = 1;
  float yy1 = m*xx1 + b;
  float yy2 = m*xx2 + b;

  float x1 = map(xx1, 0, 1, 0, width);
  float y1 = map(yy1, 0, 1, height, 0);
  float x2 = map(xx2, 0, 1, 0, width);
  float y2 = map(yy2, 0, 1, height, 0);

  stroke(255, 0, 255);
  line(x1, y1, x2, y2);
}

void mousePressed() {
  float x = map(mouseX, 0, width, 0, 1);
  float y = map(mouseY, 0, height, 1, 0);
  PVector point = new PVector(x, y);
  data.add(point);
}

/**
 * [linearRegression description]
 * @Author   bit2atom
 * @DateTime 2022-11-01T07:30:39+0800
 * @return   {[type]}                 [description]
 */
void linearRegression(){
  float upperPart = 0;
  float lowerPart = 0;
  
  for(int i = 0; i < data.size(); i ++){
    upperPart = upperPart + (data.get(i).x - xmean)*(data.get(i).y - ymean);
    lowerPart += (data.get(i).x - xmean)*(data.get(i).x - xmean);
  }
  
  m = upperPart / lowerPart;
  b = ymean -m * xmean;
}

/**
 * [gradientDescent description]
 * @Author   bit2atom
 * @DateTime 2022-11-01T07:30:44+0800
 * @return   {[type]}                 [description]
 */
void gradientDescent(){
  float learningRate = 0.05;
  for(int i = 0; i < data.size(); i ++){
    float x = data.get(i).x;
    float y = data.get(i).y;
    
    float predict = m * x + b;
    float error = y- predict;
    
    m = m +error * x * learningRate;
    b = b +error * learningRate;
  }
}

/**
 * [getMeans description]
 * @Author   bit2atom
 * @DateTime 2022-11-01T07:30:49+0800
 * @return   {[type]}                 [description]
 */
void getMeans(){
  float xsum = 0;
  float ysum = 0;
  
  for(int i = 0; i < data.size(); i ++){
    xsum = xsum + data.get(i).x;
    ysum = ysum + data.get(i).y;
  }
  
  xmean = xsum / data.size();
  ymean = ysum / data.size();
}

/**
 * [rSquare description]
 * @Author   bit2atom
 * @DateTime 2022-11-01T07:30:55+0800
 * @return   {[void]}                 [决定系数，反应因变量的全部变异能通过回归关系被自变量解释的比例。]
 *                                    [如R平方为0.8，则表示回归关系可以解释因变量80%的变异。]
 * R^2 = \frac {SSR}{SST} = \frac{\sum_{i=1}^{n}(\hat y_i - \vec y)^2}
                                 {\sum_{i=1}^{n}(y_i - \vec y)^2}
 */
void rSquare(){
  float ypredictSubYSum = 0;
  float ymeanSquareSum = 0;
  
  for(int i = 0; i < data.size(); i ++){
    float ypredict = m * data.get(i).x + b;
    //ypredictSubYSum += (data.get(i).y - ypredict)*(data.get(i).y - ypredict);
    ypredictSubYSum += (ymean - ypredict)*(ymean - ypredict);
    ymeanSquareSum += (data.get(i).y - ymean)*(data.get(i).y - ymean);
  }
  
  //rSquareValue = 1 - ypredictSubYSum / ymeanSquareSum;
  rSquareValue = ypredictSubYSum / ymeanSquareSum;
  
}

void draw() {
  background(255);
  drawLine();

  for (int i = 0; i < data.size(); i ++) {
    float ex = map(data.get(i).x, 0, 1, 0, width);
    float ey = map(data.get(i).y, 0, 1, height, 0);
    fill(51);
    noStroke();
    ellipse(ex, ey, 10, 10);
  }
  
  getMeans();
  //linearRegression();
  gradientDescent();
  rSquare();
  
  fill(0);
  text("R^2: " + rSquareValue, width-100, 50);
}
