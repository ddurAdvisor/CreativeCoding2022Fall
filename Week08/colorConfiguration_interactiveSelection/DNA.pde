/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 18:16:39
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:47:43
* @detail
*/
// Interactive Selection
// https://www.karlsims.com/papers/siggraph91.html

/**
 * DNA
 */
class DNA {

  // The genetic sequence
  float[] genes;
  int len = s.getChildCount()*3;//rgb //27; //54;  // Arbitrary length
  
  //Constructor (makes a random DNA)
  DNA() {
    // DNA is random floating point values between 0 and 1 (!!)
    genes = new float[len];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = random(0,1);
    }
  }
  
  DNA(float[] newgenes) {
    genes = newgenes;
  }
  

  // Crossover
  // Creates new DNA sequence from two (this & partner)
  /**
   * [crossover description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:46:11+0800
   * @param    {[type]}                 DNA partner       [description]
   * @return   {[type]}                     [description]
   */
  DNA crossover(DNA partner) {
    float[] child = new float[genes.length];
    int crossover = int(random(genes.length));
    for (int i = 0; i < genes.length; i++) {
      if (i > crossover) child[i] = genes[i];
      else               child[i] = partner.genes[i];
    }
    DNA newgenes = new DNA(child);
    return newgenes;
  }
  
  // Based on a mutation probability, picks a new random character in array spots
  /**
   * [mutate description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:46:18+0800
   * @param    {[type]}                 float m             [description]
   * @return   {[type]}                       [description]
   */
  void mutate(float m) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < m) {
         genes[i] = random(0,1);
      }
    }
  }
}
