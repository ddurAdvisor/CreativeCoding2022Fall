int tracerNum = 10;
ArrayList tracers;
boolean FADE = true;

void setup(){
  size(800,800,P3D);
  smooth();
  colorMode(RGB,100);
  background(100);
  reset();
}

void draw(){
  //background(100);
  //fade(1);
  
  for (int i = 0 ; i<tracers.size() ; i++)  {
    Tracer tracer = (Tracer) tracers.get(i);
    tracer.draw();
    tracer.calculate();
    if (random(100)>96) tracers.add(new Tracer(tracer));
    if (!tracer.ALIVE) tracers.remove(i);
  }
  
  if(tracers.size()==0) reset();

}

void fade(int trans){
  noStroke();
  fill(100,trans);
  rect(0,0,width,height);
}

void reset(){
  if (FADE) fade(60);
  else if (!FADE) background(100);
  tracers = new ArrayList();
  for (int i = 0 ; i<tracerNum ; i++)
  tracers.add(new Tracer());
  
  float MAX = height;
  
  for (int i = 0 ; i<tracers.size() ; i++)
  {
    Tracer tracer = (Tracer) tracers.get(i);
    if (tracer.pos.y<MAX) MAX = tracer.pos.y;
  }
  
  stroke(0);
  fill(0);
  beginShape();
  vertex(width/2-5,height);
  vertex(width/2+5,height);
  vertex(width/2-1,MAX);
  vertex(width/2+1,MAX);
  endShape();  
}

void keyPressed(){
  if (key=='p'||key=='P') println(tracers.size());
  if (key=='f'||key=='F') FADE=!FADE;
}

void mousePressed(){
  reset();
}
