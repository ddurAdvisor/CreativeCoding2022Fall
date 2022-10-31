Week08 resource
## Complexity: Evolution and Neural Network Algorithms


<img src="https://github.com/ddurAdvisor/CreativeCoding2022Fall/blob/main/Week08/sourceImages/colorConfiguration_interactiveSelection.png" width=50% height=50%>. 
- 遗传与基因算法

``` java

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
