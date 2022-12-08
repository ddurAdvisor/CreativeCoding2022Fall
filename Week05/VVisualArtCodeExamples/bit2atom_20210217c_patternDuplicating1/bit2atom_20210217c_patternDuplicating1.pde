float t, X, Y, T;
int s;
void setup() {
  size(720, 720);
  stroke(0, 99);
}
void draw() {
  t+=.02;
  if (t%7>TAU)
    copy(s=int(t%7)/3, 0, 720, 720, -s, 0, 720, 720); 
  else
    line(cos(t)*sin(t)*130+600, asin(sin(t))*200+360, cos(T=t+noise(int(t/7))*9)*sin(T)*130+600, asin(sin(T))*200+360);
}
