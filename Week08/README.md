Week08 resource
## Complexity: Evolution and Neural Network Algorithms


<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week08/sourceImages/colorConfiguration_interactiveSelection.png" width=50% height=50%>. 
- 遗传与基因算法

### crossover
``` java
/ Crossover
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
```

### mutate
```java
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
```

### selection
```java
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
  ```

### reproduction
```java
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
```

### fitness
```java
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
```
- [完整的源程序：colorConfiguration_interactiveSelection](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week08/colorConfiguration_interactiveSelection)


<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week08/sourceImages/linearRegression.png" width=50% height=50%>. 
- 梯度学习

``` java
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
```
- [完整的源程序：linearRegression](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week08/linearRegression)


<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week08/sourceImages/evolutionaryNeuralNetwork_flappyBird.png" width=50% height=50%>. 
- 遗传与神经网络算法

``` java

```
- [完整的源程序：evolutionaryNeuralNetwork_flappyBird](https://github.com/ddurAdvisor/CreativeCoding2022Fall/tree/main/Week08/evolutionaryNeuralNetwork_flappyBird)
