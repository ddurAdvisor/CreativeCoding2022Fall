/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 18:16:39
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:57:08
* @detail
*/

/**
 * [nextGeneration description]
 * @Author   bit2atom
 * @DateTime 2022-10-31T22:52:00+0800
 * @return   {[type]}                 [description]
 */
void nextGeneration(){
  Gens++;
  println("Generation "+ Gens);
  calculateFitness();
  for (int i = 0; i < TOTAL; i++){
    population.add(pickOne());
  }
  saved.clear();
}

/**
 * [pickOne description]
 * @Author   bit2atom
 * @DateTime 2022-10-31T22:51:34+0800
 * @return   {[type]}                 [description]
 */
bird pickOne(){
  int index = 0;
  float r = random(1);
  while (r > 0) {
    r -= saved.get(index).fitness;
    index++;
  }
  index--;
  bird b = saved.get(index);
  bird child = new bird(b.brain);
  child.mutate();
  return child;
}

/**
 * [calculateFitness description]
 * @Author   bit2atom
 * @DateTime 2022-10-31T22:51:44+0800
 * @return   {[type]}                 [description]
 */
void calculateFitness(){
  float sum = 0;
  for (bird b : saved){
    sum += b.score;
  }

  for (bird b : saved){
    b.fitness = b.score/sum;
  }
}
