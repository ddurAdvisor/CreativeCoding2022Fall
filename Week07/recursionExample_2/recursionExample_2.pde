
void setup() {
	size(800,800);
	smooth();
}

void draw() {
	background(255);
	drawCircle(width/2,height/2,width/2);
}

void drawCircle(float x, float y, float radius) {
	stroke(0);
	noFill();
	ellipse(x, y, radius, radius);

	if(radius > 2) {
						//drawCircle() calls itself twice, creating a
						//branching effect. For every circle, a
						//smaller circle is drawn to the left and the
						//right.
		drawCircle(x + radius/2, y, radius/2);
		drawCircle(x - radius/2, y, radius/2);
	}
}
