//noise()
//random()
int count;
float noiseTag = 0.5;
float increment = 0.01;

void setup(){
  size(900, 600);
  background(255);
}

void draw(){
  background(255);
  float y = random(50);//random(1)*50;//[0, 1)
  float yNoise = noise(noiseTag)*150;
  
  noiseTag += increment;
  
  //stroke(0);
  //point(count, y+height/2);
  
  //stroke(20, 0, 255);
  //point(count, yNoise+height*3/4);
  fill(20, 0, 255);
  ellipse(width/2, yNoise+height/2, 50, 50);
  
  count ++;
  println("count: " + count + " | yRandom: " + y + " | yNoise: " + yNoise);//string
}
