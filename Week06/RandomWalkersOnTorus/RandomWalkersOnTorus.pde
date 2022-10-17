////////////////////////////////////////////////
// surface
////////////////////////////////////////////////
////////////////////////////////////////////////
int N = 1;
Mover[] mover = new Mover[N];
////////////////////////////////////////////////
int Nu = 80;
int Nv = 20;

float Lu = PI;
float Lv = PI;

float Ra = 280;
float Rb = 120;

float angle = 0;
////////////////////////////////////////////////
void setup(){
  size(600,600,P3D);
  colorMode(HSB);
  for(int i = 0; i < N; i++){
    //mover[i] = new Mover(random(-Lu,Lu),random(-Lv,Lv));
    mover[i] = new Mover(0,PI);
  }
}
////////////////////////////////////////////////
void draw(){
  background(0);
  translate(width/2, height/2, -width/2);
  lights();
  rotateX(angle);
  rotateY(angle*0.3);
  float rotx = map(mouseX,0,width,-PI,PI);
  float roty = map(mouseY,0,width,-PI,PI);
  rotateX(roty);
  rotateZ(rotx);
  angle += 0.01;
  
  for(int i = 0; i < N; i++){
    mover[i].show();
    mover[i].move();
  }
  
}
