/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 18:16:39
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:56:58
* @detail
*/

/**
 * [sigmoid description]
 * @Author   bit2atom
 * @DateTime 2022-10-31T22:53:58+0800
 * @param    {[type]}                 float x             [description]
 * @return   {[type]}                       [description]
 */
float sigmoid(float x){
  return 1 / (1+(float)Math.exp(-x));
}

/**
 * [dsigmoid description]
 * @Author   bit2atom
 * @DateTime 2022-10-31T22:54:04+0800
 * @param    {[type]}                 float y             [description]
 * @return   {[type]}                       [description]
 */
float dsigmoid(float y){
  return y * (1-y);
}

/**
 * [tanh description]
 * @Author   bit2atom
 * @DateTime 2022-10-31T22:54:09+0800
 * @param    {[type]}                 float x             [description]
 * @return   {[type]}                       [description]
 */
float tanh(float x){
  float y = (float) Math.tanh(x);
  return y;
}

/**
 * [dtanh description]
 * @Author   bit2atom
 * @DateTime 2022-10-31T22:54:14+0800
 * @param    {[type]}                 float x             [description]
 * @return   {[type]}                       [description]
 */
float dtanh(float x) {
  float y = 1 / (pow((float) Math.cosh(x), 2));
  return y;
}

/**
 * NeuralNetwork
 */
class NeuralNetwork{
  int 
    inputNodes, 
    hiddenNodes, 
    outputNodes;

  float LearningRate = .1;

  Matrix 
    IHWeights, 
    HOWeights, 
    Hbias, 
    Obias, 
    input, 
    hidden, 
    output;

  /**
   * [NeuralNetwork description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:54:41+0800
   * @param    {[type]}                 NeuralNetwork copy [description]
   */
  NeuralNetwork(NeuralNetwork copy){
    inputNodes = copy.inputNodes;
    hiddenNodes = copy.hiddenNodes;
    outputNodes = copy.outputNodes;

    IHWeights = copy.IHWeights.copy();
    HOWeights = copy.HOWeights.copy();
    Hbias = copy.Hbias.copy();
    Obias = copy.Obias.copy();
  }

  /**
   * [NeuralNetwork description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:54:46+0800
   * @param    {[type]}                 int input  [description]
   * @param    {[type]}                 int hidden [description]
   * @param    {[type]}                 int output [description]
   */
  NeuralNetwork(int input, int hidden, int output){
    inputNodes = input;
    hiddenNodes = hidden;
    outputNodes = output;

    IHWeights = Matrix.random(hiddenNodes, inputNodes);
    HOWeights = Matrix.random(outputNodes, hiddenNodes);
    Hbias = Matrix.random(hiddenNodes, 1);
    Obias = Matrix.random(outputNodes, 1);
  }

  /**
   * [NeuralNetwork description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:54:53+0800
   * @param    {[type]}                 int   input  [description]
   * @param    {[type]}                 int   hidden [description]
   * @param    {[type]}                 int   output [description]
   * @param    {[type]}                 float lr     [description]
   */
  NeuralNetwork(int input, int hidden, int output, float lr){
    this(input, hidden, output);
    setLearingRate(lr);
  }

  /**
   * [copy description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:55:16+0800
   * @return   {[type]}                 [description]
   */
  NeuralNetwork copy(){
    return new NeuralNetwork(this);
  }


  /**
   * [mut description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:55:22+0800
   * @param    {[type]}                 float val           [description]
   * @param    {[type]}                 float rate          [description]
   * @return   {[type]}                       [description]
   */
  float mut(float val, float rate){
    if (random(1) < rate){
      return val + randomGaussian() * .1;
    } else{
      return val;
    }
  }

  /**
   * [mutate description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:55:27+0800
   * @param    {[type]}                 float rate          [description]
   * @return   {[type]}                       [description]
   */
  void mutate(float rate){
    for (int i = 0; i < IHWeights.rows; i++){
      for (int j = 0; j < IHWeights.cols; j++){
        float val = IHWeights.values[i][j];
        IHWeights.values[i][j] = mut(val, rate);
      }
    }
    
    for (int i = 0; i < HOWeights.rows; i++){
      for (int j = 0; j < HOWeights.cols; j++){
        float val = HOWeights.values[i][j];
        HOWeights.values[i][j] = mut(val, rate);
      }
    }
    
    for (int i = 0; i < Hbias.rows; i++){
      for (int j = 0; j < Hbias.cols; j++){
        float val = Hbias.values[i][j];
        Hbias.values[i][j] = mut(val, rate);
      }
    }
    
    for (int i = 0; i < Obias.rows; i++){
      for (int j = 0; j < Obias.cols; j++){
        float val = Obias.values[i][j];
        Obias.values[i][j] = mut(val, rate);
      }
    }
  }

  /**
   * [setLearingRate description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:55:38+0800
   * @param    {[type]}                 float rate [description]
   */
  void setLearingRate(float rate){
    LearningRate = rate;
  }

  /**
   * [feedForward description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:55:43+0800
   * @param    {[type]}                 float[] inputArray    [description]
   * @return   {[type]}                         [description]
   */
  float[] feedForward(float[] inputArray){
    input = Matrix.FromArray(inputArray);

    //generating hidden inputs
    hidden = Matrix.Product(IHWeights, input);
    hidden.add(Hbias);

    //activation function for hidden nodes!
    for (int i = 0; i < hidden.rows; i++){
      for (int j = 0; j < hidden.cols; j++){
        float val = hidden.values[i][j];
        hidden.values[i][j] = sigmoid(val);
      }
    }

    //generating hidden output
    output = Matrix.Product(HOWeights, hidden);
    output.add(Obias);

    //activation function for ouput nodes!
    for (int i = 0; i < output.rows; i++){
      for (int j = 0; j < output.cols; j++){
        float val = output.values[i][j];
        output.values[i][j] = sigmoid(val);
      }
    }

    //generating the output array
    return output.toArray();
  }

  /**
   * [train description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:55:55+0800
   * @param    {[type]}                 float[] inputArray    [description]
   * @param    {[type]}                 float[] targetArray   [description]
   * @return   {[type]}                         [description]
   */
  void train(float[] inputArray, float[] targetArray){
    feedForward(inputArray);

    Matrix targets = Matrix.FromArray(targetArray);
    Matrix outputErrors = Matrix.subtract(targets, output);

    //java version of matrix map function
    Matrix gradient = output.copy();
    for (int i = 0; i < gradient.rows; i++){
      for (int j = 0; j < gradient.cols; j++){
        float val = gradient.values[i][j];
        gradient.values[i][j] = dsigmoid(val);
      }
    }

    gradient.multiply(outputErrors);  //elementWise
    gradient.multiply(LearningRate);  //Scalar

    Matrix hiddenT = Matrix.transpose(hidden);
    Matrix DHOWeights = Matrix.Product(gradient, hiddenT);

    HOWeights.add(DHOWeights);

    Obias.add(gradient);

    Matrix HOWeightsT = Matrix.transpose(HOWeights);
    Matrix hiddenErrors = Matrix.Product(HOWeightsT, outputErrors);

    //java version of matrix map function
    Matrix hiddenGradient = hidden.copy();
    for (int i = 0; i < hiddenGradient.rows; i++){
      for (int j = 0; j < hiddenGradient.cols; j++){
        float val = hiddenGradient.values[i][j];
        hiddenGradient.values[i][j] = dsigmoid(val);
      }
    }

    /**
     * 
     */
    hiddenGradient.multiply(hiddenErrors);
    hiddenGradient.multiply(LearningRate);

    Matrix inputT = Matrix.transpose(input);
    Matrix DIHWeights = Matrix.Product(hiddenGradient, inputT);

    IHWeights.add(DIHWeights);

    Hbias.add(hiddenGradient);
  }
}
