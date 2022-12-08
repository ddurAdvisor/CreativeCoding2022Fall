int t, x, y, a=-30, b=-a, C;
size(720, 720);
for (t=0; t<999; t++) {
  fill(C=#104010+(t%255<<24));
  stroke(C*2);
  ellipse(cos(t*.03)+sin(t*t)*99, sin(t*.01)*30+30, tan(t*.3)*9, tan(t*.8)*9);
}
for (y=0; y<720+(b=-b); y+=60)for (x=0; x<810; x+=60)copy(0, 0, 60, 60, x-(a=-a), y+30-b, a*2, b*2);
