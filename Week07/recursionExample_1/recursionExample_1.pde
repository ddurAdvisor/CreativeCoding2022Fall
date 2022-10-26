void setup() {
  size(800, 600);
}

void draw() {
  background(175);
  println(factorial(4));
}

int factorial(int n) {
  if (n == 1) {
    return 1;
  } else {
    return n * factorial(n-1);
  }
}
