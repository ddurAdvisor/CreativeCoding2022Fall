float i, r, f, I; 
void setup() { 
  size(500, 500); 
  noStroke(); 
  fill(-1, 20); 
  blendMode(ADD);
} 
void draw() { 
  clear(); 
  f++; 
  for (i=0; i<TAU; i+=.01) {  
    for (r=f%50; r<500; r+=50) {  
      circle(250+r*cos(I=i+f/99*noise(i, r-f)), 250+r*sin(I), 9);
    }
  }
}
