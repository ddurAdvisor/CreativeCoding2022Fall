size(720, 720); 
clear(); 
noStroke(); 
for (float r=TAU*9; r>-TAU*4; r-=.01) { 
  fill(128-r*(r>0?2:9), abs(r)*5, 60-r*(r>0?1:5)); 
  push(); 
  translate(cos(r)*r*5+360, sin(r)*r*5+360); 
  rotate(r*r/9); 
  ellipse(sin(r>0?r*19:r/4)*99, 0, sin(r*r)*70, sin(r*r)*7); 
  pop();
}
