class Slider {
    int posX, posY;
    float limitMin, limitMax, span, val;
    String label;
    int id;
    boolean flagShowPercent;
    //-----------------------------------
    Slider(int x, int y, int sliderNum) {
        posX = x;
        posY = y;
        id = sliderNum; //each slider is given a unique number to keep from stepping on each other's toes
        setLimits(0.0, 1.0); //set min, max, and span
        val = 0.5; //default value
        label = "Label " + id; //default blank label
        flagShowPercent = true; //value is showed as a %
    }
    //-----------------------------------
    boolean mouseOver() {
        //just returns whether or not the mouse is currently positioned over the slider
        return ( mouseX > posX && mouseX < posX + base.width &&
            mouseY > posY && mouseY < posY + base.height );
    }
    //-----------------------------------
    void setLimits(float sliderMin, float sliderMax) {
        limitMin = sliderMin;
        limitMax = sliderMax;
        span = limitMax - limitMin;
    }
    //-----------------------------------
    void check() {
        if (activeSlider == id) //the mouse is controlling this slider - adjust accordingly
            val = constrain((limitMax - limitMin) * (mouseX - posX - 10) / bar.width + limitMin, limitMin, limitMax);

        pushMatrix();
        //position and draw the base first
        translate(posX, posY);
        image(base, 0, 0); 

        //draw the label
        textSize(11);
        textAlign(LEFT, CENTER);
        text(label, 12, 12);

        //show the bar and the handle
        float handleX = (val - limitMin)/(limitMax - limitMin)*bar.width;
        image(bar, 10, 30, handleX, bar.height); //this just squishes the bar (yuck)
        image(handle, handleX - 10, 17);

        if (activeSlider == id) { //mouse is in control - show the "tool-tip" value
            textSize(9);
            textAlign(CENTER, CENTER);
            image(tip, handleX - 9, 4);
            if (flagShowPercent) text(int(val*100)+"%", handleX + 12, 12);
            else text(int(val), handleX + 12, 12);
        }
        popMatrix();
    }
}