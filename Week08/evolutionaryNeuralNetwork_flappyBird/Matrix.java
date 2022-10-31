/*
* @Author: bit2atom | SJTU-ChinaGold DesignIntelligence
* @Email:  zhanglliqun@gmail.com
* @Date:   2022-10-31 18:16:39
* @brief
* @Last Modified by:   bit2atommac2019
* @Last Modified time: 2022-10-31 22:57:02
* @detail
*/

/**
 * Matrix
 */
class Matrix{
  int rows, cols;
  float[][] values;

  /**
   * [Matrix description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:52:16+0800
   * @param    {[type]}                 int rows [description]
   * @param    {[type]}                 int cols [description]
   */
  Matrix(int rows, int cols){
    this.rows = rows;
    this.cols = cols;
    values = new float[this.rows][this.cols];
  }

  Matrix(){
    rows = 1;
    cols = 1;
    values = new float[rows][cols];
  }

  Matrix copy(){
    Matrix result = new Matrix(rows, cols);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.values[i][j] = values[i][j];
      }
    }
    return result;
  }

  /**
   * [stringify description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:52:38+0800
   * @param    {[type]}                 Matrix a             [description]
   * @return   {[type]}                        [description]
   */
  static String[][] stringify(Matrix a){
    String[][] result = new String[a.rows][a.cols];
    for (int i = 0; i < a.rows; i++){
      for (int j = 0; j < a.cols; j++){
        result[i][j] = i+" " + j+" " + a.values[i][j]+" ";
      }
    }
    return result;
  }

  /**
   * [multiply description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:52:43+0800
   * @param    {[type]}                 float n             [description]
   * @return   {[type]}                       [description]
   */
  void multiply(float n){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        values[i][j] *= n;
      }
    }
  }

  /**
   * [add description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:52:51+0800
   * @param    {[type]}                 float n [description]
   */
  void add(float n){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        values[i][j] += n;
      }
    }
  }

  /**
   * [random description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:52:56+0800
   * @param    {[type]}                 int rows          [description]
   * @param    {[type]}                 int cols          [description]
   * @return   {[type]}                     [description]
   */
  static Matrix random(int rows, int cols){
    Matrix result = new Matrix(rows, cols);
    result.randomize();
    return result;
  }

  /**
   * [randomize description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:53:01+0800
   * @return   {[type]}                 [description]
   */
  void randomize(){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        values[i][j] = (float) Math.random() * 2 - 1;
      }
    }
  }

  /**
   * [subtract description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:53:08+0800
   * @param    {[type]}                 Matrix a             [description]
   * @param    {[type]}                 Matrix b             [description]
   * @return   {[type]}                        [description]
   */
  static Matrix subtract(Matrix a, Matrix b){
    Matrix result = new Matrix(a.rows, a.cols);
    for (int i = 0; i < a.rows; i++){
      for (int j = 0; j < a.cols; j++){
        result.values[i][j] = a.values[i][j] - b.values[i][j];
      }
    }

    return result;
  }

  /**
   * [FromArray description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:53:16+0800
   * @param    {[type]}                 float[] arr [description]
   */
  static Matrix FromArray(float[] arr){
    Matrix result = new Matrix(arr.length, 1);
    for (int i = 0; i < result.rows; i++){
      result.values[i][0] = arr[i];
    }
    return result;
  }

  /**
   * [toArray description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:53:21+0800
   * @return   {[type]}                 [description]
   */
  float[] toArray(){
    float[] arr = new float[rows+cols];
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        arr[i] = values[i][j];
      }
    }
    return arr;
  }

  /**
   * [add description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:53:26+0800
   * @param    {[type]}                 Matrix other [description]
   */
  void add(Matrix other){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        values[i][j] += other.values[i][j];
      }
    }
  }

  /**
   * [multiply description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:53:32+0800
   * @param    {[type]}                 Matrix other         [description]
   * @return   {[type]}                        [description]
   */
  void multiply(Matrix other){
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < cols; j++){
        values[i][j] *= other.values[i][j];
      }
    }
  }

  /**
   * [transpose description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:53:42+0800
   * @param    {[type]}                 Matrix a             [description]
   * @return   {[type]}                        [description]
   */
  static Matrix transpose(Matrix a){
    Matrix result = new Matrix(a.cols, a.rows);
    for (int i = 0; i < a.rows; i++){
      for (int j = 0; j < a.cols; j++){
        result.values[j][i] = a.values[i][j];
      }
    }
    return result;
  }

  /**
   * [Product description]
   * @Author   bit2atom
   * @DateTime 2022-10-31T22:53:46+0800
   * @param    {[type]}                 Matrix first  [description]
   * @param    {[type]}                 Matrix second [description]
   */
  static Matrix Product(Matrix first, Matrix second){
    if (first.cols != second.rows){
      return null;
    } else{
      Matrix a = first;
      Matrix b = second;
      Matrix result = new Matrix(a.rows, b.cols);
      for (int i = 0; i < result.rows; i++){
        for (int j = 0; j < result.cols; j++){
          float sum = 0;
          for (int k = 0; k < a.cols; k++){
            sum += a.values[i][k] * b.values[k][j];
          }
          result.values[i][j] = sum;
        }
      }
      return result;
    }
  }
}
