/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 22:31:52
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:47:40
* @detail
*/
// Interactive Selection
// https://www.karlsims.com/papers/siggraph91.html

// A class to describe a population of Design
// this hasn't changed very much from example to example

/**
 * Population
 */
class Population {
  float interval = 260;

  float mutationRate;           // Mutation rate
  Design[] population;            // array to hold the current population
  ArrayList<Design> matingPool;   // ArrayList which we will use for our "mating pool"
  int generations;              // Number of generations

    // Create the population
  /**
   * [Population description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:46:48+0800
   * @param    {[type]}                 float m   [description]
   * @param    {[type]}                 int   num [description]
   */
  Population(float m, int num) {
    mutationRate = m;
    population = new Design[num];
    matingPool = new ArrayList<Design>();
    generations = 0;
    for (int i = 0; i < population.length; i++) {
      population[i] = new Design(new DNA(), 70+(i%(population.length/2))*interval, 100 + ceil(i/(population.length/2))*240);
    }
  }

  // Display all Designs
  void display() {
    for (int i = 0; i < population.length; i++) {
      population[i].display();
    }
  }

  // Are we rolling over any of the Designs?
  void rollover(int mx, int my) {
    for (int i = 0; i < population.length; i++) {
      population[i].rollover(mx, my);
    }
  }

  // Generate a mating pool
  /**
   * [selection description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:46:56+0800
   * @return   {[type]}                 [description]
   */
  void selection() {
    // Clear the ArrayList
    matingPool.clear();

    // Calculate total fitness of whole population
    float maxFitness = getMaxFitness();

    // Calculate fitness for each member of the population (scaled to value between 0 and 1)
    // Based on fitness, each member will get added to the mating pool a certain number of times
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getFitness(), 0, maxFitness, 0, 1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }  

  // Making the next generation
  /**
   * [reproduction description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:47:02+0800
   * @return   {[type]}                 [description]
   */
  void reproduction() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      // Sping the wheel of fortune to pick two parents
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      // Pick two parents
      Design mom = matingPool.get(m);
      Design dad = matingPool.get(d);
      // Get their genes
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
      // Mate their genes
      DNA child = momgenes.crossover(dadgenes);
      // Mutate their genes
      child.mutate(mutationRate);
      // Fill the new population with the new child
      population[i] = new Design(child, 70+(i%(population.length/2))*interval, 100 + ceil(i/(population.length/2))*240);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  // Find highest fintess for the population
  /**
   * [getMaxFitness description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:47:10+0800
   * @return   {[type]}                 [description]
   */
  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].getFitness() > record) {
        record = population[i].getFitness();
      }
    }
    return record;
  }
}
