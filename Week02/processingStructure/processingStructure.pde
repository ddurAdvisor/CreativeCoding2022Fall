/**
*
*程序注释
*@author
*@from
*/

int c;

//调用系统方法
void setup(){
  //设置画面尺寸，width = 600, height = 600;
  size(600, 600);
  //打印文本
  println("hello world!");
  calculate(10, 25);
  //打印计算结果
  println("c = " + c);
}

//自定义方法：计算加和
void calculate(int a, int b){
  //计算a加b之和并将值赋予给变量c
  c = a + b;
}
